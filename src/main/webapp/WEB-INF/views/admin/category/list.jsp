<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Categories</title>
</head>
<body>

<!-- Page Header -->
<div class="page-header d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="h3 mb-1 fw-bold">Categories</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                <li class="breadcrumb-item active">Categories</li>
            </ol>
        </nav>
    </div>
    <a href="${pageContext.request.contextPath}/admin/categories/create" class="btn btn-primary">
        <i class="bi bi-plus-circle me-2"></i>Add Category
    </a>
</div>

<!-- Flash Messages -->
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i><c:out value="${successMessage}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>
<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <i class="bi bi-exclamation-triangle-fill me-2"></i><c:out value="${errorMessage}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
</c:if>

<!-- Search & Filter Card -->
<div class="card mb-4">
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/admin/categories" method="get" class="row g-3 align-items-end">
            <div class="col-md-6">
                <label for="keyword" class="form-label">Search</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <input type="text" class="form-control" id="keyword" name="keyword"
                           placeholder="Search by name or description..." value="<c:out value='${keyword}'/>">
                </div>
            </div>
            <div class="col-md-2">
                <label for="size" class="form-label">Per page</label>
                <select class="form-select" id="size" name="size">
                    <option value="5" ${pageSize == 5 ? 'selected' : ''}>5</option>
                    <option value="10" ${pageSize == 10 ? 'selected' : ''}>10</option>
                    <option value="20" ${pageSize == 20 ? 'selected' : ''}>20</option>
                    <option value="50" ${pageSize == 50 ? 'selected' : ''}>50</option>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="bi bi-search me-1"></i>Search
                </button>
            </div>
            <div class="col-md-2">
                <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary w-100">
                    <i class="bi bi-x-circle me-1"></i>Clear
                </a>
            </div>
        </form>
    </div>
</div>

<!-- Data Table Card -->
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="card-title mb-0">
            <i class="bi bi-tags me-2"></i>Category List
        </h5>
        <span class="badge bg-primary rounded-pill">${totalElements} records</span>
    </div>
    <div class="card-body p-0">
        <c:choose>
            <c:when test="${empty categories}">
                <div class="text-center py-5">
                    <i class="bi bi-inbox display-3 text-muted"></i>
                    <p class="text-muted mt-3">No categories found.
                        <c:if test="${not empty keyword}">Try a different search term.</c:if>
                    </p>
                    <a href="${pageContext.request.contextPath}/admin/categories/create" class="btn btn-primary btn-sm">
                        <i class="bi bi-plus-circle me-1"></i>Add First Category
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-hover admin-table mb-0">
                        <thead>
                            <tr>
                                <th width="50">#</th>
                                <th width="80">ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th width="160">Created At</th>
                                <th width="130" class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="category" items="${categories}" varStatus="status">
                                <tr>
                                    <td>${currentPage * pageSize + status.index + 1}</td>
                                    <td><span class="badge bg-secondary">${category.id}</span></td>
                                    <td class="fw-medium"><c:out value="${category.name}"/></td>
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
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/admin/categories/edit/${category.id}"
                                           class="btn btn-sm btn-outline-primary me-1" title="Edit">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <button type="button" class="btn btn-sm btn-outline-danger"
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

                <!-- Pagination -->
                <div class="card-footer d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <small class="text-muted">
                        Showing ${currentPage * pageSize + 1}–${(currentPage + 1) * pageSize > totalElements ? totalElements : (currentPage + 1) * pageSize}
                        of ${totalElements} records
                    </small>
                    <c:if test="${totalPages > 1}">
                        <nav>
                            <ul class="pagination pagination-sm mb-0">
                                <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                    <a class="page-link"
                                       href="${pageContext.request.contextPath}/admin/categories?keyword=${keyword}&page=${currentPage - 1}&size=${pageSize}">
                                        <i class="bi bi-chevron-left"></i> Prev
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
                                        Next <i class="bi bi-chevron-right"></i>
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
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">
                    <i class="bi bi-exclamation-triangle-fill text-danger me-2"></i>Confirm Delete
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete category <strong id="deleteItemName"></strong>?</p>
                <p class="text-muted small mb-0">This action cannot be undone.</p>
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <form id="deleteForm" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-danger">
                        <i class="bi bi-trash me-1"></i>Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
