package com.skills.hub.controller;

import com.skills.hub.model.User;
import com.skills.hub.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/*
=========================================================
WHAT IS THIS FILE?
Handles user actions like register and login
=========================================================
*/

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegisterPage() {

        // =========================
        // TASK
        // =========================
        // STEP 1: Return register page

        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {

        // =========================
        //TASK
        // =========================
        // STEP 1: call service.registerUser(user)
        // STEP 2: if success → redirect to login
        // STEP 3: else → stay on register page

        User saved = userService.registerUser(user);
        if (saved != null) {
            return "redirect:/login";
        }
        model.addAttribute("error", "Email already registered. Please login.");
        return "register";
    }

    @GetMapping("/login")
    public String showLoginPage() {

        // STEP 1: return login page

        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                         @RequestParam String password,
                         Model model) {

        // =========================
        // PSEUDO CODE
        // =========================
        // STEP 1: call userService.login(email, password)
        // STEP 2: if user != null → redirect /packs
        // STEP 3: else → return login page again

        User user = userService.login(email, password);
        if (user != null) {
            return "redirect:/packs";
        }
        model.addAttribute("error", "Invalid email or password.");
        return "login";
    }

	public UserService getUserService() {
		return userService;
	}
}