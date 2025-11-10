# Week 1 Setup - Quick Reference Card

Fast reference for all Week 1 tasks. Print or bookmark this page.

---

## Task 1: GitHub Repository (15 minutes)

### Update Description
```
URL: https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/settings
Description: AMCP Core: Java Mobile Agentic Framework for Distributed Systems
Website: https://agentmeshcommunicationprotocol.github.io
```

### Add Topics
```
URL: https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/settings/general
Topics (add all 8):
- java
- agent-framework
- distributed-systems
- agent-mesh
- agent-mobility
- aglet
- middleware
- open-source
```

---

## Task 2: Google Search Console (30 minutes)

### Step 1: Create Property
```
URL: https://search.google.com/search-console/
Click: Add property
Select: URL prefix
Enter: https://agentmeshcommunicationprotocol.github.io/
```

### Step 2: Get Verification Code
```
Choose: HTML tag verification method
Copy: <meta name="google-site-verification" content="XXXXX..." />
Save the code (you'll need it next)
```

### Step 3: Add to Website
```
File: _config.yml
Find: google_search_console: # Add your verification code here
Replace with: google_search_console: "XXXXX..."
(Use the code from Step 2)
```

### Step 4: Deploy
```bash
git add _config.yml
git commit -m "Add Google Search Console verification"
git push origin main
```

### Step 5: Verify
```
Wait 2-5 minutes for deployment
Visit: https://agentmeshcommunicationprotocol.github.io/
Right-click → View Page Source
Search for: google-site-verification
Confirm: Your code appears in <head>
```

### Step 6: Complete in GSC
```
Return to Google Search Console
Click: Verify button
Expected: "Verification successful"
```

### Step 7: Submit Sitemap
```
In GSC, click: Sitemaps (left sidebar)
Enter: sitemap.xml
Click: Submit
Expected: "Sitemap successfully submitted"
```

### Step 8: Request Indexing
```
In GSC, click: URL Inspection (top search bar)
Enter: https://agentmeshcommunicationprotocol.github.io/
Click: Request indexing
Repeat for:
- /docs/getting-started/
- /examples/
- /whitepaper/
```

---

## Task 3: Google Analytics (20 minutes)

### Step 1: Create Property
```
URL: https://analytics.google.com/
Click: Admin (bottom left)
Click: Create Property
Property name: AMCP Website
Timezone: Your timezone
Currency: USD
Click: Create
```

### Step 2: Create Data Stream
```
Select: Web
Website URL: https://agentmeshcommunicationprotocol.github.io
Stream name: AMCP Main Site
Click: Create stream
```

### Step 3: Get Measurement ID
```
After stream creation, you'll see: Measurement ID
Format: G-XXXXXXXXXX
Copy this ID
```

### Step 4: Add to Website
```
File: _config.yml
Find: google_analytics: # UA-XXXXXXXX-X
Replace with: google_analytics: "G-XXXXXXXXXX"
(Use your Measurement ID from Step 3)
```

### Step 5: Deploy
```bash
git add _config.yml
git commit -m "Add Google Analytics tracking"
git push origin main
```

### Step 6: Verify
```
Wait 2-5 minutes for deployment
Visit: https://agentmeshcommunicationprotocol.github.io/
Right-click → View Page Source
Search for: gtag or googletagmanager
Confirm: GA tracking code appears
```

### Step 7: Check Real-Time
```
Go to: Google Analytics
Click: Realtime (left sidebar)
You should see yourself as an active user
If not, wait 1-2 minutes and refresh
```

---

## Task 4: Sitemap Verification (10 minutes)

### Verify Sitemap Exists
```
Visit: https://agentmeshcommunicationprotocol.github.io/sitemap.xml
Expected: XML file with all pages listed
```

### Verify Plugin Enabled
```
File: _config.yml
Look for: plugins:
Confirm: jekyll-sitemap is listed
If missing, add it and redeploy
```

