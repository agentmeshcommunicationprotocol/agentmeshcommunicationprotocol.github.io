# Task 3: Google Analytics Setup (20 minutes)

Complete step-by-step guide for setting up Google Analytics 4 tracking on your AMCP website.

---

## 📊 Overview

By the end of this task, you will have:
- ✅ GA4 property created
- ✅ Web data stream configured
- ✅ Measurement ID obtained
- ✅ Tracking added to your website
- ✅ Real-time tracking verified

**Time Required**: ~20 minutes  
**Difficulty**: Low  
**Impact**: HIGH (enables visitor tracking)

---

## Step 1: Create Google Analytics 4 Property (5 minutes)

### 1.1 Go to Google Analytics
- Visit: https://analytics.google.com/
- Sign in with your Google account
- If you don't have an account, create one at https://accounts.google.com/

### 1.2 Create New Property
1. Click **Admin** (bottom left corner)
2. In the "Property" column, click **Create Property**
3. Fill in the property details:
   - **Property name**: `AMCP Website`
   - **Reporting timezone**: Select your timezone (e.g., Europe/Paris)
   - **Currency**: USD
   - Click **Create**

### 1.3 Verify Property Created
- You should see your new property listed
- Status shows "Active"

---

## Step 2: Create Web Data Stream (5 minutes)

### 2.1 Set Up Data Stream
After creating the property, you'll be prompted to create a data stream.

1. Select **Web** as your platform
2. Enter website details:
   - **Website URL**: `https://agentmeshcommunicationprotocol.github.io`
   - **Stream name**: `AMCP Main Site`
   - Click **Create stream**

### 2.2 Verify Data Stream Created
- You should see the stream details page
- Status shows "Active"

---

## Step 3: Get Measurement ID (2 minutes)

### 3.1 Find Your Measurement ID
After creating the stream, you'll see the stream details page.

**Look for**:
- **Measurement ID** (format: `G-XXXXXXXXXX`)
- This is different from the old Universal Analytics ID

### 3.2 Copy Your Measurement ID
- Click the copy icon next to the Measurement ID
- **Save this ID** - you'll need it in the next step
- Example format: `G-ABC123DEF45`

### 3.3 Verify the Format
- Should start with `G-`
- Should be followed by 10 characters (letters and numbers)
- Example: `G-XXXXXXXXXX`

---

## Step 4: Add Measurement ID to _config.yml (5 minutes)

### 4.1 Update Configuration File
1. Open: `/home/kalxav/CascadeProjects/amcp-github-pages/_config.yml`
2. Find the line: `google_analytics: # UA-XXXXXXXX-X`
3. Replace with your Measurement ID:
   ```yaml
   google_analytics: "G-XXXXXXXXXX"
   ```
   (Use your actual Measurement ID from Step 3)

### 4.2 Verify the Change
- Make sure the format is correct
- Should be: `google_analytics: "G-XXXXXXXXXX"`
- Not: `google_analytics: G-XXXXXXXXXX` (needs quotes)

### 4.3 Save the File
- Save the file
- Verify no syntax errors

---

## Step 5: Deploy and Verify Tracking (3 minutes)

### 5.1 Deploy Changes
```bash
cd /home/kalxav/CascadeProjects/amcp-github-pages/
git add _config.yml
git commit -m "Add Google Analytics measurement ID"
git push origin main
```

### 5.2 Wait for Deployment
- GitHub Pages rebuilds in 2-5 minutes
- Check status at: https://github.com/agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io/actions

### 5.3 Verify Tracking Code is Deployed
```bash
# Check if GA tracking code is in the page source
curl -s https://agentmeshcommunicationprotocol.github.io/ | grep -i "gtag\|googletagmanager"
```

Expected output:
```
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
```

### 5.4 Check Real-Time Users in GA
1. Go to: https://analytics.google.com/
2. Select your property: `AMCP Website`
3. Click **Realtime** (left sidebar)
4. Visit your website: https://agentmeshcommunicationprotocol.github.io/
5. You should see yourself as an active user in GA

---

## ✅ Verification Checklist

### GA4 Property
- [ ] Property created: "AMCP Website"
- [ ] Property is active
- [ ] Timezone set correctly
- [ ] Currency set to USD

### Web Data Stream
- [ ] Data stream created: "AMCP Main Site"
- [ ] Website URL: https://agentmeshcommunicationprotocol.github.io
- [ ] Data stream is active

### Measurement ID
- [ ] Measurement ID copied (format: G-XXXXXXXXXX)
- [ ] ID starts with "G-"
- [ ] ID is 10+ characters

### Configuration
- [ ] _config.yml updated with Measurement ID
- [ ] Format is correct: `google_analytics: "G-XXXXXXXXXX"`
- [ ] File saved

### Deployment
- [ ] Changes committed
- [ ] Changes pushed to main
- [ ] GitHub Pages rebuilt (wait 2-5 min)
- [ ] GA tracking code visible in page source

