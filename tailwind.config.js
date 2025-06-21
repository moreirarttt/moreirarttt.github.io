/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.html"],
  theme: {
    extend: {      fontFamily: {
        'serif': ['Georgia', 'serif'],
        'sans': ['Poppins', 'system-ui', 'sans-serif'],
        'poppins': ['Poppins', 'system-ui', 'sans-serif']
      }
    }
  },
  plugins: [],
}
