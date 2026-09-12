<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<div class="page-header d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h3 mb-1 fw-bold">Dashboard</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item active">Home</li>
            </ol>
        </nav>
    </div>
</div>

<!-- Stats Cards -->
<div class="row g-4 mb-4">
    <div class="col-xl-3 col-md-6">
        <div class="card stat-card stat-card-primary h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1 small">Total Categories</p>
                        <h2 class="fw-bold mb-0">${categoryCount}</h2>
                    </div>
                    <div class="stat-icon stat-icon-primary">
                        <i class="bi bi-tags-fill"></i>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/admin/categories" class="text-primary small mt-2 d-block">
                    View all <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="card stat-card stat-card-success h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1 small">Total Users</p>
                        <h2 class="fw-bold mb-0">${userCount}</h2>
                    </div>
                    <div class="stat-icon stat-icon-success">
                        <i class="bi bi-people-fill"></i>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/admin/users" class="text-success small mt-2 d-block">
                    View all <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="card stat-card stat-card-warning h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1 small">System Status</p>
                        <h2 class="fw-bold mb-0 text-success"><i class="bi bi-check-circle-fill"></i></h2>
                    </div>
                    <div class="stat-icon stat-icon-warning">
                        <i class="bi bi-server"></i>
                    </div>
                </div>
                <span class="text-success small mt-2 d-block">Online</span>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="card stat-card stat-card-info h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1 small">Spring Boot</p>
                        <h2 class="fw-bold mb-0" style="font-size: 1.2rem;">4.x</h2>
                    </div>
                    <div class="stat-icon stat-icon-info">
                        <i class="bi bi-gear-fill"></i>
                    </div>
                </div>
                <span class="text-info small mt-2 d-block">Java 25 / MySQL</span>
            </div>
        </div>
    </div>
</div>

<!-- Quick Actions -->
<div class="row g-4">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0"><i class="bi bi-lightning-charge me-2 text-warning"></i>Quick Actions</h5>
            </div>
            <div class="card-body">
                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}/admin/categories/create"
                       class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-plus-circle me-2"></i>Add New Category
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/users/create"
                       class="btn btn-outline-success btn-sm">
                        <i class="bi bi-person-plus me-2"></i>Add New User
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0"><i class="bi bi-info-circle me-2 text-info"></i>System Info</h5>
            </div>
            <div class="card-body">
                <table class="table table-sm table-borderless mb-0">
                    <tr>
                        <td class="text-muted">Framework</td>
                        <td class="fw-medium">Spring Boot 4.x</td>
                    </tr>
                    <tr>
                        <td class="text-muted">Language</td>
                        <td class="fw-medium">Java 25</td>
                    </tr>
                    <tr>
                        <td class="text-muted">Database</td>
                        <td class="fw-medium">MySQL 8</td>
                    </tr>
                    <tr>
                        <td class="text-muted">Template</td>
                        <td class="fw-medium">JSP + SiteMesh 3</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
