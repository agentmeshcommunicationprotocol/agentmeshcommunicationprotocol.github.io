# AMCP GitHub Pages Deployment Guide

This guide will help you deploy the AMCP website to GitHub Pages.

## 🚀 Quick Deployment

### Option 1: Deploy to GitHub Pages (Recommended)

1. **Create a new GitHub repository**
   ```bash
   # Go to GitHub and create a new repository named:
   # - "amcp.github.io" (for organization pages)
   # - "username.github.io" (for user pages)
   # - "amcp-website" (for project pages)
   ```

2. **Push the website code**
   ```bash
   cd /home/kalxav/CascadeProjects/amcp-github-pages
   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
   git push -u origin main
   ```

3. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Source: Deploy from a branch
   - Branch: main / (root)
   - Click Save

4. **Wait for deployment**
   - GitHub Actions will automatically build and deploy
   - Site will be available at: `https://YOUR_USERNAME.github.io/REPO_NAME`

### Option 2: Deploy to Custom Domain

1. **Add CNAME file**
   ```bash
   echo "amcp.dev" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

2. **Configure DNS**
   - Add CNAME record: `www.amcp.dev` → `username.github.io`
   - Add A records for apex domain:
     ```
     185.199.108.153
     185.199.109.153
     185.199.110.153
     185.199.111.153
     ```

3. **Enable HTTPS**
   - Go to repository Settings → Pages
   - Check "Enforce HTTPS"

## 🔧 Local Development

### Prerequisites

- Ruby 2.7+
- Bundler gem
- Git

### Setup

1. **Install dependencies**
   ```bash
   cd /home/kalxav/CascadeProjects/amcp-github-pages
   bundle install
   ```

2. **Start development server**
   ```bash
   bundle exec jekyll serve --livereload
   ```

3. **Open in browser**
   ```
   http://localhost:4000
   ```

### Development Commands

```bash
# Serve with drafts
bundle exec jekyll serve --drafts

# Build for production
bundle exec jekyll build

# Check for issues
bundle exec jekyll doctor

# Clean build files
bundle exec jekyll clean
```

## 📝 Content Management

### Adding New Pages

1. **Create Markdown file**
   ```bash
   touch new-page.md
   ```

2. **Add front matter**
   ```yaml
   ---
   layout: page
   title: "Page Title"
   description: "Page description"
   permalink: /new-page/
   ---
   
   # Page Content
   Your content here...
   ```

### Adding Blog Posts

1. **Create post file**
   ```bash
   touch _posts/2024-01-01-post-title.md
   ```

2. **Add front matter**
   ```yaml
   ---
   layout: post
   title: "Post Title"
   date: 2024-01-01
   categories: [news, tutorial]
   author: "Author Name"
   ---
   
   Post content here...
   ```

### Adding Examples

1. **Create example file**
   ```bash
   touch examples/new-example.md
   ```

2. **Add to examples index**
   - Edit `examples/index.md`
   - Add link to new example

## 🎨 Customization

### Updating Colors

Edit `assets/css/main.scss`:

```scss
:root {
  --primary-color: #2196F3;    // Change primary color
  --secondary-color: #4CAF50;  // Change secondary color
  --accent-color: #FF9800;     // Change accent color
}
```

### Adding Custom CSS

Add styles to `assets/css/main.scss`:

```scss
// Custom styles
.my-custom-class {
  background: #f0f0f0;
  padding: 1rem;
}
```

### Updating Navigation

Edit `_config.yml`:

```yaml
navigation:
  - title: "Home"
    url: "/"
  - title: "New Page"
    url: "/new-page/"
```

## 🔍 SEO Optimization

### Meta Tags

Update `_config.yml`:

```yaml
title: "AMCP - Agent Mesh Communication Protocol"
description: "Your site description"
url: "https://amcp.github.io"
author:
  name: "Your Name"
  email: "your@email.com"
```

### Google Analytics

Add tracking ID to `_config.yml`:

```yaml
google_analytics: UA-XXXXXXXX-X
```

### Sitemap

Sitemap is automatically generated at `/sitemap.xml`

## 📊 Performance

### Image Optimization

1. **Compress images**
   ```bash
   # Use tools like imagemin or online compressors
   ```

2. **Use WebP format**
   ```html
   <picture>
     <source srcset="image.webp" type="image/webp">
     <img src="image.jpg" alt="Description">
   </picture>
   ```

### Minification

CSS and JavaScript are automatically minified in production.

## 🧪 Testing

### HTML Validation

```bash
bundle exec htmlproofer ./_site --check-html --check-external-hash
```

### Link Checking

```bash
bundle exec htmlproofer ./_site --check-external-hash
```

### Accessibility Testing

Use tools like:
- WAVE Web Accessibility Evaluator
- axe DevTools
- Lighthouse accessibility audit

## 🚨 Troubleshooting

### Common Issues

**Build fails with Ruby version error**
```bash
# Update Ruby version in .ruby-version
echo "3.1.0" > .ruby-version
rbenv install 3.1.0
rbenv local 3.1.0
```

**Jekyll serve fails**
```bash
# Clear cache and reinstall
bundle exec jekyll clean
bundle install
```

**GitHub Pages build fails**
```bash
# Check GitHub Actions logs
# Ensure all dependencies are in Gemfile
# Check for unsupported plugins
```

**Images not loading**
```bash
# Check file paths are correct
# Ensure images are in assets/images/
# Use relative URLs: {{ '/assets/images/logo.png' | relative_url }}
```

### Getting Help

- **Jekyll Documentation**: https://jekyllrb.com/docs/
- **GitHub Pages Docs**: https://docs.github.com/en/pages
- **Community Support**: https://github.com/jekyll/jekyll/discussions

## 📋 Deployment Checklist

### Pre-Deployment

- [ ] Test locally with `bundle exec jekyll serve`
- [ ] Check all links work
- [ ] Validate HTML
- [ ] Test responsive design
- [ ] Optimize images
- [ ] Update meta descriptions
- [ ] Test contact forms

### Post-Deployment

- [ ] Verify site loads correctly
- [ ] Test all navigation links
- [ ] Check mobile responsiveness
- [ ] Verify analytics tracking
- [ ] Test contact forms
- [ ] Check search functionality
- [ ] Validate SSL certificate

### Ongoing Maintenance

- [ ] Regular content updates
- [ ] Monitor site performance
- [ ] Update dependencies
- [ ] Check for broken links
- [ ] Review analytics data
- [ ] Update documentation

## 🎯 Next Steps

After successful deployment:

1. **Set up monitoring**
   - Google Analytics
   - Google Search Console
   - Uptime monitoring

2. **Content strategy**
   - Regular blog posts
   - Documentation updates
   - Community highlights

3. **SEO optimization**
   - Submit sitemap to search engines
   - Optimize page titles and descriptions
   - Build backlinks

4. **Community engagement**
   - Social media promotion
   - Developer outreach
   - Conference presentations

---

**Congratulations!** 🎉 Your AMCP website is now live and ready to showcase the power of multi-agent communication protocols to the world!
