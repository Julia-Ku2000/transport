package com.htp.controller;

import com.htp.Utils.ControllerUtils;
import com.htp.domain.TransportRegistrationForm;
import com.htp.domain.User;
import com.htp.service.TransportRegistrationFormService;
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
@RequestMapping("/transportRegistrationForm")
public class TransportRegistrationFormController {

    private UserService userService;

    private TransportRegistrationFormService transportRegistrationFormService;

    public TransportRegistrationFormController(UserService userService, TransportRegistrationFormService transportRegistrationFormService) {
        this.userService = userService;
        this.transportRegistrationFormService = transportRegistrationFormService;
    }

    @GetMapping
    public String listTransportRegistrationForm(
            @AuthenticationPrincipal User user,
            Model model, @PageableDefault(size = 5, sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<TransportRegistrationForm> page = transportRegistrationFormService.findAllByUserId(user.getId(), pageable);
        model.addAttribute("page", page);
        return "transportRegistrationFormList";
    }

    @GetMapping("/unconfirmed")
    public String listUnconfirmedTransportRegistrationFormList(Model model, @PageableDefault(size = 5, sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<TransportRegistrationForm> page = transportRegistrationFormService.findAllUnconfirmed(pageable);
        model.addAttribute("page", page);
        return "transportRegistrationFormList";
    }

    @GetMapping("/addTransportRegistrationForm")
    public String addTransportRegistrationForm() {
        return "addTransportRegistrationForms";
    }

    @GetMapping("{transportRegistrationFormId}")
    public String editTransportRegistrationForm(@PathVariable Long transportRegistrationFormId, Model model) {
        model.addAttribute("transportRegistrationForm", transportRegistrationFormService.findById(transportRegistrationFormId));
        return "transportRegistrationFormEdit";
    }

    @PostMapping("/saveTransportRegistrationForm")
    public String updateTransportRegistrationForm(@Valid @ModelAttribute TransportRegistrationForm transportRegistrationFormRequest, BindingResult bindingResult, Model model,
                                                  @AuthenticationPrincipal User user,
                                                  @RequestParam("transportRegistrationFormId") Long transportRegistrationFormId) {
        TransportRegistrationForm transportRegistrationForm = transportRegistrationFormService.findById(transportRegistrationFormId);

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("transportRegistrationForm", transportRegistrationForm);

            return "transportRegistrationFormEdit";

        } else {
            transportRegistrationFormService.update(transportRegistrationForm, transportRegistrationFormRequest, user);

            if (transportRegistrationForm.isConfirmed() || user.isAdmin()) {
                return "redirect:/transportRegistrationForm/unconfirmed";
            }

            return "redirect:/transportRegistrationForm";
        }


    }

    @PostMapping("/addTransportRegistrationForm")
    public String addTransportRegistrationForm(
            @AuthenticationPrincipal User authUser, @Valid TransportRegistrationForm transportRegistrationForm, BindingResult bindingResult,
            Model model) {

        User user = userService.findById(authUser.getId());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("transportRegistrationForm", transportRegistrationForm);

            return "addTransportRegistrationForms";

        } else {
            transportRegistrationFormService.save(transportRegistrationForm, user);

            return "redirect:/transportRegistrationForm";
        }
    }


    @PostMapping("/transportRegistrationForm/{id}")
    public String deleteTransportRegistrationForm(@PathVariable Long id) {
        transportRegistrationFormService.delete(id);
        return "redirect:/transportRegistrationForm";
    }

}
