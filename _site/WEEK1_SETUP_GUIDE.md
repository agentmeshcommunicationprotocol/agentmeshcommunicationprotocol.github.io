# Week 1 Setup Guide - AMCP SEO & Marketing

Complete step-by-step instructions for implementing all Week 1 setup tasks.

---

## Overview

This week focuses on foundational setup that enables all future SEO and marketing efforts:
- ✅ GitHub repository optimization
- ✅ Google Search Console setup
- ✅ Google Analytics configuration
- ✅ Sitemap verification

**Time Commitment**: 2-3 hours total  
**Difficulty**: Low to Medium  
**Impact**: High (enables all future tracking and indexing)

---

## Task 1: Update GitHub Repository Description & Topics

### 1.1 Update Repository Description

**Step 1**: Navigate to repository settings
- Go to: https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io
- Click **Settings** (gear icon)
- Look for "About" section on the right side of the page

**Step 2**: Update the description
- Click the **Edit** button (pencil icon) in the About section
- Clear the current description
- Enter new description:
  ```
  AMCP Core: Java Mobile Agentic Framework for Distributed Systems
  ```
- Add website URL: `https://agentmeshcommunicationprotocol.github.io`
- Click **Save changes**

**Step 3**: Verify
- Refresh the page
- Confirm description appears on repository homepage

### 1.2 Add GitHub Topics

**Step 1**: Access topics settings
- Go to: https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/settings/general
- Scroll to "Topics" section

**Step 2**: Add topics
- Click in the topics field
- Add each topic (press Enter after each):
  - `java`
  - `agent-framework`
  - `distributed-systems`
  - `agent-mesh`
  - `agent-mobility`
  - `aglet`
  - `middleware`
  - `open-source`

**Step 3**: Save
- Topics auto-save
- Verify all 8 topics appear

**Step 4**: Verify on repository page
- Go to repository homepage
- Scroll down to see topics displayed

### ✅ Checklist for Task 1
- [ ] Repository description updated
- [ ] Website URL added
- [ ] All 8 topics added
- [ ] Changes visible on repository page

---

## Task 2: Add Google Search Console Verification Meta Tag

### 2.1 Create Google Search Console Property

**Step 1**: Go to Google Search Console
- Visit: https://search.google.com/search-console/
- Sign in with your Google account (create one if needed)

**Step 2**: Add property
- Click **Add property** button
- Select **URL prefix** option
- Enter: `https://agentmeshcommunicationprotocol.github.io/`
- Click **Continue**

**Step 3**: Choose verification method
- Select **HTML tag** from the verification methods
- Copy the meta tag (it will look like):
  ```html
  <meta name="google-site-verification" content="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" />
  ```
- **Save this code** - you'll need it in the next step

### 2.2 Add Verification Meta Tag to Website

**Step 1**: Update _config.yml
- Open: `/home/kalxav/CascadeProjects/amcp-github-pages/_config.yml`
- Find the line: `google_search_console: # Add your verification code here`
- Replace with your verification code:
  ```yaml
  google_search_console: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  ```
- Save the file

**Step 2**: Verify in layout template
- The file `_layouts/default.html` has already been updated with:
  ```html
  <!-- Google Search Console Verification -->
  {% if site.google_search_console %}
  <meta name="google-site-verification" content="{{ site.google_search_console }}" />
  {% endif %}
  ```
- This automatically includes the meta tag when `google_search_console` is set in `_config.yml`

**Step 3**: Deploy changes
- Commit and push to main branch:
  ```bash
  git add _config.yml
  git commit -m "Add Google Search Console verification"
  git push origin main
  ```
- Wait 2-5 minutes for GitHub Pages to rebuild

**Step 4**: Verify deployment
- Visit: https://agentmeshcommunicationprotocol.github.io/
- Right-click → **View Page Source**
- Search for `google-site-verification`
- Confirm your verification code appears in the `<head>` section

**Step 5**: Complete verification in Google Search Console
- Return to Google Search Console
- Click **Verify** button
- You should see: "Verification successful"
- If not, wait a few minutes and try again

### ✅ Checklist for Task 2
- [ ] Google Search Console property created
- [ ] Verification code copied
- [ ] _config.yml updated with verification code
- [ ] Changes deployed to GitHub Pages
- [ ] Meta tag visible in page source
- [ ] Verification completed in GSC

---

## Task 3: Set Up Google Analytics

### 3.1 Create Google Analytics 4 Property

**Step 1**: Go to Google Analytics
- Visit: https://analytics.google.com/
- Sign in with your Google account (same as GSC if possible)

