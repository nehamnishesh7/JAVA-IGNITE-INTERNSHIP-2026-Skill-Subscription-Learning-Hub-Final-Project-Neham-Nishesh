<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Packs — Skill Hub</title>
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
        <a href="/subscriptions/1">My Subscriptions</a>
        <a href="/add-pack">+ Add Pack</a>
    </div>
</nav>

<!-- PAGE -->
<div class="page-wide">

    <div class="section-header">
        <div>
            <h2>Available Skill Packs</h2>
            <p class="subtitle">Choose a course and start learning today</p>
        </div>
        <a href="/add-pack" class="btn btn-secondary">+ Add New Pack</a>
    </div>

    <c:if test="${param.error == 'already_subscribed'}">
        <div class="alert alert-error">&#9888; You are already subscribed to this pack.</div>
    </c:if>

    <!-- PACKS GRID -->
    <c:choose>
        <c:when test="${empty packs}">
            <div class="empty-state">
                <div class="empty-icon">&#128218;</div>
                <p>No skill packs available yet.</p>
                <a href="/add-pack" class="btn btn-primary">Add First Pack</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="packs-grid">
                <c:forEach var="pack" items="${packs}">
                    <div class="pack-card">
                        <div class="pack-title">${pack.title}</div>
                        <div class="pack-desc">${pack.description}</div>
                        <div class="pack-footer">
                            <span class="price-badge">&#8377; ${pack.price}</span>
                            <a href="/subscribe?userId=1&packId=${pack.id}" class="btn btn-success">
                                Subscribe &#10140;
                            </a>
                            <a href="/delete-pack/${pack.id}" class="btn btn-secondary">Delete</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>
