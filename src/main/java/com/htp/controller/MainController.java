package com.htp.controller;

import com.htp.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class MainController {

    @GetMapping("/")
    public String greeting(@AuthenticationPrincipal User user, Map<String, Object> model) {
        model.put("user", user);
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @AuthenticationPrincipal User user,
            Map<String, Object> model) {
        model.put("users", user);
        return "main";
    }

    @GetMapping("/forms")
    public String forms() {
        return "formsList";
    }

}