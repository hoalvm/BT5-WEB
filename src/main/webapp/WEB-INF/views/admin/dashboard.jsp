<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

<!-- Header Banner -->
<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
    <div>
        <div class="d-flex align-items-center gap-2">
            <h1 class="h3 font-weight-extrabold text-dark mb-0 fw-bold" style="letter-spacing:-0.5px;">Control Center</h1>
            <span class="badge bg-primary text-white px-2 py-1 rounded-pill small fw-bold" style="font-size:0.7rem; background: var(--primary-gradient) !important;">VIP PRO</span>
        </div>
        <p class="text-muted small mb-0 mt-1">Real-time system overview, statistics and administration controls.</p>
    </div>
    <div class="d-flex gap-2">
        <a href="${pageContext.request.contextPath}/admin/categories/create" class="btn btn-primary">
            <i class="bi bi-plus-lg"></i> New Category
        </a>
        <a href="${pageContext.request.contextPath}/admin/users/create" class="btn btn-light">
            <i class="bi bi-person-plus-fill"></i> New User
        </a>
    </div>
</div>

<!-- VIP Stat Cards -->
<div class="row g-3 mb-4">
    <div class="col-xl-3 col-md-6">
        <div class="stat-card-vip">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div>
                    <span class="text-muted small fw-bold text-uppercase" style="font-size: 0.7rem; letter-spacing: 1px;">Categories</span>
                    <h2 class="fw-extrabold mb-0 mt-1" style="font-size: 2rem; color: #0f172a;">${categoryCount}</h2>
                </div>
                <div class="stat-icon-wrapper icon-gradient-indigo">
                    <i class="bi bi-tags-fill"></i>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-between pt-2 border-top">
                <span class="stat-trend-badge trend-up">
                    <i class="bi bi-graph-up-arrow"></i> Active DB
                </span>
                <a href="${pageContext.request.contextPath}/admin/categories" class="text-decoration-none small text-primary fw-bold">
                    Manage <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="stat-card-vip">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div>
                    <span class="text-muted small fw-bold text-uppercase" style="font-size: 0.7rem; letter-spacing: 1px;">Total Accounts</span>
                    <h2 class="fw-extrabold mb-0 mt-1" style="font-size: 2rem; color: #0f172a;">${userCount}</h2>
                </div>
                <div class="stat-icon-wrapper icon-gradient-emerald">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-between pt-2 border-top">
                <span class="stat-trend-badge trend-up">
                    <i class="bi bi-shield-check"></i> Encrypted
                </span>
                <a href="${pageContext.request.contextPath}/admin/users" class="text-decoration-none small text-success fw-bold">
                    Manage <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="stat-card-vip">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div>
                    <span class="text-muted small fw-bold text-uppercase" style="font-size: 0.7rem; letter-spacing: 1px;">System Health</span>
                    <h2 class="fw-extrabold mb-0 mt-1 text-success" style="font-size: 1.5rem;">Optimal</h2>
                </div>
                <div class="stat-icon-wrapper icon-gradient-sky">
                    <i class="bi bi-cpu-fill"></i>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-between pt-2 border-top">
                <span class="stat-trend-badge trend-live">
                    <i class="bi bi-activity"></i> 100% Uptime
                </span>
                <span class="text-muted small fw-semibold">Port 8080</span>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="stat-card-vip">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div>
                    <span class="text-muted small fw-bold text-uppercase" style="font-size: 0.7rem; letter-spacing: 1px;">Runtime Engine</span>
                    <h2 class="fw-extrabold mb-0 mt-1" style="font-size: 1.4rem; color: #0f172a;">Java 25</h2>
                </div>
                <div class="stat-icon-wrapper icon-gradient-amber">
                    <i class="bi bi-boxes"></i>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-between pt-2 border-top">
                <span class="text-muted small fw-semibold">Spring Boot 4.x</span>
                <span class="badge badge-vip-active">WAR Build</span>
            </div>
        </div>
    </div>
</div>

<!-- Management Shortcuts & System Info -->
<div class="row g-3">
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header bg-white d-flex align-items-center justify-content-between">
                <h5 class="card-title mb-0"><i class="bi bi-rocket-takeoff-fill text-primary me-2"></i>Quick Management Modules</h5>
            </div>
            <div class="card-body">
                <div class="list-group list-group-flush">
                    <a href="${pageContext.request.contextPath}/admin/categories" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-0 py-3 border-bottom">
                        <div class="d-flex align-items-center">
                            <div class="stat-icon-wrapper icon-gradient-indigo me-3" style="width:40px; height:40px; font-size:1.1rem;">
                                <i class="bi bi-tags"></i>
                            </div>
                            <div>
                                <h6 class="mb-0 fw-bold">Categories Directory</h6>
                                <small class="text-muted">Create, edit, search and delete product categories</small>
                            </div>
                        </div>
                        <i class="bi bi-chevron-right text-muted"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/users" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-0 py-3">
                        <div class="d-flex align-items-center">
                            <div class="stat-icon-wrapper icon-gradient-emerald me-3" style="width:40px; height:40px; font-size:1.1rem;">
                                <i class="bi bi-person-gear"></i>
                            </div>
                            <div>
                                <h6 class="mb-0 fw-bold">User Directory & Permissions</h6>
                                <small class="text-muted">Manage user roles, credentials and security active state</small>
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
            <div class="card-header bg-white">
                <h5 class="card-title mb-0"><i class="bi bi-layers-fill text-info me-2"></i>Enterprise Tech Stack</h5>
            </div>
            <div class="card-body p-0">
                <table class="table table-vip mb-0">
                    <tbody>
                        <tr>
                            <td class="text-muted fw-semibold">Framework Core</td>
                            <td class="fw-bold text-end text-dark">Spring Boot 4.x (WAR Packaging)</td>
                        </tr>
                        <tr>
                            <td class="text-muted fw-semibold">Security Model</td>
                            <td class="fw-bold text-end text-dark">Spring Security 7 + BCrypt Hashing</td>
                        </tr>
                        <tr>
                            <td class="text-muted fw-semibold">Database Persistence</td>
                            <td class="fw-bold text-end text-dark">Spring Data JPA / MySQL 8</td>
                        </tr>
                        <tr>
                            <td class="text-muted fw-semibold">Layout Decorator</td>
                            <td class="fw-bold text-end text-dark">SiteMesh 3 + Jakarta JSTL</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
