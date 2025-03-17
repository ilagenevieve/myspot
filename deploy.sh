#!/bin/bash

# ===== Ocean-themed Deployment Script =====
# This script automates the deployment process:
# 1. Commits and pushes changes to the main branch
# 2. Builds the site locally
# 3. Updates the deploy branch with optimized files

# Exit on error and enable debug output
set -e

# Set a timeout for commands (120 seconds)
export TIMEOUT=120

# Function to run commands with timeout
run_with_timeout() {
  timeout $TIMEOUT "$@" || {
    echo "🚨 Command timed out after $TIMEOUT seconds: $*"
    echo "🚨 Deployment interrupted. Returning to original branch."
    git checkout $CURRENT_BRANCH 2>/dev/null || true
    exit 1
  }
}

# Store the current branch
CURRENT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || echo "detached-head")
echo "🌊 Current branch: $CURRENT_BRANCH"

# Handle interrupts and errors
cleanup() {
  echo "🌊 Deployment interrupted. Returning to $CURRENT_BRANCH branch."
  git checkout $CURRENT_BRANCH 2>/dev/null || true
  exit 1
}

trap cleanup INT TERM

# Display welcome message
echo "🌊 ================================================== 🌊"
echo "🌊      Ocean-themed Website Deployment Script       🌊"
echo "🌊 ================================================== 🌊"
echo ""

# ===== Main Branch Operations =====
echo "🐚 Step 1: Updating main branch..."

# Check if there are uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
  echo "🐙 Uncommitted changes detected. Committing..."
  
  # Generate a soothing ocean-themed commit message
  OCEAN_SAYINGS=(
    "Gentle waves washing ashore"
    "Calm seas and clear horizons"
    "Peaceful tides and tranquil waters"
    "Serene ocean breeze"
    "Flowing with the ocean currents"
    "Drifting peacefully like the tide"
    "Smooth sailing on calm waters"
    "Embracing the ocean's tranquility"
    "Floating gently on azure waters"
    "Riding the peaceful ocean waves"
  )
  
  # Select a random saying
  RANDOM_INDEX=$((RANDOM % ${#OCEAN_SAYINGS[@]}))
  OCEAN_SAYING="${OCEAN_SAYINGS[$RANDOM_INDEX]}"
  
  # Create commit message with date/time and ocean saying
  COMMIT_MESSAGE="[$(date '+%Y-%m-%d %H:%M:%S')] $OCEAN_SAYING"
  echo "🐬 Commit message: $COMMIT_MESSAGE"
  
  # Add and commit changes
  run_with_timeout git add .
  run_with_timeout git commit -m "$COMMIT_MESSAGE" || {
    echo "🚨 Failed to commit changes. Exiting."
    exit 1
  }
else
  echo "🐠 No uncommitted changes detected."
fi

# Push to main branch
echo "🌴 Pushing to main branch..."
run_with_timeout git push origin $CURRENT_BRANCH || {
  echo "🚨 Failed to push to main branch. This could be due to:"
  echo "   - No internet connection"
  echo "   - Authentication issues"
  echo "   - Remote repository issues"
  echo "Continuing with local build process..."
}

# ===== Build Process =====
echo ""
echo "🐚 Step 2: Building the website..."

# Install dependencies if needed
if [[ ! -d "node_modules" ]]; then
  echo "🐡 Installing dependencies..."
  npm install
fi

# Build the project
echo "🐋 Building project..."
npm run build

# Verify build was successful
if [[ ! -d "dist" ]]; then
  echo "🦑 Error: Build failed! The dist directory was not created."
  exit 1
fi

echo "🐳 Build successful!"

# ===== Deploy Branch Operations =====
echo ""
echo "🐚 Step 3: Updating deploy branch..."

# Create temporary directory for build artifacts
TEMP_DIR=$(mktemp -d)
echo "🐢 Copying build files to temporary location: $TEMP_DIR"
cp -r dist/* $TEMP_DIR/

# Check if deploy branch exists
if git show-ref --verify --quiet refs/heads/deploy; then
  echo "🦭 Deploy branch exists. Updating..."
  run_with_timeout git checkout deploy || {
    echo "🚨 Failed to checkout deploy branch. Exiting."
    exit 1
  }
  
  # Reset deploy branch to match main without files
  run_with_timeout git reset --hard $CURRENT_BRANCH || {
    echo "🚨 Failed to reset deploy branch. Exiting."
    exit 1
  }
else
  echo "🦭 Creating deploy branch..."
  run_with_timeout git checkout -b deploy || {
    echo "🚨 Failed to create deploy branch. Exiting."
    exit 1
  }
fi

# Clean the root directory (except .git)
echo "🦪 Cleaning deploy branch..."
find . -mindepth 1 -maxdepth 1 -not -name ".git" -exec rm -rf {} \;

# Copy build artifacts from temporary location
echo "🐬 Copying build files to deploy branch..."
cp -r $TEMP_DIR/* .

# Add README to deploy branch
echo "🦈 Adding deployment information..."
cat > README.md << EOF
# Ocean-themed Website - Deployed Version

This branch contains the optimized production build of the ocean-themed website.

- **Main Branch**: Contains source code and development files
- **Deploy Branch**: Contains only production-ready files (this branch)

Last deployed: $(date '+%Y-%m-%d %H:%M:%S')
EOF

# Commit changes to deploy branch
echo "🐙 Committing changes to deploy branch..."
run_with_timeout git add . || {
  echo "🚨 Failed to add files to deploy branch. Exiting."
  exit 1
}
run_with_timeout git commit -m "Deploy: $COMMIT_MESSAGE" || {
  echo "🚨 Failed to commit to deploy branch. Exiting."
  exit 1
}

# Force push deploy branch
echo "🌴 Pushing deploy branch to remote..."
run_with_timeout git push -f origin deploy || {
  echo "🚨 Failed to push deploy branch. This could be due to:"
  echo "   - No internet connection"
  echo "   - Authentication issues"
  echo "   - Remote repository issues"
  echo "Continuing with cleanup..."
}

# ===== Cleanup =====
# Return to original branch
echo ""
echo "🐚 Step 4: Cleaning up..."
run_with_timeout git checkout $CURRENT_BRANCH || {
  echo "🚨 Failed to return to original branch $CURRENT_BRANCH."
  echo "🚨 You may need to manually run: git checkout $CURRENT_BRANCH"
}
echo "� Returned to $CURRENT_BRANCH branch."

# Remove temporary directory
rm -rf $TEMP_DIR

# ===== Summary =====
echo ""
echo "🌊 ================================================== 🌊"
echo "🌊      Deployment Complete Successfully!            🌊"
echo "🌊 ================================================== 🌊"
echo ""
echo "🐳 Main branch: Updated and pushed"
echo "🐳 Website: Built successfully"
echo "🐳 Deploy branch: Updated with optimized files"
echo ""
echo "🌊 Your ocean-themed website is now ready to be served from the deploy branch!"
echo "🌊 The web server can pull down just these files for optimal deployment."
echo ""