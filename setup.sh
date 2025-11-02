#!/bin/bash

# AMCP GitHub Pages Setup Script
# This script helps you deploy the AMCP website to GitHub Pages

set -e

echo "🚀 AMCP GitHub Pages Setup Script"
echo "=================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    print_error "This script must be run from the amcp-github-pages directory"
    exit 1
fi

print_status "Found Jekyll configuration file"

# Check if Git is initialized
if [ ! -d ".git" ]; then
    print_info "Initializing Git repository..."
    git init
    git branch -m main
    print_status "Git repository initialized"
fi

# Check for Ruby and Bundler
if ! command -v ruby &> /dev/null; then
    print_error "Ruby is not installed. Please install Ruby 2.7 or later."
    exit 1
fi

if ! command -v bundle &> /dev/null; then
    print_error "Bundler is not installed. Please run: gem install bundler"
    exit 1
fi

print_status "Ruby and Bundler are available"

# Install dependencies
print_info "Installing Jekyll dependencies..."
if bundle install; then
    print_status "Dependencies installed successfully"
else
    print_warning "Bundle install failed, trying with sudo..."
    if sudo bundle install; then
        print_status "Dependencies installed successfully with sudo"
    else
        print_error "Failed to install dependencies even with sudo"
        exit 1
    fi
fi

# Fix permissions if needed
print_info "Ensuring proper file permissions..."
if [ -d "_site" ]; then
    sudo chown -R $USER:$USER _site 2>/dev/null || true
fi
sudo chown -R $USER:$USER . 2>/dev/null || true

# Test local build
print_info "Testing Jekyll build..."
if bundle exec jekyll build; then
    print_status "Jekyll build successful"
else
    print_warning "Jekyll build failed, trying with sudo..."
    if sudo bundle exec jekyll build; then
        print_status "Jekyll build successful with sudo"
        # Fix permissions after sudo build
        sudo chown -R $USER:$USER _site 2>/dev/null || true
    else
        print_error "Jekyll build failed even with sudo"
        exit 1
    fi
fi

# Clean up build files
bundle exec jekyll clean

print_status "Setup completed successfully!"
echo ""
echo "🎯 Next Steps:"
echo "=============="
echo ""
echo "1. Create a GitHub repository:"
echo "   - Go to https://github.com/new"
echo "   - Name it 'amcp.github.io' or 'your-username.github.io'"
echo "   - Make it public"
echo "   - Don't initialize with README"
echo ""
echo "2. Add the remote and push:"
echo "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git"
echo "   git add ."
echo "   git commit -m 'Initial AMCP website'"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages:"
echo "   - Go to repository Settings → Pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: main / (root)"
echo "   - Click Save"
echo ""
echo "4. Wait for deployment (2-10 minutes)"
echo "   - Check Actions tab for build status"
echo "   - Site will be available at: https://YOUR_USERNAME.github.io/REPO_NAME"
echo ""
echo "🔧 Development Commands:"
echo "======================="
echo ""
echo "# Start local development server:"
echo "bundle exec jekyll serve --livereload"
echo ""
echo "# Build for production:"
echo "bundle exec jekyll build"
echo ""
echo "# Test the site:"
echo "bundle exec htmlproofer ./_site --disable-external"
echo ""
echo "📚 Documentation:"
echo "================"
echo ""
echo "- README.md - Complete documentation"
echo "- DEPLOYMENT_GUIDE.md - Detailed deployment instructions"
echo "- Jekyll docs: https://jekyllrb.com/docs/"
echo "- GitHub Pages docs: https://docs.github.com/en/pages"
echo ""
print_status "AMCP GitHub Pages website is ready for deployment! 🎉"
