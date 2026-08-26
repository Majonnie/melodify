import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    menuIsOpen = false;
    static targets = ["menu"];
    connect() {
        console.log("Burger Menu Controller connecté !");
    }

    toggleMenu() {
        console.log("toggleMenu function called !");

        //revoir avec présence class hidden
        if (this.menuIsOpen) {
            console.log("Closing menu...");
            this.menuTarget.classList.add("hidden");
            this.menuIsOpen = false;
        }
        else {
            console.log("Opening menu...");
            this.menuTarget.classList.remove("hidden");
            this.menuIsOpen = true;
        }
    }
}