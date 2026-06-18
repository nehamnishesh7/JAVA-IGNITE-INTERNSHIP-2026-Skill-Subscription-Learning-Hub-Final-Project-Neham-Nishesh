package com.skills.hub.service.impl;

import com.skills.hub.model.User;
import com.skills.hub.repository.UserRepository;
import com.skills.hub.service.UserService;
import org.springframework.stereotype.Service;

/*
=========================================================
WHAT IS THIS CLASS?
=========================================================

This class contains BUSINESS LOGIC for users.

 Controller calls this
 This class talks to repository

=========================================================
*/

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepo;

    public UserServiceImpl(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public User registerUser(User user) {

        // =========================
        // TASK
        // =========================
        // STEP 1: check if email already exists
        // STEP 2: if exists → stop process
        // STEP 3: if not → save user to DB
        // STEP 4: return saved user

        if (user.getName() == null || user.getName().trim().isEmpty()) {
            return null;
        }
        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            return null;
        }
        if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
            return null;
        }
        if (!user.getEmail().contains("@")) {
            return null;
        }
        User existing = userRepo.findByEmail(user.getEmail());
        if (existing != null) {
            return null;
        }
        return userRepo.save(user);
    }

    @Override
    public User login(String email, String password) {

        // =========================
        // TASK
        // =========================
        // STEP 1: find user by email
        // STEP 2: if user not found → return null
        // STEP 3: check password match
        // STEP 4: if correct → return user
        // STEP 5: else → return null

        if (email == null || email.trim().isEmpty()) {
            return null;
        }
        if (password == null || password.trim().isEmpty()) {
            return null;
        }
        User user = userRepo.findByEmail(email);
        if (user == null) {
            return null;
        }
        if (user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}