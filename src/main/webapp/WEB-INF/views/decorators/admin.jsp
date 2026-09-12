<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> | Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
    <sitemesh:write property='head'/>
</head>
<body class="d-flex flex-column" style="min-height:100vh;">

<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark admin-navbar fixed-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/dashboard">
            <i class="bi bi-shield-check me-2"></i>Admin Panel
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item me-3">
                    <span class="nav-link text-light">
                        <i class="bi bi-person-circle me-1"></i>
                        ${pageContext.request.userPrincipal != null ? pageContext.request.userPrincipal.name : 'Admin'}
                    </span>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/logout" method="post" class="d-inline">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-outline-light btn-sm">
                            <i class="bi bi-box-arrow-right me-1"></i>Logout
                        </button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="d-flex" style="margin-top:56px; flex:1;">
    <!-- Sidebar -->
    <nav class="admin-sidebar" id="sidebar">
        <div class="sidebar-sticky pt-3">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="bi bi-speedometer2 me-2"></i>Dashboard
                    </a>
                </li>
                <li class="nav-item mt-2">
                    <small class="sidebar-heading text-uppercase px-3 text-muted" style="font-size:0.7rem;">Management</small>
                </li>
                <li class="nav-item">
                    <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/admin/categories">
                        <i class="bi bi-tags me-2"></i>Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/admin/users">
                        <i class="bi bi-people me-2"></i>Users
                    </a>
                </li>
                <li class="nav-item border-top mt-3 pt-2">
                    <form action="${pageContext.request.contextPath}/logout" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="nav-link sidebar-link text-danger border-0 bg-transparent w-100 text-start">
                            <i class="bi bi-box-arrow-left me-2"></i>Logout
                        </button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="admin-content flex-grow-1">
        <div class="container-fluid p-4">
            <sitemesh:write property='body'/>
        </div>
    </main>
</div>

<!-- Footer -->
<footer class="text-center text-muted py-2" style="font-size:0.8rem; border-top:1px solid #eee;">
    &copy; 2025 Admin CRUD &mdash; Spring Boot 4.x + JSP + SiteMesh
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
