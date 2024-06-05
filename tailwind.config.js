/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.{html,slim,erb,js}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './components/**/*.{html,js}'
  ]
}
