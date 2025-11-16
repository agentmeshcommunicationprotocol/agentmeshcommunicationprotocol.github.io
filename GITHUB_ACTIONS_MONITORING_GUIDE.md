# GitHub Actions Monitoring Guide

## Status: ✅ MONITORING SCRIPTS DEPLOYED

**Date**: 2025-11-16 09:26 UTC+01:00
**Scripts**: 2 (Bash + Python)
**Repository**: https://github.com/agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io

---

## Quick Start

### Option 1: Python Version (Recommended)
```bash
# Single check
python3 monitor_github_actions.py

# Continuous monitoring
python3 monitor_github_actions.py --watch

# Verbose output
python3 monitor_github_actions.py --watch --verbose

# Custom timeout (2 hours)
python3 monitor_github_actions.py --watch --timeout 7200
```

### Option 2: Bash Version
```bash
# Single check
./monitor-github-actions.sh

# Continuous monitoring
./monitor-github-actions.sh --watch

# Verbose output
./monitor-github-actions.sh --watch --verbose
```

---

## What These Scripts Do

### Monitoring Features
✅ **Real-time Status** - Check workflow status instantly
✅ **Continuous Watch** - Monitor until deployment completes
✅ **Colored Output** - Easy-to-read status indicators
✅ **Timestamps** - Track when each check occurred
✅ **Detailed Info** - Workflow ID, commit SHA, timestamps
✅ **Auto-refresh** - Updates every 30 seconds
✅ **Timeout Protection** - Stops after 1 hour (configurable)
✅ **Error Handling** - Graceful handling of API errors

### Status Indicators
- 🟢 **✓ SUCCESS** - Workflow completed successfully
- 🔴 **✗ FAILURE** - Workflow failed
- 🟡 **⏳ PENDING** - Workflow in progress
- 🔵 **ℹ INFO** - Information messages
- 🔴 **✗ ERROR** - Error occurred

---

## Python Version (Recommended)

### Installation
```bash
# Install required package
pip install requests

# Or with pip3
pip3 install requests
```

### Usage Examples

**Single Status Check**
```bash
python3 monitor_github_actions.py
```
Output:
```
GitHub Actions Monitoring Script
Repository: agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io
Branch: main

======================================================================
GitHub Actions Workflow Status
======================================================================

ℹ INFO [09:26:15]: Repository: agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io
ℹ INFO [09:26:15]: Branch: main
ℹ INFO [09:26:15]: Workflow: Deploy Jekyll site to Pages
ℹ INFO [09:26:15]: Run ID: 12345678
ℹ INFO [09:26:15]: Commit SHA: fcc35a2
ℹ INFO [09:26:15]: Created: 2025-11-16T09:26:00Z
ℹ INFO [09:26:15]: Updated: 2025-11-16T09:26:15Z

✓ SUCCESS [09:26:15]: Workflow completed successfully!
ℹ INFO [09:26:15]: Website: https://agentmeshcommunicationprotocol.github.io
ℹ INFO [09:26:15]: Actions: https://github.com/agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io/actions/runs/12345678
```

**Continuous Monitoring**
```bash
python3 monitor_github_actions.py --watch
```
Output:
```
GitHub Actions Monitoring Script
Repository: agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io
Branch: main

ℹ INFO [09:26:15]: Monitoring mode enabled (updates every 30s)
ℹ INFO [09:26:15]: Press Ctrl+C to stop monitoring

[09:26:15] Status: queued | Conclusion: None
[09:26:45] Status: in_progress | Conclusion: None
[09:27:15] Status: in_progress | Conclusion: None
[09:27:45] Status: completed | Conclusion: success

✓ SUCCESS [09:27:45]: Deployment completed successfully!
ℹ INFO [09:27:45]: Website: https://agentmeshcommunicationprotocol.github.io
```

**Verbose Output**
```bash
python3 monitor_github_actions.py --watch --verbose
```

---

## Bash Version

### Requirements
- `curl` (usually pre-installed)
- `grep`, `sed` (standard Unix tools)
- `bash` 4.0+

### Usage Examples

**Single Status Check**
```bash
./monitor-github-actions.sh
```

**Continuous Monitoring**
```bash
./monitor-github-actions.sh --watch
```

**Verbose Output**
```bash
./monitor-github-actions.sh --watch --verbose
```

---

## Monitoring Workflow

### Typical Deployment Timeline

```
Time    | Status       | Action
--------|--------------|------------------------------------------
09:26   | Queued       | Workflow waiting to start
09:27   | In Progress  | Build and deployment running
09:28   | In Progress  | Jekyll building site
09:29   | In Progress  | Deploying to GitHub Pages
09:30   | Completed    | ✓ SUCCESS - Website live!
```

### What Happens During Deployment

1. **Queued** (0-1 min)
   - Workflow waiting for runner
   - GitHub Actions allocating resources

