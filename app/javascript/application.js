// Entry point for the build script in your package.json

// Hotwire
import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";

// Custom modules
import ThemeController from "./theme_controller";
import BurgerMenuController from "./burger_menu_controller";

// Initialize Stimulus
const application = Application.start();

// Manually register controllers
application.register("theme", ThemeController);
application.register("burger_menu", BurgerMenuController);

// Turbo event listener
document.addEventListener("turbo:frame-load", function(event) {
    console.log("Frame loaded !", event);
});
