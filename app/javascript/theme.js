document.addEventListener("turbo:load", function() {
    const currentTheme = localStorage.getItem('theme') || 'light'; // Default to light mode
    document.body.className = currentTheme;

    function toggleTheme() {
        const newTheme = document.body.className === 'light' ? 'dark' : 'light';
        document.body.className = newTheme;
        localStorage.setItem('theme', newTheme);
    }

    const themeToggleBtn = document.getElementById('theme-toggle-btn');
    if (themeToggleBtn) {
        themeToggleBtn.addEventListener('click', toggleTheme);
    }
});