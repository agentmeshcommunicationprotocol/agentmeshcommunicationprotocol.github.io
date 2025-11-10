#!/bin/bash

# Google Search Console Verification File Deployment Script
# This script deploys the GSC verification file to GitHub Pages

echo "🚀 Deploying Google Search Console Verification File..."
echo ""

# Check if file exists
if [ ! -f "googleff0d734753b20703.html" ]; then
    echo "❌ Error: googleff0d734753b20703.html not found in current directory"
    exit 1
fi

echo "✅ File found: googleff0d734753b20703.html"
echo ""

# Verify file content
echo "📄 File content:"
cat googleff0d734753b20703.html
echo ""
echo ""

# Add file to git
echo "📝 Adding file to git..."
git add googleff0d734753b20703.html

# Commit changes
echo "💾 Committing changes..."
git commit -m "Add Google Search Console verification file (googleff0d734753b20703.html)"

# Push to main branch
echo "🌐 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📋 Next steps:"
echo "1. Wait 2-5 minutes for GitHub Pages to rebuild"
echo "2. Verify file is accessible at:"
echo "   https://agentmeshcommunicationprotocol.github.io/googleff0d734753b20703.html"
echo "3. Complete verification in Google Search Console"
echo ""
echo "🔗 Verification file URL:"
echo "   https://agentmeshcommunicationprotocol.github.io/googleff0d734753b20703.html"
echo ""
echo "📚 For more info, see: GOOGLE_SEARCH_CONSOLE_VERIFICATION.md"
