<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | VIP Admin Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #090d16;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #f8fafc;
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
        }

        /* Ambient Glow Spheres */
        .glow-sphere-1 {
            position: absolute;
            top: -150px;
            left: -150px;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.25) 0%, rgba(139, 92, 246, 0.05) 60%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .glow-sphere-2 {
            position: absolute;
            bottom: -150px;
            right: -150px;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(217, 70, 239, 0.2) 0%, rgba(99, 102, 241, 0.05) 60%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .login-card {
            background: rgba(17, 24, 39, 0.75);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            padding: 3rem 2.5rem;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.7), 0 0 40px rgba(99, 102, 241, 0.15);
            position: relative;
            z-index: 10;
        }

        .brand-icon-vip {
            width: 64px;
            height: 64px;
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #d946ef 100%);
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: #ffffff;
            margin: 0 auto 1.25rem;
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
        }

        .login-title {
            color: #ffffff;
            font-size: 1.75rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.35rem;
        }

        .login-subtitle {
            color: #94a3b8;
            font-size: 0.9rem;
            margin-bottom: 2rem;
        }

        .form-label {
            font-weight: 700;
            font-size: 0.825rem;
            color: #e2e8f0;
            margin-bottom: 0.4rem;
        }

        .form-control {
            background: rgba(15, 23, 42, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            padding: 0.75rem 1rem;
            font-size: 0.9rem;
            color: #ffffff;
            transition: all 0.2s ease;
        }

        .form-control:focus {
            background: rgba(15, 23, 42, 0.85);
            border-color: #8b5cf6;
            color: #ffffff;
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.25);
        }

        .form-control::placeholder {
            color: #64748b;
        }

        .btn-vip-login {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #d946ef 100%);
            border: none;
            border-radius: 12px;
            padding: 0.8rem;
            font-weight: 700;
            font-size: 0.95rem;
            color: #ffffff;
            width: 100%;
            transition: all 0.25s ease;
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.35);
        }

        .btn-vip-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(99, 102, 241, 0.5);
            color: #ffffff;
        }

        .alert {
            border-radius: 12px;
            font-size: 0.875rem;
            padding: 0.75rem 1rem;
        }
    </style>
</head>
<body>
    <div class="glow-sphere-1"></div>
    <div class="glow-sphere-2"></div>

    <div class="login-card text-center">
        <div class="brand-icon-vip">
            <i class="bi bi-shield-lock-fill"></i>
        </div>
        <h1 class="login-title">Admin<span style="color:#a855f7;">PRO</span></h1>
        <p class="login-subtitle">Sign in to access VIP Control Center</p>

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
                <div class="input-group">
                    <input type="text" class="form-control" id="username" name="username"
                           placeholder="Enter username (admin)" required autofocus>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="•••••••• (admin123)" required>
            </div>

            <button type="submit" class="btn btn-vip-login mb-3">
                <i class="bi bi-box-arrow-in-right me-2"></i>Sign In to Dashboard
            </button>

            <p class="text-muted small mb-0 text-center" style="font-size:0.8rem;">
                Dev Admin Account: <strong class="text-light">admin</strong> / <strong class="text-light">admin123</strong>
            </p>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
