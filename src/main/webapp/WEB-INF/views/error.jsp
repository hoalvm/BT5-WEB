<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${statusCode} Error | Admin Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #f8fafc;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #334155;
            padding: 1.5rem;
        }
        .error-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 3rem 2rem;
            width: 100%;
            max-width: 460px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05), 0 4px 6px -4px rgba(0, 0, 0, 0.05);
            text-align: center;
        }
        .error-code {
            font-size: 4rem;
            font-weight: 800;
            color: #4f46e5;
            line-height: 1;
            margin-bottom: 0.5rem;
        }
        .error-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 0.5rem;
        }
        .error-desc {
            color: #64748b;
            font-size: 0.875rem;
            margin-bottom: 2rem;
        }
        .btn-home {
            background-color: #4f46e5;
            border-color: #4f46e5;
            color: #ffffff;
            font-weight: 600;
            border-radius: 8px;
            padding: 0.65rem 1.25rem;
            font-size: 0.875rem;
            transition: all 0.15s ease;
        }
        .btn-home:hover {
            background-color: #4338ca;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="error-card">
        <div class="error-code">${statusCode != null ? statusCode : '500'}</div>
        <h1 class="error-title">
            <c:choose>
                <c:when test="${statusCode == 404}">Page Not Found</c:when>
                <c:when test="${statusCode == 403}">Access Denied</c:when>
                <c:otherwise>Unexpected Error</c:otherwise>
            </c:choose>
        </h1>
        <p class="error-desc">${errorMessage != null ? errorMessage : 'Something went wrong.'}</p>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-home text-decoration-none">
            <i class="bi bi-house me-1"></i> Return to Dashboard
        </a>
    </div>
</body>
</html>
