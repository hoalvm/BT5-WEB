/**
 * Admin Panel - Custom JavaScript
 * Spring Boot 4 + Bootstrap 5
 */

/**
 * Show delete confirmation modal
 * @param {string} actionUrl - The form action URL for delete
 * @param {string} itemName  - The name of the item being deleted
 */
function confirmDelete(actionUrl, itemName) {
    const modal = document.getElementById('deleteModal');
    const deleteForm = document.getElementById('deleteForm');
    const deleteItemName = document.getElementById('deleteItemName');

    if (!modal || !deleteForm) return;

    deleteForm.action = actionUrl;
    if (deleteItemName) {
        deleteItemName.textContent = itemName || 'this item';
    }

    const bsModal = new bootstrap.Modal(modal);
    bsModal.show();
}

/**
 * Auto-dismiss alerts after 5 seconds
 */
document.addEventListener('DOMContentLoaded', function () {
    // Auto dismiss success alerts
    const alerts = document.querySelectorAll('.alert.alert-success, .alert.alert-info');
    alerts.forEach(function (alert) {
        setTimeout(function () {
            const bsAlert = bootstrap.Alert.getOrCreateInstance(alert);
            if (bsAlert) bsAlert.close();
        }, 5000);
    });

    // Highlight active sidebar link
    const currentPath = window.location.pathname;
    document.querySelectorAll('.sidebar-link').forEach(function (link) {
        const href = link.getAttribute('href');
        if (href && currentPath.includes(href.split('?')[0]) && href !== '/') {
            link.classList.add('active');
        }
    });

    // Add loading state to submit buttons
    document.querySelectorAll('form').forEach(function (form) {
        form.addEventListener('submit', function () {
            const submitBtn = form.querySelector('[type="submit"]');
            if (submitBtn && !submitBtn.closest('#deleteForm')) {
                submitBtn.disabled = true;
                const originalText = submitBtn.innerHTML;
                submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Processing...';
                // Re-enable after 10s as failsafe
                setTimeout(() => {
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalText;
                }, 10000);
            }
        });
    });

    // Animate cards on load
    document.querySelectorAll('.card').forEach(function (card, index) {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        setTimeout(function () {
            card.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, index * 80);
    });
});
