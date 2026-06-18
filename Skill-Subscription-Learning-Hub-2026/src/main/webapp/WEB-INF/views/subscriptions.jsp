<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Subscriptions — Skill Hub</title>
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
    </div>
</nav>

<!-- PAGE -->
<div class="page-wide">

    <div class="section-header">
        <div>
            <h2>My Subscriptions</h2>
            <p class="subtitle">Track your enrolled courses</p>
        </div>
        <a href="/packs" class="btn btn-secondary">Browse More Packs</a>
    </div>

    <c:choose>
        <c:when test="${empty subs}">
            <div class="empty-state">
                <div class="empty-icon">&#128218;</div>
                <p>You haven't subscribed to any packs yet.</p>
                <a href="/packs" class="btn btn-primary">Explore Skill Packs</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-wrapper">
                <table class="subs-table">
                    <thead>
                        <tr>
                            <th>Skill Pack</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${subs}">
                            <tr>
                                <td><strong>${s.skillPack.title}</strong></td>
                                <td>${s.startDate}</td>
                                <td>${s.endDate}</td>
                                <td>${s.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>
