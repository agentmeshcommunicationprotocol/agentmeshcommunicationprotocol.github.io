# 🔑 API Keys Setup Guide for AMCP v1.5

## 🚀 Quick Setup Commands

### Option 1: Default Production Keys (Immediate Full Functionality)
```bash
# Set up production keys for immediate full functionality
./setup-api-keys.sh --demo

# Load the keys and launch CLI
source .env
./amcp-cli
```

### Option 2: Interactive Setup (Real API Keys)
```bash
# Interactive setup with real API keys
./setup-api-keys.sh --interactive

# Follow the prompts to enter your real API keys
```

### Option 3: Direct Key Setup
```bash
# Set keys directly (replace with your actual keys)
./setup-api-keys.sh --polygon "your_polygon_key" --openweather "your_weather_key"
```

---

## 🔍 API Key Management

### Check Current Status
```bash
./setup-api-keys.sh --current
```

### Reset All Keys
```bash
./setup-api-keys.sh --reset
```

### Full Help
```bash
./setup-api-keys.sh --help
```

---

## 🌐 Where to Get Real API Keys

### 📈 Polygon.io (Stock Data)
- **URL:** https://polygon.io/dashboard
- **Free Tier:** 5 API calls per minute
- **Features:** Real-time stock prices, market data, historical data
- **Registration:** Email signup required

### 🌤️ OpenWeatherMap (Weather Data)
- **URL:** https://openweathermap.org/api
- **Free Tier:** 1,000 API calls per day
- **Features:** Current weather, forecasts, historical data
- **Registration:** Email signup required

---

## 📁 Configuration Options

### Save to .env File (Project-specific)
```bash
./setup-api-keys.sh --demo --env-file
source .env  # Load for current session
```

### Save to Shell Profile (Permanent)
```bash
./setup-api-keys.sh --demo --shell-profile
# Restart terminal or: source ~/.zshrc
```

---

## 🧪 Testing Your Setup

### 1. Load API Keys
```bash
# If using .env file:
source .env

# If using shell profile, restart terminal or:
source ~/.zshrc  # (or ~/.bashrc)
```

### 2. Launch AMCP CLI
```bash
./amcp-cli
```

### 3. Test Commands
```bash
# In the AMCP CLI:
stock AAPL           # Test stock data
weather "London"     # Test weather data
status apis          # Check API connectivity
```

---

## 🎯 Production Keys Functionality

**Default production keys provide:**
- ✅ Live stock market data from Polygon.io
- ✅ Real-time weather information from OpenWeatherMap  
- ✅ Full API rate limits and functionality
- ✅ Historical data access
- ✅ Production-ready performance

**Custom keys provide:**
- ✅ Your own API quotas and limits
- ✅ Billing control and usage tracking
- ✅ Custom rate limits based on your plan
- ✅ Direct relationship with API providers

---

## 🔧 Troubleshooting

### Keys Not Working?
```bash
# Check if keys are loaded
echo $POLYGON_API_KEY
echo $OPENWEATHER_API_KEY

# Check configuration files
./setup-api-keys.sh --current

# Reload environment
source .env  # or restart terminal
```

### API Errors?
```bash
# In AMCP CLI, check API status
status apis

# Run connectivity tests
connectivity

# Check agent diagnostics
diagnose stock
diagnose weather
```

---

## 📊 Status Indicators in CLI

When you run `./amcp-cli`, you'll see status indicators:

- 🟢 **Green**: API configured and working
- 🔴 **Red**: API not configured or having issues
- ✅ **Checkmark**: Using production keys (full functionality)

Example:
```
🟢[eventbroker] 🟢[openweather] 🟢[polygon.io] amcp>
```

---

## 🎉 Ready to Go!

1. **Quick Start:** `./setup-api-keys.sh --demo` (uses production keys)
2. **Load Keys:** `source .env`
3. **Launch CLI:** `./amcp-cli`
4. **Test:** Try `stock AAPL` or `weather London` (real data!)

**Your AMCP system is ready for multi-agent interaction with live production data!**