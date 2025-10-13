document.addEventListener('DOMContentLoaded', function () {
    // Script para o dropdown de usuário
    const userIcon = document.getElementById('user-icon');
    const userDropdown = document.getElementById('user-dropdown');

    if (userIcon) {
        userIcon.addEventListener('click', function (event) {
            event.stopPropagation();
            userDropdown.classList.toggle('show');
        });
    }

    window.addEventListener('click', function (event) {
        if (userDropdown && userDropdown.classList.contains('show')) {
            userDropdown.classList.remove('show');
        }
    });

    // Script para o menu hamburger e sidebar
    const hamburger = document.querySelector('.hamburger');
    const sidebar = document.querySelector('.sidebar');

    if (hamburger && sidebar) {
        hamburger.addEventListener('click', () => {
            sidebar.classList.toggle('active-side');
            hamburger.classList.toggle('active-button');
        });
    }
});
