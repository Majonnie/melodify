import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        const currentTheme = localStorage.getItem('theme') || 'light'; // Default to light mode
        document.body.className = currentTheme;
    }

    //static targets = [ "themeName" ];

    toggleTheme() {
        const newTheme = document.body.className === 'light' ? 'dark' : 'light';
        document.body.className = newTheme;
        localStorage.setItem('theme', newTheme);
    }
}