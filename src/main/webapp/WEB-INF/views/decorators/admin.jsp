<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> | Admin Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
    <sitemesh:write property='head'/>
</head>
<body class="d-flex flex-column" style="min-height:100vh;">

<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg admin-navbar fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand me-4" href="${pageContext.request.contextPath}/admin/dashboard">
            <span class="brand-badge"><i class="bi bi-layers-fill"></i></span>
            <span>AdminPortal</span>
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item me-3">
                    <span class="nav-user-badge">
                        <i class="bi bi-person-fill text-muted"></i>
                        <span>${pageContext.request.userPrincipal != null ? pageContext.request.userPrincipal.name : 'Administrator'}</span>
                    </span>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/logout" method="post" class="d-inline">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-light btn-sm text-muted">
                            <i class="bi bi-box-arrow-right me-1"></i> Sign Out
                        </button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="d-flex" style="flex:1;">
    <!-- Sidebar -->
    <aside class="admin-sidebar" id="sidebar">
        <span class="sidebar-label">Main Navigation</span>
        <ul class="nav flex-column mb-3">
            <li class="nav-item">
                <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="bi bi-grid-1x2"></i>
                    <span>Dashboard</span>
                </a>
            </li>
        </ul>

        <span class="sidebar-label">Management</span>
        <ul class="nav flex-column mb-4">
            <li class="nav-item">
                <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/admin/categories">
                    <i class="bi bi-folder2-open"></i>
                    <span>Categories</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/admin/users">
                    <i class="bi bi-people"></i>
                    <span>Users</span>
                </a>
            </li>
        </ul>

        <div class="mt-auto pt-3 border-top border-secondary border-opacity-25">
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="nav-link sidebar-link text-danger border-0 bg-transparent w-100 text-start">
                    <i class="bi bi-sign-out"></i>
                    <span>Logout</span>
                </button>
            </form>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="admin-content flex-grow-1">
        <sitemesh:write property='body'/>
    </main>
</div>

<!-- Footer -->
<footer class="admin-footer text-center">
    <div class="container-fluid">
        &copy; 2026 Admin Portal &bull; Clean & Modern Management Framework
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