### Verification
- [ ] Real-time users visible in GA dashboard
- [ ] Your visit shows up as active user
- [ ] GA shows data collection is working

---

## 📋 Quick Reference

### GA4 Property Details
| Item | Value |
|------|-------|
| **Property Name** | AMCP Website |
| **Timezone** | Your timezone |
| **Currency** | USD |
| **Status** | Active |

### Data Stream Details
| Item | Value |
|------|-------|
| **Stream Name** | AMCP Main Site |
| **Website URL** | https://agentmeshcommunicationprotocol.github.io |
| **Platform** | Web |
| **Status** | Active |

### Configuration
| Item | Value |
|------|-------|
| **File** | _config.yml |
| **Setting** | google_analytics |
| **Format** | "G-XXXXXXXXXX" |
| **Example** | google_analytics: "G-ABC123DEF45" |

---

## 🆘 Troubleshooting

### Issue: Can't Find Measurement ID

**Solution**:
1. Go to: https://analytics.google.com/
2. Click **Admin** (bottom left)
3. In "Property" column, click on your property
4. Click **Data Streams**
5. Click on your web stream
6. Measurement ID should be at the top

### Issue: GA Not Showing Real-Time Data

**Solution**:
1. Verify Measurement ID is correct (starts with G-)
2. Check _config.yml has correct format with quotes
3. Wait 24 hours for data to appear
4. Hard refresh browser (Ctrl+Shift+R)
5. Try alternative verification method

### Issue: Tracking Code Not Appearing in Page Source

**Solution**:
1. Verify _config.yml is saved correctly
2. Check GitHub Pages build status
3. Wait 5-10 minutes for rebuild
4. Hard refresh browser
5. Check for syntax errors in _config.yml

### Issue: Jekyll Environment Not Production

**Solution**:
- GA tracking only works in production environment
- GitHub Pages automatically sets jekyll.environment to 'production'
- If testing locally, run: `JEKYLL_ENV=production bundle exec jekyll serve`

---

## 📊 What GA Tracks

Once set up, Google Analytics will track:
- ✅ Page views
- ✅ User sessions
- ✅ Traffic sources
- ✅ User behavior
- ✅ Device information
- ✅ Geographic location
- ✅ Bounce rate
- ✅ Time on page

---

## 🔗 Important URLs

| Service | URL |
|---------|-----|
| Google Analytics | https://analytics.google.com/ |
| Your Property | https://analytics.google.com/analytics/web/#/p/[PROPERTY_ID]/home |
| Real-Time Dashboard | https://analytics.google.com/analytics/web/#/p/[PROPERTY_ID]/realtime |
| Your Website | https://agentmeshcommunicationprotocol.github.io/ |

---

## 📝 Deployment Command

```bash
# One-line deployment
cd /home/kalxav/CascadeProjects/amcp-github-pages/ && \
git add _config.yml && \
git commit -m "Add Google Analytics measurement ID" && \
git push origin main
```

---

## ⏱️ Timeline

- **Now**: Create GA4 property and data stream
- **2-5 min**: Deploy _config.yml changes
- **5-10 min**: GitHub Pages rebuilds
- **Immediately**: Check real-time users in GA
- **24 hours**: Full data appears in GA dashboard

---

## 🎯 Next Steps

### Immediately
1. Create GA4 property
2. Create data stream
3. Copy Measurement ID

### In 5 Minutes
1. Update _config.yml
2. Deploy changes
3. Wait for rebuild

### In 10 Minutes
1. Verify tracking code in page source
2. Check real-time users in GA
3. Confirm data collection working

### After Verification
1. Monitor GA dashboard weekly
2. Track traffic sources
3. Analyze user behavior
4. Move to Task 4 (Sitemap Verification)

---

## 💡 Pro Tips

1. **Keep Measurement ID Safe**: Don't share your Measurement ID publicly
2. **Monitor Weekly**: Check GA dashboard weekly for insights
3. **Set Up Alerts**: Create alerts for unusual traffic patterns
4. **Use Real-Time**: Monitor real-time dashboard during promotions
5. **Track Events**: Set up event tracking for important actions

---

## 📚 Additional Resources

- [Google Analytics Help](https://support.google.com/analytics)
- [GA4 Setup Guide](https://support.google.com/analytics/answer/9304153)
- [Measurement ID Help](https://support.google.com/analytics/answer/9539674)
- [Jekyll Configuration](https://jekyllrb.com/docs/configuration/)

---

## Summary

| Step | Time | Status |
|------|------|--------|
| 1. Create GA4 Property | 5 min | ⏳ Ready |
| 2. Create Data Stream | 5 min | ⏳ Ready |
| 3. Get Measurement ID | 2 min | ⏳ Ready |
| 4. Update _config.yml | 5 min | ⏳ Ready |
| 5. Deploy & Verify | 3 min | ⏳ Ready |
| **Total** | **20 min** | **⏳ Ready** |

---

**Ready to set up Google Analytics? Follow the steps above! 🚀**

**Questions? Check the troubleshooting section or Google Analytics Help.**
