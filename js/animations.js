// Animations module
// Handles all the animations and visual effects for the site

// Create bubble animations for header and footer
function createBubbles() {
    const header = document.querySelector('header');
    const footer = document.querySelector('footer');
    
    // Number of bubbles to create
    const bubbleCount = 15;
    
    for (let i = 0; i < bubbleCount; i++) {
      const bubble = document.createElement('div');
      bubble.className = 'bubble';
      
      // Random size between 10px and 50px
      const size = Math.floor(Math.random() * 40) + 10;
      bubble.style.width = `${size}px`;
      bubble.style.height = `${size}px`;
      
      // Random position
      bubble.style.top = `${Math.random() * 100}%`;
      bubble.style.left = `${Math.random() * 100}%`;
      
      // Random animation duration and delay
      bubble.style.animationDuration = `${Math.random() * 8 + 4}s`;
      bubble.style.animationDelay = `${Math.random() * 2}s`;
      
      // Add to header or footer randomly
      if (Math.random() > 0.5) {
        header.appendChild(bubble);
      } else {
        footer.appendChild(bubble);
      }
    }
    
    console.log('Bubbles created');
  }
  
  // Add floating ocean creatures to the main content
  function addOceanCreatures() {
    const main = document.querySelector('main');
    const creatures = ['🐙', '🐬', '🐠', '🦈', '🦑', '🐡', '🐳', '🦀'];
    
    // Number of creatures to create
    const creatureCount = 8;
    
    for (let i = 0; i < creatureCount; i++) {
      const creature = document.createElement('div');
      creature.className = 'ocean-creature';
      
      // Random creature
      creature.textContent = creatures[Math.floor(Math.random() * creatures.length)];
      
      // Random size
      creature.style.fontSize = `${Math.random() * 30 + 20}px`;
      
      // Random position (keeping away from edges)
      creature.style.top = `${Math.random() * 80 + 10}%`;
      creature.style.left = `${Math.random() * 80 + 10}%`;
      
      // Set animation with random duration
      creature.style.animation = `float ${Math.random() * 10 + 5}s infinite ease-in-out`;
      
      // Random animation delay
      creature.style.animationDelay = `${Math.random() * 3}s`;
      
      main.appendChild(creature);
    }
    
    console.log('Ocean creatures added');
  }
  
  // Create splash effect when surprise button is clicked
  function createSplashEffect() {
    console.log('Creating splash effect');
    
    // Create splash emoji
    const splash = document.createElement('div');
    splash.className = 'splash-effect';
    splash.textContent = '🌊';
    document.body.appendChild(splash);
    
    // Animate splash
    setTimeout(() => {
      splash.style.opacity = '1';
      splash.style.fontSize = '300px';
    }, 100);
    
    // Add random ocean creatures for the splash effect
    setTimeout(() => {
      const creatures = ['🐙', '🐬', '🐠', '🦈', '🦑', '🐡', '🐳', '🦀'];
      const creatureCount = 20;
      
      for (let i = 0; i < creatureCount; i++) {
        const creature = document.createElement('div');
        creature.className = 'splash-creature';
        
        // Random creature
        creature.textContent = creatures[Math.floor(Math.random() * creatures.length)];
        
        // Random position
        creature.style.top = `${Math.random() * 100}%`;
        creature.style.left = `${Math.random() * 100}%`;
        
        // Random size
        creature.style.fontSize = `${Math.random() * 30 + 20}px`;
        
        document.body.appendChild(creature);
        
        // Animate creatures with delay
        setTimeout(() => {
          creature.style.opacity = '1';
          creature.style.transform = `translate(${Math.random() * 100 - 50}px, ${Math.random() * 100 - 50}px)`;
        }, i * 50 + 200);
        
        // Remove creatures after animation
        setTimeout(() => {
          creature.style.opacity = '0';
          setTimeout(() => creature.remove(), 500);
        }, i * 50 + 2000);
      }
    }, 500);
    
    // Remove splash after animation
    setTimeout(() => {
      splash.style.opacity = '0';
      setTimeout(() => splash.remove(), 500);
    }, 2500);
  }
  
  // Initialize animations when the DOM is fully loaded
  document.addEventListener('DOMContentLoaded', () => {
    createBubbles();
    addOceanCreatures();
  });