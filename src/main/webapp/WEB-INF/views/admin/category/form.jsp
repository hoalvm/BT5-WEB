<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${isEdit ? 'Edit Category' : 'Add Category'}</title>
</head>
<body>

<!-- Page Header -->
<div class="page-header d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h3 mb-1 fw-bold">${isEdit ? 'Edit Category' : 'Add Category'}</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/categories">Categories</a></li>
                <li class="breadcrumb-item active">${isEdit ? 'Edit' : 'Add'}</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-lg-7">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">
                    <i class="bi bi-${isEdit ? 'pencil' : 'plus-circle'} me-2"></i>
                    ${isEdit ? 'Edit Category' : 'New Category'}
                </h5>
            </div>
            <div class="card-body">
                <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/categories/${isEdit ? 'edit/' : 'create'}${isEdit ? category.id : ''}"/>
                <form:form action="${actionUrl}" method="post" modelAttribute="category">

                    <div class="mb-3">
                        <label for="name" class="form-label fw-medium">
                            Category Name <span class="text-danger">*</span>
                        </label>
                        <form:input path="name" cssClass="form-control" id="name"
                                    placeholder="Enter category name"/>
                        <form:errors path="name" cssClass="invalid-feedback d-block" element="div"/>
                    </div>

                    <div class="mb-4">
                        <label for="description" class="form-label fw-medium">Description</label>
                        <form:textarea path="description" cssClass="form-control" id="description"
                                       rows="4" placeholder="Enter category description (optional)"/>
                        <form:errors path="description" cssClass="invalid-feedback d-block" element="div"/>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-${isEdit ? 'check2' : 'plus-circle'} me-2"></i>
                            ${isEdit ? 'Update Category' : 'Create Category'}
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary">
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
