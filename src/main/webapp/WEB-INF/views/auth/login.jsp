<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | Admin Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #0f172a;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #334155;
            padding: 1.5rem;
        }
        .login-card {
            background-color: #ffffff;
            border-radius: 16px;
            padding: 2.5rem;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.3), 0 8px 10px -6px rgba(0, 0, 0, 0.2);
        }
        .brand-badge {
            background-color: #eef2ff;
            color: #4f46e5;
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        .login-title {
            color: #0f172a;
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }
        .login-subtitle {
            color: #64748b;
            font-size: 0.875rem;
            margin-bottom: 1.75rem;
        }
        .form-label {
            font-weight: 600;
            font-size: 0.825rem;
            color: #1e293b;
            margin-bottom: 0.35rem;
        }
        .form-control {
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            padding: 0.65rem 0.875rem;
            font-size: 0.875rem;
            transition: all 0.15s ease;
        }
        .form-control:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.12);
        }
        .btn-submit {
            background-color: #4f46e5;
            border-color: #4f46e5;
            color: #ffffff;
            border-radius: 8px;
            padding: 0.7rem;
            font-weight: 600;
            font-size: 0.9rem;
            width: 100%;
            transition: all 0.15s ease;
        }
        .btn-submit:hover {
            background-color: #4338ca;
            border-color: #4338ca;
            color: #ffffff;
        }
        .alert {
            border-radius: 8px;
            font-size: 0.85rem;
            padding: 0.75rem 1rem;
        }
    </style>
</head>
<body>
    <div class="login-card text-center">
        <div class="brand-badge">
            <i class="bi bi-layers-fill"></i>
        </div>
        <h1 class="login-title">Welcome back</h1>
        <p class="login-subtitle">Please enter your credentials to sign in</p>

        <c:if test="${param.error != null}">
            <div class="alert alert-danger text-start d-flex align-items-center mb-3" role="alert">
                <i class="bi bi-exclamation-circle-fill me-2"></i>
                Invalid username or password.
            </div>
        </c:if>

        <c:if test="${param.logout != null}">
            <div class="alert alert-success text-start d-flex align-items-center mb-3" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i>
                You have been logged out.
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post" class="text-start">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username"
                       placeholder="admin" required autofocus>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="••••••••" required>
            </div>

            <button type="submit" class="btn btn-submit mb-3">
                Sign In
            </button>
            
            <p class="text-muted small mb-0 text-center">Development Account: <strong>admin</strong> / <strong>admin123</strong></p>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
