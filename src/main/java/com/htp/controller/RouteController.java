package com.htp.controller;

import com.htp.Utils.ControllerUtils;
import com.htp.domain.Route;
import com.htp.domain.User;
import com.htp.service.RouteService;
import com.htp.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/route")
public class RouteController {

    private RouteService routeService;

    private UserService userService;

    public RouteController(RouteService routeService, UserService userService) {
        this.routeService = routeService;
        this.userService = userService;
    }

    @GetMapping
    public String listRoutes(
            @AuthenticationPrincipal User user,
            Model model, @PageableDefault(size = 5, sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {

        Page<Route> page = routeService.findAllByUserId(user.getId(), pageable);
        model.addAttribute("page", page);
        return "routeList";
    }

    @GetMapping("/unconfirmed")
    public String listUnconfirmedRoutes(Model model, @PageableDefault(size = 5, sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Route> page = routeService.findAllUnconfirmed(pageable);
        model.addAttribute("page", page);
        return "routeList";
    }

    @GetMapping("/addRoute")
    public String addRoute() {
        return "addRoute";
    }

    @GetMapping("{routeId}")
    public String routeEdit(@PathVariable Long routeId, Model model) {
        model.addAttribute("route", routeService.findById(routeId));
        return "routeEdit";
    }

    @PostMapping("/saveRoute")
    public String updateRoute(@AuthenticationPrincipal User user, @Valid @ModelAttribute Route routeRequest, BindingResult bindingResult,
                                        Model model, @RequestParam("routeId") Long routeId) {

        Route route = routeService.findById(routeId);
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("route", route);

            return "routeEdit";

        } else {
            routeService.update(route, routeRequest);

            if (route.isConfirmed() || user.isAdmin()) {
                return "redirect:/route/unconfirmed";
            }
            return "redirect:/route";
        }
    }

    @PostMapping("/addRoute")
    public String addRoute(
            @AuthenticationPrincipal User authUser, @Valid Route route, BindingResult bindingResult,
            Model model) {

        User user = userService.findById(authUser.getId());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("route", route);

            return "addRoute";

        } else {
            routeService.save(route, user);

            return "redirect:/route";
        }
    }

    @PostMapping("/route/{id}")
    public String deleteRoute(@PathVariable Long id) {
        routeService.delete(id);
        return "redirect:/route";
    }
}
