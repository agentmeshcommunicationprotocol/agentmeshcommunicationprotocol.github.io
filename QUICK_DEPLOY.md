# 🚀 AMCP GitHub Pages - Quick Deployment Guide

## ⚡ 5-Minute Deployment

### Step 1: Create GitHub Repository
1. Go to [GitHub.com](https://github.com/new)
2. Repository name: `amcp.github.io` (or `your-username.github.io`)
3. Make it **Public**
4. **Don't** initialize with README
5. Click **Create repository**

### Step 2: Deploy the Website
```bash
# Add GitHub remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/amcp.github.io.git

# Push to GitHub
git push -u origin main
```

### Step 3: Enable GitHub Pages
1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll to **Pages** section
4. Source: **Deploy from a branch**
5. Branch: **main** / **(root)**
6. Click **Save**

### Step 4: Wait for Deployment
- ⏱️ **Build time**: 2-10 minutes
- 📊 **Check progress**: Actions tab
- 🌐 **Live URL**: `https://YOUR_USERNAME.github.io/amcp.github.io`

## ✅ Verification Checklist

- [ ] Repository created and public
- [ ] Code pushed to main branch
- [ ] GitHub Pages enabled
- [ ] Build action completed successfully
- [ ] Website accessible at live URL

## 🔧 Local Development

```bash
# Start development server
bundle exec jekyll serve --livereload

# Build for production
bundle exec jekyll build

# Test the build
bundle exec htmlproofer ./_site --disable-external
```

## 🎯 What You Get

### 📱 **Professional Website**
- Modern responsive design
- Mobile-first approach
- Fast loading times
- SEO optimized

### 📚 **Complete Content**
- **Landing Page**: Hero section with features
- **Getting Started**: Quick setup guide
- **Examples**: Interactive demos
- **Download**: Installation options
- **Community**: Contribution guidelines
- **Documentation**: Comprehensive guides

### 🚀 **Technical Features**
- Jekyll static site generator
- GitHub Actions CI/CD
- Automated deployments
- Performance optimized
- Analytics ready

## 🆘 Troubleshooting

### Build Fails
```bash
# Check Jekyll build locally
bundle exec jekyll build

# Fix permissions if needed
sudo chown -R $USER:$USER .
```

### Pages Not Loading
- Wait 10 minutes for DNS propagation
- Check repository is public
- Verify GitHub Pages is enabled
- Check Actions tab for build errors

### Custom Domain (Optional)
1. Add `CNAME` file with your domain
2. Configure DNS with your provider
3. Enable HTTPS in Pages settings

## 📞 Support

- **Issues**: Create GitHub issue in repository
- **Documentation**: See README.md and DEPLOYMENT_GUIDE.md
- **Jekyll Help**: https://jekyllrb.com/docs/
- **GitHub Pages**: https://docs.github.com/en/pages

---

**🎉 Your AMCP website will be live in minutes!**
