module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],
  theme: {
    fontFamily: {
      sans: ['Space Mono', 'sans-serif']
    },
  },
  colors: {
    blue: '#2d3fd1'
  }
}


