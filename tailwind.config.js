/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.{html,slim,erb,js}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './components/**/*.{html,js}'
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'table-dark-blue': '#2b4779',
      },
      borderWidth: {
        '6': '6px'  // Add a custom 6px border width
      }
    },
  },
}