**Step 2**: Create new property
- Click **Admin** (bottom left)
- In the "Property" column, click **Create Property**
- Fill in property details:
  - **Property name**: "AMCP Website"
  - **Reporting timezone**: Select your timezone
  - **Currency**: USD
  - Click **Create**

**Step 3**: Set up data stream
- Select **Web** as your platform
- Enter website details:
  - **Website URL**: `https://agentmeshcommunicationprotocol.github.io`
  - **Stream name**: "AMCP Main Site"
  - Click **Create stream**

**Step 4**: Get tracking ID
- After stream creation, you'll see the **Measurement ID**
- Format: `G-XXXXXXXXXX`
- **Copy this ID** - you'll need it next

### 3.2 Add Tracking to Website

**Step 1**: Update _config.yml
- Open: `/home/kalxav/CascadeProjects/amcp-github-pages/_config.yml`
- Find the line: `google_analytics: # UA-XXXXXXXX-X`
- Replace with your Measurement ID:
  ```yaml
  google_analytics: "G-XXXXXXXXXX"
  ```
- Save the file

**Step 2**: Verify in layout template
- The file `_layouts/default.html` already has GA tracking code:
  ```html
  <!-- Analytics -->
  {% if jekyll.environment == 'production' and site.google_analytics %}
  <script async src="https://www.googletagmanager.com/gtag/js?id={{ site.google_analytics }}"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '{{ site.google_analytics }}');
  </script>
  {% endif %}
  ```
- This automatically includes GA tracking when `google_analytics` is set

**Step 3**: Deploy changes
- Commit and push:
  ```bash
  git add _config.yml
  git commit -m "Add Google Analytics tracking"
  git push origin main
  ```
- Wait 2-5 minutes for GitHub Pages to rebuild

**Step 4**: Verify tracking is working
- Visit: https://agentmeshcommunicationprotocol.github.io/
- Right-click → **View Page Source**
- Search for `gtag` or `googletagmanager`
- Confirm GA tracking code appears

**Step 5**: Check in Google Analytics
- Go back to Google Analytics
- Click **Realtime** (left sidebar)
- You should see yourself as an active user
- If not, wait 1-2 minutes and refresh

### ✅ Checklist for Task 3
- [ ] GA4 property created
- [ ] Web data stream created
- [ ] Measurement ID copied (G-XXXXXXXXXX)
- [ ] _config.yml updated with Measurement ID
- [ ] Changes deployed to GitHub Pages
- [ ] GA tracking code visible in page source
- [ ] Real-time user activity visible in GA

---

## Task 4: Verify Sitemap Submission

### 4.1 Verify Sitemap Generation

**Step 1**: Check sitemap exists
- Visit: https://agentmeshcommunicationprotocol.github.io/sitemap.xml
- You should see an XML file with all your pages listed
- If not found, the `jekyll-sitemap` plugin may not be enabled

**Step 2**: Verify plugin is enabled
- Open: `/home/kalxav/CascadeProjects/amcp-github-pages/_config.yml`
- Look for the `plugins:` section
- Confirm `jekyll-sitemap` is listed:
  ```yaml
  plugins:
    - jekyll-feed
    - jekyll-sitemap
    - jekyll-seo-tag
  ```
- If missing, add it and redeploy

**Step 3**: Test locally (optional)
- Run: `bundle exec jekyll build`
- Check: `_site/sitemap.xml` exists
- Open the file to verify it contains your pages

### 4.2 Submit Sitemap to Google Search Console

**Step 1**: Go to Google Search Console
- Visit: https://search.google.com/search-console/
- Select your property: `agentmeshcommunicationprotocol.github.io`

**Step 2**: Submit sitemap
- Click **Sitemaps** (left sidebar)
- In the "Add a new sitemap" field, enter:
  ```
  sitemap.xml
  ```
- Click **Submit**
- You should see: "Sitemap successfully submitted"

**Step 3**: Verify submission
- The sitemap should appear in the list
- Status should show: "Success"
- Wait a few minutes for Google to process

### 4.3 Request Indexing of Main Page

**Step 1**: Use URL Inspection tool
- In Google Search Console, click **URL Inspection** (top search bar)
- Enter: `https://agentmeshcommunicationprotocol.github.io/`
- Press Enter

**Step 2**: Request indexing
- Click **Request indexing** button
- Confirm the request
- You should see: "Indexing request received"

**Step 3**: Request indexing for key pages
- Repeat the process for these pages:
  - `/docs/getting-started/`
  - `/examples/`
  - `/whitepaper/`

