<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register — Skill Hub</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="brand">
        <div class="logo-icon">&#9670;</div>
        Skill Hub
    </div>
    <div class="nav-links">
        <a href="/login">Login</a>
        <a href="/register">Register</a>
    </div>
</nav>

<!-- PAGE -->
<div class="page">
    <div class="auth-card">

        <div class="auth-header">
            <div class="auth-icon">&#128100;</div>
            <h2>Create Account</h2>
            <p class="subtitle">Join thousands of learners today</p>
        </div>

        <!-- ERROR MESSAGE (shown when model has 'error') -->
        <c:if test="${not empty error}">
            <div class="alert alert-error">&#9888; ${error}</div>
        </c:if>

        <form action="/register" method="post">

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="John Doe" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="john@example.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a strong password" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Create Account</button>

        </form>

        <div class="divider">or</div>

        <p class="text-center text-muted">
            Already have an account? <a href="/login">Sign in</a>
        </p>

    </div>
</div>

</body>
</html>
