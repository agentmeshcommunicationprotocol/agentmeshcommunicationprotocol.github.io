#!/bin/bash

################################################################################
# GitHub Actions Monitoring Script
# Monitors GitHub Actions workflows for AMCP website deployment
# 
# Usage: ./monitor-github-actions.sh [options]
# Options:
#   --watch          Keep monitoring (updates every 30 seconds)
#   --verbose        Show detailed output
#   --email          Send email on failure (requires configuration)
#   --help           Show this help message
################################################################################

set -e

# Configuration
REPO="agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io"
GITHUB_API="https://api.github.com/repos/$REPO"
BRANCH="main"
WATCH_MODE=false
VERBOSE=false
EMAIL_ON_FAILURE=false
CHECK_INTERVAL=30
MAX_CHECKS=120  # 60 minutes with 30-second intervals

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --watch)
            WATCH_MODE=true
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        --email)
            EMAIL_ON_FAILURE=true
            shift
            ;;
        --help)
            grep "^#" "$0" | grep -v "^#!/bin/bash" | sed 's/^# //'
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Function to print colored output
print_status() {
    local status=$1
    local message=$2
    
    case $status in
        success)
            echo -e "${GREEN}✓ SUCCESS${NC}: $message"
            ;;
        failure)
            echo -e "${RED}✗ FAILURE${NC}: $message"
            ;;
        pending)
            echo -e "${YELLOW}⏳ PENDING${NC}: $message"
            ;;
        info)
            echo -e "${BLUE}ℹ INFO${NC}: $message"
            ;;
    esac
}

# Function to get latest workflow run
get_latest_workflow() {
    local response=$(curl -s "$GITHUB_API/actions/runs?branch=$BRANCH&per_page=1")
    echo "$response"
}

# Function to parse workflow data
parse_workflow() {
    local json=$1
    
    # Extract workflow data
    local run_id=$(echo "$json" | grep -o '"id":[0-9]*' | head -1 | cut -d: -f2)
    local status=$(echo "$json" | grep -o '"status":"[^"]*"' | head -1 | cut -d'"' -f4)
    local conclusion=$(echo "$json" | grep -o '"conclusion":"[^"]*"' | head -1 | cut -d'"' -f4)
    local name=$(echo "$json" | grep -o '"name":"[^"]*"' | head -1 | cut -d'"' -f4)
    local head_branch=$(echo "$json" | grep -o '"head_branch":"[^"]*"' | head -1 | cut -d'"' -f4)
    local head_sha=$(echo "$json" | grep -o '"head_sha":"[^"]*"' | head -1 | cut -d'"' -f4)
    local created_at=$(echo "$json" | grep -o '"created_at":"[^"]*"' | head -1 | cut -d'"' -f4)
    local updated_at=$(echo "$json" | grep -o '"updated_at":"[^"]*"' | head -1 | cut -d'"' -f4)
    
    # Output as key=value pairs
    echo "run_id=$run_id"
    echo "status=$status"
    echo "conclusion=$conclusion"
    echo "name=$name"
    echo "head_branch=$head_branch"
    echo "head_sha=$head_sha"
    echo "created_at=$created_at"
    echo "updated_at=$updated_at"
}

# Function to display workflow status
display_status() {
    local workflow_data=$1
    
    # Parse workflow data
    eval "$workflow_data"
    
    echo ""
    echo "════════════════════════════════════════════════════════════════"
    echo "GitHub Actions Workflow Status"
    echo "════════════════════════════════════════════════════════════════"
    echo ""
    
    print_status "info" "Repository: $REPO"
    print_status "info" "Branch: $head_branch"
    print_status "info" "Workflow: $name"
    print_status "info" "Run ID: $run_id"
    print_status "info" "Commit SHA: ${head_sha:0:7}"
    print_status "info" "Created: $created_at"
    print_status "info" "Updated: $updated_at"
    echo ""
    
    # Display status
    if [ "$status" = "completed" ]; then
        if [ "$conclusion" = "success" ]; then
            print_status "success" "Workflow completed successfully"
            echo ""
            print_status "info" "Website should be live at: https://agentmeshcommunicationprotocol.github.io"
        elif [ "$conclusion" = "failure" ]; then
            print_status "failure" "Workflow failed with conclusion: $conclusion"
            echo ""
            print_status "info" "Check logs at: https://github.com/$REPO/actions/runs/$run_id"
        else
            print_status "pending" "Workflow completed with conclusion: $conclusion"
        fi
    elif [ "$status" = "in_progress" ]; then
        print_status "pending" "Workflow is currently running..."
    elif [ "$status" = "queued" ]; then
        print_status "pending" "Workflow is queued and waiting to run..."
    else
        print_status "info" "Workflow status: $status"
    fi
    
    echo ""
    echo "════════════════════════════════════════════════════════════════"
    echo ""
}

