<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${isEdit ? 'Edit User' : 'Add User'}</title>
</head>
<body>

<!-- Page Header -->
<div class="page-header d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h3 mb-1 fw-bold">${isEdit ? 'Edit User' : 'Add User'}</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/users">Users</a></li>
                <li class="breadcrumb-item active">${isEdit ? 'Edit' : 'Add'}</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">
                    <i class="bi bi-${isEdit ? 'pencil' : 'person-plus'} me-2"></i>
                    ${isEdit ? 'Edit User' : 'New User'}
                </h5>
            </div>
            <div class="card-body">
                <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/users/${isEdit ? 'edit/' : 'create'}${isEdit ? user.id : ''}"/>
                <form:form action="${actionUrl}" method="post" modelAttribute="user">

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="username" class="form-label fw-medium">
                                Username <span class="text-danger">*</span>
                            </label>
                            <form:input path="username" cssClass="form-control" id="username"
                                        placeholder="Enter username"/>
                            <form:errors path="username" cssClass="invalid-feedback d-block" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label for="fullName" class="form-label fw-medium">
                                Full Name <span class="text-danger">*</span>
                            </label>
                            <form:input path="fullName" cssClass="form-control" id="fullName"
                                        placeholder="Enter full name"/>
                            <form:errors path="fullName" cssClass="invalid-feedback d-block" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label for="email" class="form-label fw-medium">
                                Email <span class="text-danger">*</span>
                            </label>
                            <form:input path="email" type="email" cssClass="form-control" id="email"
                                        placeholder="Enter email address"/>
                            <form:errors path="email" cssClass="invalid-feedback d-block" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label for="password" class="form-label fw-medium">
                                Password
                                <c:if test="${!isEdit}"><span class="text-danger">*</span></c:if>
                                <c:if test="${isEdit}">
                                    <span class="text-muted small fw-normal">(leave blank to keep current)</span>
                                </c:if>
                            </label>
                            <form:input path="password" type="password" cssClass="form-control" id="password"
                                        placeholder="${isEdit ? 'Leave blank to keep current password' : 'Enter password'}"/>
                            <form:errors path="password" cssClass="invalid-feedback d-block" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-medium">Roles</label>
                            <div class="border rounded p-3" style="max-height: 150px; overflow-y: auto;">
                                <c:forEach var="role" items="${allRoles}">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input"
                                               name="roleIds" value="${role.id}"
                                               id="role_${role.id}"
                                               <c:forEach var="userRole" items="${user.roles}">
                                                   <c:if test="${userRole.id == role.id}">checked</c:if>
                                               </c:forEach>
                                        >
                                        <label class="form-check-label" for="role_${role.id}">
                                            <c:choose>
                                                <c:when test="${role.name == 'ROLE_ADMIN'}">
                                                    <span class="badge bg-danger">${role.name}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-info">${role.name}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-medium">Status</label>
                            <div class="d-flex gap-3 pt-2">
                                <div class="form-check">
                                    <form:radiobutton path="enabled" value="true" cssClass="form-check-input" id="statusActive"/>
                                    <label class="form-check-label" for="statusActive">
                                        <span class="badge bg-success">Active</span>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <form:radiobutton path="enabled" value="false" cssClass="form-check-input" id="statusDisabled"/>
                                    <label class="form-check-label" for="statusDisabled">
                                        <span class="badge bg-secondary">Disabled</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-${isEdit ? 'check2' : 'person-plus'} me-2"></i>
                            ${isEdit ? 'Update User' : 'Create User'}
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline-secondary">
                            <i class="bi bi-x-circle me-2"></i>Cancel
                        </a>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
