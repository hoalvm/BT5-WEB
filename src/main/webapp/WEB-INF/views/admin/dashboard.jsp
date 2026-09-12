<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h4 font-weight-bold text-dark mb-1 fw-bold">Dashboard Overview</h1>
        <p class="text-muted small mb-0">System performance, category counts and user overview.</p>
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/admin/categories/create" class="btn btn-primary btn-sm me-2">
            <i class="bi bi-plus-lg me-1"></i> New Category
        </a>
        <a href="${pageContext.request.contextPath}/admin/users/create" class="btn btn-light btn-sm">
            <i class="bi bi-person-plus me-1"></i> New User
        </a>
    </div>
</div>

<!-- Stats Cards -->
<div class="row g-3 mb-4">
    <div class="col-xl-3 col-md-6">
        <div class="stat-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted small fw-semibold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.5px;">Categories</span>
                <div class="stat-icon stat-icon-indigo">
                    <i class="bi bi-folder2-open"></i>
                </div>
            </div>
            <h3 class="fw-bold mb-1" style="color: #0f172a;">${categoryCount}</h3>
            <a href="${pageContext.request.contextPath}/admin/categories" class="text-decoration-none small text-primary fw-medium">
                Manage categories <i class="bi bi-arrow-right"></i>
            </a>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="stat-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted small fw-semibold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.5px;">Total Users</span>
                <div class="stat-icon stat-icon-emerald">
                    <i class="bi bi-people"></i>
                </div>
            </div>
            <h3 class="fw-bold mb-1" style="color: #0f172a;">${userCount}</h3>
            <a href="${pageContext.request.contextPath}/admin/users" class="text-decoration-none small text-success fw-medium">
                Manage users <i class="bi bi-arrow-right"></i>
            </a>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="stat-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted small fw-semibold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.5px;">System Status</span>
                <div class="stat-icon stat-icon-sky">
                    <i class="bi bi-shield-check"></i>
                </div>
            </div>
            <h3 class="fw-bold mb-1 text-success" style="font-size: 1.25rem;">Active</h3>
            <span class="text-muted small">Role: ROLE_ADMIN</span>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="stat-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted small fw-semibold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.5px;">Environment</span>
                <div class="stat-icon stat-icon-amber">
                    <i class="bi bi-cpu"></i>
                </div>
            </div>
            <h3 class="fw-bold mb-1" style="color: #0f172a; font-size: 1.15rem;">Java 25</h3>
            <span class="text-muted small">Spring Boot 4.x / WAR</span>
        </div>
    </div>
</div>

<!-- Quick Overview Panels -->
<div class="row g-3">
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="card-title mb-0">Quick Management</h5>
            </div>
            <div class="card-body">
                <div class="list-group list-group-flush">
                    <a href="${pageContext.request.contextPath}/admin/categories" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-0 py-3 border-bottom">
                        <div class="d-flex align-items-center">
                            <div class="stat-icon stat-icon-indigo me-3" style="width:36px; height:36px; font-size:1rem;">
                                <i class="bi bi-tag"></i>
                            </div>
                            <div>
                                <h6 class="mb-0 fw-semibold">Category Directory</h6>
                                <small class="text-muted">Create, update or delete product categories</small>
                            </div>
                        </div>
                        <i class="bi bi-chevron-right text-muted"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/users" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-0 py-3">
                        <div class="d-flex align-items-center">
                            <div class="stat-icon stat-icon-emerald me-3" style="width:36px; height:36px; font-size:1rem;">
                                <i class="bi bi-person-gear"></i>
                            </div>
                            <div>
                                <h6 class="mb-0 fw-semibold">User Access Control</h6>
                                <small class="text-muted">Manage system users, roles and passwords</small>
                            </div>
                        </div>
                        <i class="bi bi-chevron-right text-muted"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header">
                <h5 class="card-title mb-0">System Architecture</h5>
            </div>
            <div class="card-body p-0">
                <table class="table table-clean mb-0">
                    <tbody>
                        <tr>
                            <td class="text-muted fw-medium">Framework</td>
                            <td class="fw-semibold text-end">Spring Boot 4.x (WAR)</td>
                        </tr>
                        <tr>
                            <td class="text-muted fw-medium">Security</td>
                            <td class="fw-semibold text-end">Spring Security 7 + BCrypt</td>
                        </tr>
                        <tr>
                            <td class="text-muted fw-medium">Persistence</td>
                            <td class="fw-semibold text-end">Spring Data JPA / MySQL</td>
                        </tr>
                        <tr>
                            <td class="text-muted fw-medium">View Engine</td>
                            <td class="fw-semibold text-end">JSP + SiteMesh 3 Decorator</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
