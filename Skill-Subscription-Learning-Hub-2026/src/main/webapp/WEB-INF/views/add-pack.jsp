<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Skill Pack — Skill Hub</title>
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
        <a href="/packs">Packs</a>
        <a href="/subscriptions">My Subscriptions</a>
    </div>
</nav>

<!-- PAGE -->
<div class="page">
    <div class="form-page-card">

        <a href="/packs" class="back-link">&#8592; Back to Packs</a>

        <h2>&#43; Add Skill Pack</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-error">&#9888; ${error}</div>
        </c:if>

        <form action="/add-pack" method="post">

            <div class="form-group">
                <label for="title">Pack Title</label>
                <input type="text" id="title" name="title" placeholder="e.g. Java Masterclass" required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Describe what learners will gain..." rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label for="price">Price (&#8377;)</label>
                <input type="number" id="price" name="price" placeholder="e.g. 999" min="0" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Save Pack</button>

        </form>

    </div>
</div>

</body>
</html>
