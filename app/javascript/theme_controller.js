import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    icons = {"light": "fa-moon", "dark": "fa-sun"};
    static targets = [ "themeIcon" ];
    connect() {
        const currentTheme = localStorage.getItem('theme') || 'light'; // Default to light mode
        this.toggleIcon(this.themeIconTarget, null, currentTheme);
        document.body.classList.add(currentTheme);
    }

    toggleTheme() {
        const oldTheme = document.body.classList.contains('light') ? 'light' : 'dark';
        const newTheme = document.body.classList.contains('light') ? 'dark' : 'light';
        this.toggleIcon(this.themeIconTarget, oldTheme, newTheme);
        document.body.classList.remove(oldTheme);
        document.body.classList.add(newTheme);
        localStorage.setItem('theme', newTheme);
    }

    toggleIcon(icon, oldTheme, newTheme) {
        icon.classList.add(this.icons[newTheme]);
        icon.classList.remove(this.icons[oldTheme]);
    }
}