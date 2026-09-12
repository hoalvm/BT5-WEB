<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${isEdit ? 'Edit User' : 'Add User'}</title>
</head>
<body>

<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h4 font-weight-bold text-dark mb-1 fw-bold">${isEdit ? 'Edit User Account' : 'Create User Account'}</h1>
        <p class="text-muted small mb-0">Fill in the details below to ${isEdit ? 'update' : 'create'} system access credentials.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-light">
        <i class="bi bi-arrow-left me-1"></i> Back to Users
    </a>
</div>

<div class="row">
    <div class="col-lg-9 col-xl-8">
        <div class="card">
            <div class="card-header bg-white border-bottom py-3">
                <h5 class="card-title mb-0">${isEdit ? 'User Profile & Permissions' : 'User Account Details'}</h5>
            </div>
            <div class="card-body p-4">
                <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/users/${isEdit ? 'edit/' : 'create'}${isEdit ? user.id : ''}"/>
                <form:form action="${actionUrl}" method="post" modelAttribute="user">

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label for="username" class="form-label">
                                Username <span class="text-danger">*</span>
                            </label>
                            <form:input path="username" cssClass="form-control" id="username"
                                        placeholder="e.g. john_doe"/>
                            <form:errors path="username" cssClass="invalid-feedback d-block mt-1" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label for="fullName" class="form-label">
                                Full Name <span class="text-danger">*</span>
                            </label>
                            <form:input path="fullName" cssClass="form-control" id="fullName"
                                        placeholder="e.g. John Doe"/>
                            <form:errors path="fullName" cssClass="invalid-feedback d-block mt-1" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label for="email" class="form-label">
                                Email Address <span class="text-danger">*</span>
                            </label>
                            <form:input path="email" type="email" cssClass="form-control" id="email"
                                        placeholder="john@example.com"/>
                            <form:errors path="email" cssClass="invalid-feedback d-block mt-1" element="div"/>
                        </div>

                        <div class="col-md-6">
                            <label for="password" class="form-label">
                                Password
                                <c:if test="${!isEdit}"><span class="text-danger">*</span></c:if>
                                <c:if test="${isEdit}">
                                    <span class="text-muted fw-normal" style="font-size:0.75rem;">(optional)</span>
                                </c:if>
                            </label>
                            <form:input path="password" type="password" cssClass="form-control" id="password"
                                        placeholder="${isEdit ? 'Leave blank to keep current' : '••••••••'}"/>
                            <form:errors path="password" cssClass="invalid-feedback d-block mt-1" element="div"/>
                        </div>
                    </div>

                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label class="form-label">Assigned Roles</label>
                            <div class="p-3 border rounded-3 bg-light" style="max-height: 140px; overflow-y: auto;">
                                <c:forEach var="role" items="${allRoles}">
                                    <div class="form-check mb-2">
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
                                                    <span class="badge badge-soft-primary">${role.name}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-soft-secondary">${role.name}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Account Status</label>
                            <div class="p-3 border rounded-3 bg-light d-flex gap-4">
                                <div class="form-check">
                                    <form:radiobutton path="enabled" value="true" cssClass="form-check-input" id="statusActive"/>
                                    <label class="form-check-label" for="statusActive">
                                        <span class="badge badge-soft-success">Active</span>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <form:radiobutton path="enabled" value="false" cssClass="form-check-input" id="statusDisabled"/>
                                    <label class="form-check-label" for="statusDisabled">
                                        <span class="badge badge-soft-secondary">Disabled</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex gap-2 pt-2 border-top">
                        <button type="submit" class="btn btn-primary">
                            ${isEdit ? 'Save Changes' : 'Create User'}
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-light">
                            Cancel
                        </a>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
