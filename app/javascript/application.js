// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"

document.addEventListener("turbo:frame-load", function(event) {
    console.log("Frame loaded!", event);
});