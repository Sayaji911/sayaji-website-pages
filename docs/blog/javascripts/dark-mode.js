// Dark mode sync across all pages
(function () {
    // Load dark mode preference
    if (localStorage.getItem('darkMode') === 'true') {
        document.body.classList.add('dark-mode');
    }

    // Add dark mode toggle button
    window.addEventListener('DOMContentLoaded', function () {
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'dark-mode-toggle';
        toggleBtn.textContent = localStorage.getItem('darkMode') === 'true' ? '☀️ Light' : '🌙 Dark';
        toggleBtn.onclick = function () {
            document.body.classList.toggle('dark-mode');
            const isDark = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDark);
            toggleBtn.textContent = isDark ? '☀️ Light' : '🌙 Dark';
        };
        document.body.appendChild(toggleBtn);
    });
})();
