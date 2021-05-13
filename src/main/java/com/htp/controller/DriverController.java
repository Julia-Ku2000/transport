package com.htp.controller;

import com.htp.Utils.ControllerUtils;
import com.htp.domain.Driver;
import com.htp.domain.User;
import com.htp.service.DriverService;
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
@RequestMapping("/driver")
public class DriverController {

    private UserService userService;

    private DriverService driverService;

    public DriverController(UserService userService, DriverService driverService) {
        this.userService = userService;
        this.driverService = driverService;
    }

    @GetMapping
    public String listDriver(
            @AuthenticationPrincipal User user, Model model, @PageableDefault(size = 5, sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {

        Page<Driver> page = driverService.findAllByUserId(user.getId(), pageable);
        model.addAttribute("page", page);
        return "driverList";
    }

    @GetMapping("/unconfirmed")
    public String listUnconfirmedDriver(Model model, @PageableDefault(size = 5, sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Driver> page = driverService.findAllUnconfirmed(pageable);
        model.addAttribute("page", page);
        return "driverList";
    }

    @GetMapping("/addDriver")
    public String addDriver() {
        return "addDriver";
    }

    @GetMapping("{driverId}")
    public String editDriver(@PathVariable Long driverId, Model model) {
        model.addAttribute("driver", driverService.findById(driverId));
        return "driverEdit";
    }

    @PostMapping("/saveDriver")
    public String updateDriver(@Valid @ModelAttribute Driver driverRequest, BindingResult bindingResult, Model model,
                                            @AuthenticationPrincipal User user, @RequestParam("driverId") Long driverId) {

        Driver driver = driverService.findById(driverId);

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("driver", driver);

            return "driverEdit";

        } else if (ControllerUtils.checkExperienceOptions(driverRequest.isExperienceFromOneToThree(),
                driverRequest.isExperienceMoreThanThree(), driverRequest.isNoExperience())) {
            model.addAttribute("errorOptions", "Выберите минимум один вариант!");
            model.addAttribute("driver", driver);
            return "driverEdit";
        } else {
            driverService.update(driver, driverRequest);

            if (driver.isConfirmed() || user.isAdmin()) {
                return "redirect:/driver/unconfirmed";
            }

            return "redirect:/driver";
        }
    }

    @PostMapping("/addDriver")
    public String addDriver(
            @AuthenticationPrincipal User authUser, @Valid Driver driver, BindingResult bindingResult,
            Model model) {

        User user = userService.findById(authUser.getId());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("driver", driver);

            return "addDriver";

        } else if (ControllerUtils.checkExperienceOptions(driver.isNoExperience(),
                driver.isExperienceFromOneToThree(), driver.isExperienceMoreThanThree())) {
            model.addAttribute("errorOptions", "Выберите минимум один вариант!");
            model.addAttribute("driver", driver);

            return "addDriver";
        } else {
            driverService.save(driver, user);
            return "redirect:/driver";
        }
    }

    @PostMapping("/driver/{id}")
    public String deleteDriver(@PathVariable Long id) {
        driverService.delete(id);

        return "redirect:/driver";
    }
}
