<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${isEdit ? 'Edit Category' : 'Add Category'}</title>
</head>
<body>

<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h4 font-weight-bold text-dark mb-1 fw-bold">${isEdit ? 'Edit Category' : 'Add New Category'}</h1>
        <p class="text-muted small mb-0">Fill in the details below to ${isEdit ? 'update the' : 'create a new'} category.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-light">
        <i class="bi bi-arrow-left me-1"></i> Back to Categories
    </a>
</div>

<div class="row">
    <div class="col-lg-8 col-xl-7">
        <div class="card">
            <div class="card-header bg-white border-bottom py-3">
                <h5 class="card-title mb-0">${isEdit ? 'Category Details' : 'Category Information'}</h5>
            </div>
            <div class="card-body p-4">
                <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/categories/${isEdit ? 'edit/' : 'create'}${isEdit ? category.id : ''}"/>
                <form:form action="${actionUrl}" method="post" modelAttribute="category">

                    <div class="mb-3">
                        <label for="name" class="form-label">
                            Category Name <span class="text-danger">*</span>
                        </label>
                        <form:input path="name" cssClass="form-control" id="name"
                                    placeholder="e.g. Technology, Mobile Devices"/>
                        <form:errors path="name" cssClass="invalid-feedback d-block mt-1" element="div"/>
                    </div>

                    <div class="mb-4">
                        <label for="description" class="form-label">Description</label>
                        <form:textarea path="description" cssClass="form-control" id="description"
                                       rows="4" placeholder="Brief description about this category..."/>
                        <form:errors path="description" cssClass="invalid-feedback d-block mt-1" element="div"/>
                    </div>

                    <div class="d-flex gap-2 pt-2">
                        <button type="submit" class="btn btn-primary">
                            ${isEdit ? 'Save Changes' : 'Create Category'}
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-light">
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
