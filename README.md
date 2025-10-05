# AMCP GitHub Pages Website

This repository contains the official website for AMCP (Agent Mesh Communication Protocol) hosted at `https://amcp.github.io`.

## 🌐 Website Overview

The AMCP website provides comprehensive documentation, examples, and resources for the Agent Mesh Communication Protocol framework.

### Features

- **Modern Design**: Clean, responsive design with mobile-first approach
- **Comprehensive Documentation**: Getting started guides, API reference, and tutorials
- **Interactive Examples**: Live demos and code samples
- **Performance Optimized**: Fast loading with optimized assets
- **SEO Friendly**: Structured data and meta tags for search engines
- **Accessibility**: WCAG 2.1 compliant design

## 🛠️ Technology Stack

- **Jekyll**: Static site generator
- **GitHub Pages**: Hosting platform
- **Sass**: CSS preprocessing
- **JavaScript**: Interactive features
- **Responsive Design**: Mobile-first approach

## 📁 Site Structure

```
amcp.github.io/
├── _config.yml              # Jekyll configuration
├── _layouts/                 # Page templates
│   ├── default.html
│   ├── page.html
│   └── post.html
├── _includes/                # Reusable components
│   ├── header.html
│   ├── footer.html
│   └── navigation.html
├── _sass/                    # Sass partials
├── assets/                   # Static assets
│   ├── css/
│   ├── js/
│   └── images/
├── docs/                     # Documentation pages
├── examples/                 # Example pages
├── blog/                     # Blog posts
└── index.html               # Homepage
```

## 🚀 Local Development

### Prerequisites

- Ruby 2.7 or higher
- Bundler gem
- Git

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io.git
   cd amcpcore.github.io
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Start the development server**
   ```bash
   bundle exec jekyll serve
   ```

4. **Open in browser**
   ```
   http://localhost:4000
   ```

### Development Commands

```bash
# Serve with live reload
bundle exec jekyll serve --livereload

# Build for production
bundle exec jekyll build

# Check for broken links
bundle exec htmlproofer ./_site

# Update dependencies
bundle update
```

## 📝 Content Management

### Adding New Pages

1. Create a new Markdown file in the appropriate directory
2. Add front matter with layout and metadata
3. Write content in Markdown format

Example:
```markdown
---
layout: page
title: "Page Title"
description: "Page description for SEO"
permalink: /custom-url/
---

# Page Content

Your content here...
```

### Adding Blog Posts

1. Create a new file in `_posts/` with format: `YYYY-MM-DD-title.md`
2. Add front matter with post metadata
3. Write content in Markdown

Example:
```markdown
---
layout: post
title: "Post Title"
date: 2024-01-01
categories: [announcement, tutorial]
author: "Author Name"
---

Post content here...
```

### Adding Examples

1. Create a new file in `examples/`
2. Include code samples and explanations
3. Link from the examples index page

## 🎨 Styling Guidelines

### CSS Architecture

- Use Sass for styling
- Follow BEM methodology for class naming
- Maintain consistent spacing and typography
- Ensure responsive design

### Color Palette

- Primary: `#2196F3` (Blue)
- Secondary: `#4CAF50` (Green)
- Accent: `#FF9800` (Orange)
- Text: `#212121` (Dark Gray)
- Background: `#FFFFFF` (White)

### Typography

- Primary Font: Inter (Sans-serif)
- Monospace Font: JetBrains Mono
- Base Font Size: 16px
- Line Height: 1.5

## 📱 Responsive Design

The website is designed mobile-first with breakpoints:

- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

## ⚡ Performance Optimization

- Optimized images (WebP format when possible)
- Minified CSS and JavaScript
- Lazy loading for images
- CDN for external resources
- Gzip compression

## 🔍 SEO Features

- Structured data (JSON-LD)
- Open Graph meta tags
- Twitter Cards
- Sitemap generation
- Robots.txt
- Canonical URLs

## 📊 Analytics

The site includes Google Analytics for tracking:

- Page views and user behavior
- Download tracking
- External link clicks
- Search queries

## 🚀 Deployment

The site is automatically deployed via GitHub Pages when changes are pushed to the `main` branch.

### Deployment Process

1. Push changes to `main` branch
2. GitHub Actions builds the site
3. Site is deployed to `https://amcp.github.io`
4. CDN cache is invalidated

### Custom Domain Setup

To use a custom domain:

1. Add CNAME file with domain name
2. Configure DNS records
3. Enable HTTPS in repository settings

## 🧪 Testing

### Local Testing

```bash
# Build and test locally
bundle exec jekyll build
bundle exec htmlproofer ./_site

# Test responsive design
# Use browser dev tools or online tools
```

### Automated Testing

GitHub Actions runs automated tests:

- HTML validation
- Link checking
- Performance audits
- Accessibility testing

## 🤝 Contributing

### Content Contributions

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally
5. Submit a pull request

### Code Contributions

1. Follow existing code style
2. Test your changes
3. Update documentation
4. Submit a pull request

### Reporting Issues

- Use GitHub Issues for bug reports
- Include browser and device information
- Provide steps to reproduce

## 📄 License

This website is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## 🆘 Support

- **Documentation**: [AMCP Docs](https://amcp.github.io/docs/)
- **GitHub Issues**: [Report bugs](https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/issues)
- **Discussions**: [Community discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/discussions)

## 📞 Contact

- **Website**: https://amcp.github.io
- **Email**: contact@amcp.dev
- **GitHub**: https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io

---

Built with ❤️ by the AMCP Development Team