2. **In Progress** (1-3 min)
   - Checking out code
   - Installing dependencies
   - Building Jekyll site
   - Running tests
   - Deploying to GitHub Pages

3. **Completed** (3-5 min total)
   - Website deployed
   - GitHub Pages updated
   - Changes live at https://agentmeshcommunicationprotocol.github.io

---

## Interpreting Results

### Success
```
✓ SUCCESS: Workflow completed successfully!
Website: https://agentmeshcommunicationprotocol.github.io
```
**Action**: Website is live with latest changes

### Failure
```
✗ FAILURE: Workflow failed with conclusion: failure
Check logs: https://github.com/.../actions/runs/12345678
```
**Action**: Check logs for error details, review recent changes

### Pending
```
⏳ PENDING: Workflow is currently running...
```
**Action**: Wait for completion, check back in 30 seconds

---

## Troubleshooting

### Script Won't Run
**Problem**: "Permission denied"
**Solution**:
```bash
chmod +x monitor_github_actions.py
chmod +x monitor-github-actions.sh
```

### Python: "ModuleNotFoundError: No module named 'requests'"
**Problem**: requests library not installed
**Solution**:
```bash
pip install requests
# or
pip3 install requests
```

### API Rate Limiting
**Problem**: "Failed to fetch workflow: 403 Forbidden"
**Solution**:
- GitHub API has rate limits (60 requests/hour unauthenticated)
- Wait a few minutes and try again
- Or use GitHub token for higher limits

### Timeout
**Problem**: "Monitoring timeout - workflow took too long"
**Solution**:
- Increase timeout: `python3 monitor_github_actions.py --watch --timeout 7200`
- Check GitHub Actions page for issues
- Verify website status manually

---

## Advanced Usage

### Monitor in Background
```bash
# Run in background
nohup python3 monitor_github_actions.py --watch > monitoring.log 2>&1 &

# Check log file
tail -f monitoring.log

# Stop monitoring
pkill -f monitor_github_actions.py
```

### Monitor Multiple Deployments
```bash
# Monitor in one terminal
python3 monitor_github_actions.py --watch

# In another terminal, check website
curl -I https://agentmeshcommunicationprotocol.github.io
```

### Automated Monitoring
```bash
# Create a cron job to check every 5 minutes
*/5 * * * * cd /path/to/repo && python3 monitor_github_actions.py >> monitoring.log 2>&1
```

### Email Notifications (Future)
```bash
# Bash version has placeholder for email
./monitor-github-actions.sh --watch --email
```

---

## Monitoring Checklist

### Before Deployment
- [ ] All changes committed
- [ ] All changes pushed to GitHub
- [ ] No uncommitted changes

### During Deployment
- [ ] Run monitoring script
- [ ] Watch for status updates
- [ ] Check for any errors

### After Deployment
- [ ] Verify website is live
- [ ] Check all sections load
- [ ] Test video playback
- [ ] Verify responsive design

---

## Key Metrics to Track

### Workflow Metrics
- **Status**: queued, in_progress, completed
- **Conclusion**: success, failure, cancelled
- **Duration**: Total time from start to finish
- **Run ID**: Unique identifier for workflow run

### Website Metrics
- **Deploy Time**: Time from push to live
- **Build Time**: Time to build Jekyll site
- **Success Rate**: Percentage of successful deployments

---

## Resources

### GitHub Actions
- **Actions Page**: https://github.com/agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io/actions
- **Workflow Runs**: https://github.com/agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io/actions?query=branch%3Amain

### Website
- **Live Site**: https://agentmeshcommunicationprotocol.github.io
- **GitHub Pages**: https://pages.github.com/

### Documentation
- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **Jekyll Docs**: https://jekyllrb.com/docs/

---

## Script Comparison

| Feature | Bash | Python |
|---------|------|--------|
| **Dependencies** | curl, grep, sed | requests library |
| **Reliability** | Good | Excellent |
| **Error Handling** | Basic | Advanced |
| **Output Quality** | Good | Excellent |
| **Performance** | Fast | Fast |
| **Maintainability** | Medium | High |
| **Recommended** | Fallback | Primary |

---

## Summary

### What's Included
✅ **monitor_github_actions.py** - Python monitoring script (recommended)
✅ **monitor-github-actions.sh** - Bash monitoring script (fallback)
✅ **Comprehensive documentation** - This guide
✅ **Multiple usage options** - Single check or continuous watch

### How to Use
1. Run Python script: `python3 monitor_github_actions.py --watch`
2. Or Bash script: `./monitor-github-actions.sh --watch`
3. Monitor until deployment completes
4. Verify website is live

### Expected Results
- Workflow completes in 2-5 minutes
- Website updates live at https://agentmeshcommunicationprotocol.github.io
- All changes deployed successfully

---

**Setup Date**: 2025-11-16
**Status**: ✅ READY FOR USE
**Recommended**: Python version with --watch flag
**Next Action**: Run monitoring script to track deployment
