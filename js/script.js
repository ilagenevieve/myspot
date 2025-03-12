// Main script file
// This file initializes all components and handles the original clickMeBtn

// Initialize all components when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', () => {
  console.log('Initializing Ila\'s Ocean Wonderland...');
  
  // Look for the original clickMeBtn from the previous version
  const originalBtn = document.getElementById('clickMeBtn');
  if (originalBtn) {
    originalBtn.addEventListener('click', () => {
      alert('Hello from MySpot!');
    });
    console.log('Original button initialized');
  }
  
  // Initialize the surprise button
  const surpriseBtn = document.getElementById('surpriseBtn');
  if (surpriseBtn) {
    surpriseBtn.addEventListener('click', createSplashEffect);
    console.log('Surprise button initialized');
  }
  
  // Initialize theme toggle
  const themeToggle = document.getElementById('themeToggle');
  if (themeToggle) {
    themeToggle.addEventListener('click', toggleTheme);
    console.log('Theme toggle initialized');
  }
  
  // Check for saved theme preference
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark-mode');
    if (themeToggle) themeToggle.textContent = '☀️';
  }
  
  console.log('Initialization complete!');
});