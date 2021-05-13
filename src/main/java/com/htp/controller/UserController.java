package com.htp.controller;

import com.htp.Utils.ControllerUtils;
import com.htp.domain.Roles;
import com.htp.domain.User;
import com.htp.service.UserService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String userList(Model model) {

        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    @GetMapping("{userId}")
    public String userEditForm(@PathVariable Long userId, Model model) {
        User user = userService.findById(userId);
        model.addAttribute("user", user);
        model.addAttribute("roles", Roles.values());
        return "userEdit";
    }

    @PostMapping
    public String updateUserCredentials(@RequestParam("userId") Long userId,
                                        @RequestParam String username,
                                        @RequestParam String surname,
                                        @RequestParam Map<String, String> form) {

        userService.updateCredentials(userId, username, surname, form);
        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", userService.findById(user.getId()));
        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(@Valid User user,
                                BindingResult bindingResult, Model model, @RequestParam String username,
                                @RequestParam String surname, @RequestParam String patronymic,
                                @RequestParam String password, @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate dateOfBirth,
                                @RequestParam String passportSeriesNumber, @RequestParam String registrationAddress, @AuthenticationPrincipal User userId) {

        user = userService.findById(userId.getId());
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "profile";
        } else {
            userService.update(user, username, surname, patronymic, password, dateOfBirth, passportSeriesNumber, registrationAddress);
        }
        return "profile";
    }
}