### Submit to GSC (Already done in Task 2)
```
Already submitted in Task 2, Step 7
Check status: Should show "Success"
```

---

## Verification Checklist

### GitHub ✓
- [ ] Description updated
- [ ] Website URL added
- [ ] All 8 topics added

### Google Search Console ✓
- [ ] Property created
- [ ] Verification completed
- [ ] Sitemap submitted
- [ ] Main page indexing requested

### Google Analytics ✓
- [ ] Property created
- [ ] Data stream created
- [ ] Measurement ID added to _config.yml
- [ ] Tracking code visible in page source
- [ ] Real-time users visible

### Website ✓
- [ ] _config.yml updated with GSC code
- [ ] _config.yml updated with GA ID
- [ ] robots.txt exists
- [ ] All changes deployed

---

## Common Issues & Fixes

| Issue | Fix |
|-------|-----|
| GSC verification not working | Wait 5-10 min, check for typos, verify meta tag in `<head>` |
| GA not showing data | Check Measurement ID is correct (G-), wait 24 hours |
| Sitemap not found | Verify jekyll-sitemap plugin enabled, rebuild site |
| Changes not live | Hard refresh (Ctrl+Shift+R), check GitHub Actions status |

---

## Files Modified

```
_config.yml
  - Added: google_search_console: "XXXXX..."
  - Added: google_analytics: "G-XXXXXXXXXX"

_layouts/default.html
  - Added: GSC verification meta tag (conditional)
  - Already has: GA tracking code (conditional)
```

---

## Time Breakdown

- Task 1 (GitHub): 15 minutes
- Task 2 (GSC): 30 minutes
- Task 3 (GA): 20 minutes
- Task 4 (Sitemap): 10 minutes
- **Total: ~75 minutes (1.25 hours)**

---

## Deployment Command

```bash
# One-line deployment of all changes
git add _config.yml _layouts/default.html && \
git commit -m "Week 1 setup: GSC and GA configuration" && \
git push origin main
```

---

## Verification Commands

```bash
# Check if GSC meta tag is deployed
curl -s https://agentmeshcommunicationprotocol.github.io/ | grep google-site-verification

# Check if GA tracking is deployed
curl -s https://agentmeshcommunicationprotocol.github.io/ | grep gtag

# Build locally to test
bundle exec jekyll build

# Check sitemap locally
cat _site/sitemap.xml
```

---

## Next Steps After Week 1

1. ✅ Monitor Google Search Console for crawl errors
2. ✅ Check Google Analytics for initial traffic
3. ✅ Start Week 2: Content Creation (BLOG_POST_TEMPLATES.md)
4. ✅ Plan Week 3: Community Promotion (COMMUNITY_PROMOTION_STRATEGY.md)

---

## Important URLs

| Service | URL |
|---------|-----|
| GitHub Repo | https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io |
| GitHub Settings | https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/settings |
| GitHub Topics | https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/settings/general |
| Website | https://agentmeshcommunicationprotocol.github.io/ |
| Sitemap | https://agentmeshcommunicationprotocol.github.io/sitemap.xml |
| GSC | https://search.google.com/search-console/ |
| GA | https://analytics.google.com/ |

---

## Status Tracking

| Task | Status | Completed |
|------|--------|-----------|
| GitHub Description | ⏳ Pending | [ ] |
| GitHub Topics | ⏳ Pending | [ ] |
| GSC Property | ⏳ Pending | [ ] |
| GSC Verification | ⏳ Pending | [ ] |
| GSC Sitemap | ⏳ Pending | [ ] |
| GSC Indexing | ⏳ Pending | [ ] |
| GA Property | ⏳ Pending | [ ] |
| GA Data Stream | ⏳ Pending | [ ] |
| GA Tracking | ⏳ Pending | [ ] |
| Sitemap Verified | ⏳ Pending | [ ] |

---

**Print this page or bookmark it for easy reference during Week 1 setup!**

**Estimated Time: 1.5 hours | Difficulty: Low-Medium | Impact: High**
