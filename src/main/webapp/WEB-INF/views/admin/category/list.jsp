<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Categories</title>
</head>
<body>

<!-- Page Header -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h4 font-weight-bold text-dark mb-1 fw-bold">Categories</h1>
        <p class="text-muted small mb-0">Manage product categories, titles and descriptions.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/categories/create" class="btn btn-primary">
        <i class="bi bi-plus-lg me-1"></i> Add Category
    </a>
</div>

<!-- Flash Messages -->
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i><c:out value="${successMessage}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>
<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
        <i class="bi bi-exclamation-circle-fill me-2"></i><c:out value="${errorMessage}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>

<!-- Filter & Table Card -->
<div class="card">
    <div class="card-header bg-white border-bottom p-3">
        <form action="${pageContext.request.contextPath}/admin/categories" method="get" class="row g-2 align-items-center">
            <div class="col-md-5">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0 text-muted"><i class="bi bi-search"></i></span>
                    <input type="text" class="form-control border-start-0 ps-0" id="keyword" name="keyword"
                           placeholder="Search category name or description..." value="<c:out value='${keyword}'/>">
                </div>
            </div>
            <div class="col-md-2">
                <select class="form-select" id="size" name="size" onchange="this.form.submit()">
                    <option value="5" ${pageSize == 5 ? 'selected' : ''}>5 per page</option>
                    <option value="10" ${pageSize == 10 ? 'selected' : ''}>10 per page</option>
                    <option value="20" ${pageSize == 20 ? 'selected' : ''}>20 per page</option>
                </select>
            </div>
            <div class="col-md-5 text-end">
                <button type="submit" class="btn btn-primary me-1">
                    Search
                </button>
                <c:if test="${not empty keyword}">
                    <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-light">
                        Reset
                    </a>
                </c:if>
            </div>
        </form>
    </div>
    
    <div class="card-body p-0">
        <c:choose>
            <c:when test="${empty categories}">
                <div class="text-center py-5">
                    <div class="stat-icon stat-icon-indigo mx-auto mb-3" style="width:56px; height:56px; font-size:1.5rem;">
                        <i class="bi bi-inbox"></i>
                    </div>
                    <h6 class="fw-semibold mb-1">No categories found</h6>
                    <p class="text-muted small mb-3">Try refining your search keyword or create a new category.</p>
                    <a href="${pageContext.request.contextPath}/admin/categories/create" class="btn btn-primary btn-sm">
                        <i class="bi bi-plus-lg me-1"></i> Add Category
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-clean">
                        <thead>
                            <tr>
                                <th width="60">#</th>
                                <th width="80">ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th width="180">Created Date</th>
                                <th width="120" class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="category" items="${categories}" varStatus="status">
                                <tr>
                                    <td class="text-muted">${currentPage * pageSize + status.index + 1}</td>
                                    <td><span class="badge badge-soft-secondary">#${category.id}</span></td>
                                    <td class="fw-semibold text-dark"><c:out value="${category.name}"/></td>
                                    <td class="text-muted">
                                        <c:choose>
                                            <c:when test="${not empty category.description}">
                                                <c:out value="${category.description}"/>
                                            </c:when>
                                            <c:otherwise><span class="text-muted fst-italic">—</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-muted small">
                                        <c:choose>
                                            <c:when test="${category.createdAt != null}">
                                                ${category.createdAt.toString().replace('T', ' ').substring(0, 16)}
                                            </c:when>
                                            <c:otherwise>—</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-end">
                                        <a href="${pageContext.request.contextPath}/admin/categories/edit/${category.id}"
                                           class="btn btn-sm btn-soft-primary me-1" title="Edit">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <button type="button" class="btn btn-sm btn-soft-danger"
                                                title="Delete"
                                                onclick="confirmDelete('${pageContext.request.contextPath}/admin/categories/delete/${category.id}', '<c:out value="${category.name}"/>')">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination Footer -->
                <div class="p-3 border-top d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <small class="text-muted">
                        Showing <strong>${currentPage * pageSize + 1}</strong> to <strong>${(currentPage + 1) * pageSize > totalElements ? totalElements : (currentPage + 1) * pageSize}</strong> of <strong>${totalElements}</strong> categories
                    </small>
                    <c:if test="${totalPages > 1}">
                        <nav>
                            <ul class="pagination pagination-sm mb-0">
                                <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                    <a class="page-link"
                                       href="${pageContext.request.contextPath}/admin/categories?keyword=${keyword}&page=${currentPage - 1}&size=${pageSize}">
                                        Prev
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                    <c:if test="${i >= currentPage - 2 && i <= currentPage + 2}">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                            <a class="page-link"
                                               href="${pageContext.request.contextPath}/admin/categories?keyword=${keyword}&page=${i}&size=${pageSize}">
                                                ${i + 1}
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <li class="page-item ${currentPage >= totalPages - 1 ? 'disabled' : ''}">
                                    <a class="page-link"
                                       href="${pageContext.request.contextPath}/admin/categories?keyword=${keyword}&page=${currentPage + 1}&size=${pageSize}">
                                        Next
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg" style="border-radius: 14px;">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold text-dark">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body py-3">
                <p class="mb-1 text-secondary">Are you sure you want to delete category <strong id="deleteItemName" class="text-dark"></strong>?</p>
                <p class="text-muted small mb-0">This operation cannot be undone.</p>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                <form id="deleteForm" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-danger">
                        Delete Category
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