# Function to check if workflow is complete
is_workflow_complete() {
    local workflow_data=$1
    eval "$workflow_data"
    
    if [ "$status" = "completed" ]; then
        return 0
    else
        return 1
    fi
}

# Function to send email notification
send_email_notification() {
    local subject=$1
    local message=$2
    
    if [ "$EMAIL_ON_FAILURE" = true ]; then
        # This would require mail/sendmail to be configured
        # Placeholder for email functionality
        echo "Email notification would be sent: $subject - $message"
    fi
}

# Main monitoring loop
monitor_workflow() {
    local check_count=0
    local last_run_id=""
    
    while true; do
        check_count=$((check_count + 1))
        
        # Get latest workflow
        local workflow_json=$(get_latest_workflow)
        local workflow_data=$(parse_workflow "$workflow_json")
        
        # Extract run_id for comparison
        eval "$workflow_data"
        
        # Display status
        if [ "$VERBOSE" = true ] || [ "$check_count" -eq 1 ] || [ "$run_id" != "$last_run_id" ]; then
            display_status "$workflow_data"
        else
            # Show simple status update
            echo -ne "\r[$(date '+%H:%M:%S')] Status: $status | Conclusion: $conclusion"
        fi
        
        # Check if workflow is complete
        if is_workflow_complete "$workflow_data"; then
            echo ""
            echo ""
            
            if [ "$conclusion" = "success" ]; then
                print_status "success" "Deployment completed successfully!"
                echo ""
                print_status "info" "Website URL: https://agentmeshcommunicationprotocol.github.io"
                print_status "info" "GitHub Actions: https://github.com/$REPO/actions/runs/$run_id"
                exit 0
            elif [ "$conclusion" = "failure" ]; then
                print_status "failure" "Deployment failed!"
                echo ""
                print_status "info" "Check logs at: https://github.com/$REPO/actions/runs/$run_id"
                send_email_notification "GitHub Actions Failed" "Deployment for $REPO failed"
                exit 1
            else
                print_status "pending" "Deployment completed with status: $conclusion"
                exit 0
            fi
        fi
        
        # Check if we should continue watching
        if [ "$WATCH_MODE" = false ]; then
            # Single check mode - exit after first check
            exit 0
        fi
        
        # Check if we've exceeded max checks
        if [ $check_count -ge $MAX_CHECKS ]; then
            print_status "failure" "Monitoring timeout - workflow took too long"
            exit 1
        fi
        
        # Update last_run_id
        last_run_id=$run_id
        
        # Wait before next check
        sleep $CHECK_INTERVAL
    done
}

# Function to display help
show_help() {
    echo "GitHub Actions Monitoring Script"
    echo ""
    echo "Usage: ./monitor-github-actions.sh [options]"
    echo ""
    echo "Options:"
    echo "  --watch          Keep monitoring (updates every 30 seconds)"
    echo "  --verbose        Show detailed output"
    echo "  --email          Send email on failure"
    echo "  --help           Show this help message"
    echo ""
    echo "Examples:"
    echo "  # Check current status once"
    echo "  ./monitor-github-actions.sh"
    echo ""
    echo "  # Monitor until deployment completes"
    echo "  ./monitor-github-actions.sh --watch"
    echo ""
    echo "  # Monitor with detailed output"
    echo "  ./monitor-github-actions.sh --watch --verbose"
    echo ""
}

# Main execution
main() {
    echo "GitHub Actions Monitoring Script"
    echo "Repository: $REPO"
    echo "Branch: $BRANCH"
    echo ""
    
    if [ "$WATCH_MODE" = true ]; then
        print_status "info" "Monitoring mode enabled (updates every $CHECK_INTERVAL seconds)"
        print_status "info" "Press Ctrl+C to stop monitoring"
        echo ""
    fi
    
    monitor_workflow
}

# Run main function
main
