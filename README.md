# Ila's Ocean Wonderland

A personal website with an underwater theme for showcasing projects, interests, and creative work.

## Project Overview

This is a static website built with HTML, CSS, and vanilla JavaScript, featuring:

- Responsive design with ocean-themed visuals
- Interactive animations and visual effects
- Dark/light mode toggle with preference saving
- Surprise effects and playful elements

## Project Structure

```
myspot/
├── index.html              # Main HTML file
├── css/
│   └── style.css           # All styles for the website
├── js/
│   ├── animations.js       # Handles visual effects and animations
│   ├── theme.js            # Manages dark/light mode functionality
│   └── script.js           # Main JavaScript file for initialization
├── package.json            # NPM configuration
└── package-lock.json       # NPM dependency lock file
```

## Development Setup

### Prerequisites

- Node.js and npm installed on your machine

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/ilagenevieve/myspot.git
   cd myspot
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Start the development server:
   ```
   npm start
   ```

This will launch a live-server instance that automatically reloads when files change.

## Build Process

This project uses a comprehensive build process to optimize files for production:

### Build Commands

- `npm run clean` - Removes the previous build (dist directory)
- `npm run build:html` - Minifies HTML files
- `npm run build:css` - Minifies CSS files
- `npm run build:js` - Minifies JavaScript files
- `npm run build:assets` - Copies asset files (if any)
- `npm run build` - Runs all build steps
- `npm run preview` - Previews the production build
- `npm run deploy` - Builds and prepares for deployment

### Build Tools

- **html-minifier**: Minifies HTML by removing whitespace, comments, and redundant attributes
- **clean-css-cli**: Optimizes and minifies CSS
- **terser**: Compresses and minifies JavaScript
- **rimraf**: Cleans build directories

## Build-to-Publish Paradigm

The project follows this workflow for development to production:

1. **Development Phase**:
   - Work locally using `npm start` for live reloading
   - Make changes to HTML, CSS, and JavaScript files
   - Test in the browser with automatic reloading

2. **Build Phase**:
   - Run `npm run build` to create optimized production files
   - All optimized files are output to the `dist` directory
   - Preview the production build with `npm run preview`

3. **Deployment Phase**:
   - Run `npm run deploy` to prepare for deployment
   - Upload the contents of the `dist` directory to your web hosting service

This approach ensures that development is convenient with live reloading, while the production version is optimized for performance with minified files.

## Version Control

- Repository: [https://github.com/ilagenevieve/myspot](https://github.com/ilagenevieve/myspot)
- Issues: [https://github.com/ilagenevieve/myspot/issues](https://github.com/ilagenevieve/myspot/issues)

## License

ISC