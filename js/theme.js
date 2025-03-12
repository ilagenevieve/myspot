// Theme module
// Handles the dark/light mode functionality

// Toggle between dark and light mode
function toggleTheme() {
    const body = document.body;
    const themeToggle = document.getElementById('themeToggle');
    
    // Toggle dark mode class
    body.classList.toggle('dark-mode');
    
    // Update toggle button icon
    if (body.classList.contains('dark-mode')) {
      themeToggle.textContent = '☀️'; // Sun icon for light mode
      localStorage.setItem('theme', 'dark');
    } else {
      themeToggle.textContent = '🌙'; // Moon icon for dark mode
      localStorage.setItem('theme', 'light');
    }
    
    console.log(`Theme switched to ${body.classList.contains('dark-mode') ? 'dark' : 'light'} mode`);
  }
  
  // Apply system preference for dark/light mode if no saved preference
  function applySystemThemePreference() {
    // Only apply if there's no saved preference
    if (!localStorage.getItem('theme')) {
      // Check if user prefers dark mode
      const prefersDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
      
      if (prefersDarkMode) {
        document.body.classList.add('dark-mode');
        
        const themeToggle = document.getElementById('themeToggle');
        if (themeToggle) {
          themeToggle.textContent = '☀️';
        }
        
        console.log('Applied system dark mode preference');
      }
    }
  }
  
  // Initialize theme when the DOM is fully loaded
  document.addEventListener('DOMContentLoaded', applySystemThemePreference);