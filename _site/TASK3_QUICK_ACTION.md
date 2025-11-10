# Task 3: Google Analytics - Quick Action Guide

Fast reference for setting up Google Analytics 4 tracking.

---

## ⚡ 5-Minute Quick Start

### Step 1: Create GA4 Property (2 min)
```
1. Go to: https://analytics.google.com/
2. Click: Admin → Create Property
3. Enter: Property name = "AMCP Website"
4. Select: Your timezone
5. Currency: USD
6. Click: Create
```

### Step 2: Create Web Data Stream (2 min)
```
1. Select: Web platform
2. Enter: Website URL = https://agentmeshcommunicationprotocol.github.io
3. Enter: Stream name = "AMCP Main Site"
4. Click: Create stream
```

### Step 3: Copy Measurement ID (1 min)
```
1. Look for: Measurement ID (format: G-XXXXXXXXXX)
2. Click: Copy icon
3. Save: Your Measurement ID
```

---

## 🔧 Configuration (5 min)

### Update _config.yml
```yaml
# Find this line:
google_analytics: # UA-XXXXXXXX-X

# Replace with:
google_analytics: "G-XXXXXXXXXX"
```

### Deploy
```bash
cd /home/kalxav/CascadeProjects/amcp-github-pages/
git add _config.yml
git commit -m "Add Google Analytics measurement ID"
git push origin main
```

---

## ✅ Verify (5 min)

### Check Tracking Code
```bash
curl -s https://agentmeshcommunicationprotocol.github.io/ | grep gtag
```

### Check Real-Time Users
```
1. Go to: https://analytics.google.com/
2. Click: Realtime
3. Visit: https://agentmeshcommunicationprotocol.github.io/
4. You should appear as active user
```

---

## 📋 Checklist

- [ ] GA4 property created
- [ ] Data stream created
- [ ] Measurement ID copied (G-XXXXXXXXXX)
- [ ] _config.yml updated
- [ ] Changes deployed
- [ ] Tracking code verified
- [ ] Real-time users visible

---

## 🆘 If 404 Error on GSC File

**Don't worry!** This is normal. GitHub Pages sometimes takes time to serve new files.

**Solution**:
1. Wait 5-10 minutes
2. Hard refresh: Ctrl+Shift+R
3. Try again: https://agentmeshcommunicationprotocol.github.io/googleff0d734753b20703.html

**Meanwhile**: Continue with Task 3 (Google Analytics) - it doesn't depend on GSC file.

---

## 📊 Your Measurement ID Format

```
G-XXXXXXXXXX
```

Examples:
- G-ABC123DEF45
- G-1234567890
- G-ABCDEFGHIJ

---

## 🎯 Next After Task 3

Once GA is set up:
1. Wait for GSC file to be accessible
2. Complete GSC verification
3. Move to Task 4 (Sitemap Verification)

---

**Total Time: ~20 minutes**

**Start with Step 1 above! 🚀**