### ✅ Checklist for Task 4
- [ ] Sitemap accessible at `/sitemap.xml`
- [ ] Sitemap contains all pages
- [ ] `jekyll-sitemap` plugin enabled in _config.yml
- [ ] Sitemap submitted to Google Search Console
- [ ] Submission status shows "Success"
- [ ] Main page indexing requested
- [ ] Key pages indexing requested

---

## Verification Checklist - Complete Week 1

### GitHub Repository
- [ ] Description updated to: "AMCP Core: Java Mobile Agentic Framework for Distributed Systems"
- [ ] Website URL added
- [ ] All 8 topics added (java, agent-framework, distributed-systems, agent-mesh, agent-mobility, aglet, middleware, open-source)

### Google Search Console
- [ ] Property created for: `https://agentmeshcommunicationprotocol.github.io/`
- [ ] Verification completed (status shows "Verified")
- [ ] Sitemap submitted (status shows "Success")
- [ ] Main page indexing requested

### Google Analytics
- [ ] GA4 property created
- [ ] Web data stream created
- [ ] Measurement ID added to _config.yml
- [ ] Tracking code visible in page source
- [ ] Real-time users visible in GA dashboard

### Website Configuration
- [ ] _config.yml updated with keywords
- [ ] _config.yml updated with google_search_console code
- [ ] _config.yml updated with google_analytics ID
- [ ] _layouts/default.html includes GSC verification meta tag
- [ ] _layouts/default.html includes GA tracking code
- [ ] robots.txt exists and is accessible
- [ ] All changes deployed to GitHub Pages

---

## Troubleshooting

### Issue: Google Search Console Verification Not Working

**Solution**:
1. Verify meta tag is in `<head>` section (not in `<body>`)
2. Check for typos in verification code
3. Ensure _config.yml change is deployed
4. Wait 5-10 minutes for GitHub Pages to rebuild
5. Try alternative verification method (DNS or HTML file)

### Issue: Google Analytics Not Showing Data

**Solution**:
1. Verify Measurement ID is correct (starts with G-)
2. Check GA tracking code is in page source
3. Ensure jekyll.environment is set to 'production'
4. Wait 24 hours for data to appear
5. Check GA filters aren't blocking your IP

### Issue: Sitemap Not Submitting

**Solution**:
1. Verify sitemap.xml is accessible
2. Check jekyll-sitemap plugin is enabled
3. Rebuild site locally and check _site/sitemap.xml
4. Try submitting just "sitemap.xml" (not full URL)
5. Check for XML formatting errors

### Issue: Changes Not Appearing on Live Site

**Solution**:
1. Verify changes are committed and pushed
2. Check GitHub Actions build status
3. Wait 2-5 minutes for GitHub Pages to rebuild
4. Hard refresh browser (Ctrl+Shift+R or Cmd+Shift+R)
5. Check for build errors in GitHub Actions

---

## Next Steps (Week 2)

Once Week 1 is complete:

1. **Monitor GSC**: Check for new search queries
2. **Monitor GA**: Track initial traffic
3. **Start Content Creation**: Use BLOG_POST_TEMPLATES.md
4. **Plan Week 2**: Review IMPLEMENTATION_CHECKLIST.md Phase 2

---

## Important Notes

### Security
- Keep your Google Search Console verification code private
- Don't commit verification codes to public repositories
- Use environment variables for sensitive data in production

### Timing
- Google Search Console verification: 5-30 minutes
- Google Analytics data: 24 hours to appear
- Sitemap indexing: 1-7 days
- Page indexing: 1-14 days

### Best Practices
- Check GSC weekly for crawl errors
- Monitor GA for traffic sources
- Review robots.txt regularly
- Keep _config.yml updated

---

## Resources

- [Google Search Console Help](https://support.google.com/webmasters)
- [Google Analytics Help](https://support.google.com/analytics)
- [Jekyll SEO Tag Plugin](https://github.com/jekyll/jekyll-seo-tag)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

---

**Estimated Time to Complete**: 2-3 hours  
**Difficulty Level**: Low to Medium  
**Impact**: High (enables all future tracking)

**Status**: Ready to implement  
**Last Updated**: 2024

---

## Quick Reference - Commands

### Deploy changes:
```bash
git add _config.yml _layouts/default.html
git commit -m "Week 1 setup: GSC and GA configuration"
git push origin main
```

### Check if changes deployed:
```bash
# View page source
curl -s https://agentmeshcommunicationprotocol.github.io/ | grep -i "google-site-verification\|gtag"
```

### Build locally to test:
```bash
bundle exec jekyll build
```

---

**Ready to start Week 1 setup? Follow the tasks above in order!**
