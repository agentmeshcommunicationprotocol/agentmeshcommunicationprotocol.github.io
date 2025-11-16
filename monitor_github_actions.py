#!/usr/bin/env python3
"""
GitHub Actions Monitoring Script
Monitors GitHub Actions workflows for AMCP website deployment

Usage:
    python3 monitor_github_actions.py [--watch] [--verbose] [--timeout SECONDS]

Options:
    --watch         Keep monitoring until workflow completes
    --verbose       Show detailed output
    --timeout SECS  Maximum monitoring time (default: 3600 seconds / 1 hour)
    --help          Show this help message
"""

import requests
import json
import time
import sys
import argparse
from datetime import datetime
from typing import Dict, Optional, Tuple

# Configuration
REPO = "agentmeshcommunicationprotocol/agentmeshcommunicationprotocol.github.io"
GITHUB_API = f"https://api.github.com/repos/{REPO}"
BRANCH = "main"
CHECK_INTERVAL = 30  # seconds

# ANSI Colors
class Colors:
    RED = '\033[0;31m'
    GREEN = '\033[0;32m'
    YELLOW = '\033[1;33m'
    BLUE = '\033[0;34m'
    CYAN = '\033[0;36m'
    NC = '\033[0m'  # No Color
    BOLD = '\033[1m'

class GitHubActionsMonitor:
    """Monitor GitHub Actions workflows"""
    
    def __init__(self, repo: str, branch: str = "main", verbose: bool = False):
        self.repo = repo
        self.branch = branch
        self.verbose = verbose
        self.api_url = f"https://api.github.com/repos/{repo}"
        self.last_run_id = None
        
    def get_latest_workflow(self) -> Optional[Dict]:
        """Fetch latest workflow run from GitHub API"""
        try:
            url = f"{self.api_url}/actions/runs?branch={self.branch}&per_page=1"
            response = requests.get(url, timeout=10)
            response.raise_for_status()
            
            data = response.json()
            if data.get('workflow_runs') and len(data['workflow_runs']) > 0:
                return data['workflow_runs'][0]
            return None
        except requests.exceptions.RequestException as e:
            self.print_status("error", f"Failed to fetch workflow: {e}")
            return None
    
    def print_status(self, status: str, message: str):
        """Print colored status message"""
        timestamp = datetime.now().strftime("%H:%M:%S")
        
        if status == "success":
            print(f"{Colors.GREEN}✓ SUCCESS{Colors.NC} [{timestamp}]: {message}")
        elif status == "failure":
            print(f"{Colors.RED}✗ FAILURE{Colors.NC} [{timestamp}]: {message}")
        elif status == "pending":
            print(f"{Colors.YELLOW}⏳ PENDING{Colors.NC} [{timestamp}]: {message}")
        elif status == "info":
            print(f"{Colors.BLUE}ℹ INFO{Colors.NC} [{timestamp}]: {message}")
        elif status == "error":
            print(f"{Colors.RED}✗ ERROR{Colors.NC} [{timestamp}]: {message}")
        elif status == "header":
            print(f"\n{Colors.BOLD}{Colors.CYAN}{'='*70}{Colors.NC}")
            print(f"{Colors.BOLD}{Colors.CYAN}{message}{Colors.NC}")
            print(f"{Colors.BOLD}{Colors.CYAN}{'='*70}{Colors.NC}\n")
    
    def display_workflow_status(self, workflow: Dict):
        """Display detailed workflow status"""
        run_id = workflow.get('id')
        status = workflow.get('status')
        conclusion = workflow.get('conclusion')
        name = workflow.get('name')
        head_branch = workflow.get('head_branch')
        head_sha = workflow.get('head_sha', '')[:7]
        created_at = workflow.get('created_at')
        updated_at = workflow.get('updated_at')
        
        self.print_status("header", "GitHub Actions Workflow Status")
        
        self.print_status("info", f"Repository: {self.repo}")
        self.print_status("info", f"Branch: {head_branch}")
        self.print_status("info", f"Workflow: {name}")
        self.print_status("info", f"Run ID: {run_id}")
        self.print_status("info", f"Commit SHA: {head_sha}")
        self.print_status("info", f"Created: {created_at}")
        self.print_status("info", f"Updated: {updated_at}")
        
        # Display status
        if status == "completed":
            if conclusion == "success":
                self.print_status("success", "Workflow completed successfully!")
                self.print_status("info", f"Website: https://agentmeshcommunicationprotocol.github.io")
                self.print_status("info", f"Actions: https://github.com/{self.repo}/actions/runs/{run_id}")
            elif conclusion == "failure":
                self.print_status("failure", f"Workflow failed with conclusion: {conclusion}")
                self.print_status("info", f"Check logs: https://github.com/{self.repo}/actions/runs/{run_id}")
            else:
                self.print_status("pending", f"Workflow completed with conclusion: {conclusion}")
        elif status == "in_progress":
            self.print_status("pending", "Workflow is currently running...")
        elif status == "queued":
            self.print_status("pending", "Workflow is queued and waiting to run...")
        else:
            self.print_status("info", f"Workflow status: {status}")
        
        print()
    
    def is_workflow_complete(self, workflow: Dict) -> bool:
        """Check if workflow is complete"""
        return workflow.get('status') == 'completed'
    
    def monitor(self, watch: bool = False, timeout: int = 3600) -> int:
        """Monitor workflow status"""
        start_time = time.time()
        check_count = 0
        
        self.print_status("info", f"Repository: {self.repo}")
        self.print_status("info", f"Branch: {self.branch}")
        
        if watch:
            self.print_status("info", f"Monitoring mode enabled (updates every {CHECK_INTERVAL}s)")
            self.print_status("info", "Press Ctrl+C to stop monitoring")
        
        print()
        
        while True:
            check_count += 1
            elapsed = time.time() - start_time
            
            # Check timeout
            if elapsed > timeout:
                self.print_status("failure", f"Monitoring timeout after {timeout}s")
                return 1
            
            # Fetch workflow
            workflow = self.get_latest_workflow()
            if not workflow:
                self.print_status("error", "Could not fetch workflow data")
                if not watch:
                    return 1
                time.sleep(CHECK_INTERVAL)
                continue
            
            run_id = workflow.get('id')
            status = workflow.get('status')
            conclusion = workflow.get('conclusion')
            
            # Display status
            if check_count == 1 or run_id != self.last_run_id or self.verbose:
                self.display_workflow_status(workflow)
            else:
                # Simple status update
                timestamp = datetime.now().strftime("%H:%M:%S")
                sys.stdout.write(f"\r[{timestamp}] Status: {status} | Conclusion: {conclusion}")
                sys.stdout.flush()
            
            # Check if complete
            if self.is_workflow_complete(workflow):
                print("\n")
                if conclusion == "success":
                    self.print_status("success", "Deployment completed successfully!")
                    self.print_status("info", f"Website: https://agentmeshcommunicationprotocol.github.io")
                    return 0
                elif conclusion == "failure":
                    self.print_status("failure", "Deployment failed!")
                    return 1
                else:
                    self.print_status("pending", f"Deployment completed with status: {conclusion}")
                    return 0
            
            # Exit if not watching
            if not watch:
                return 0
            
            # Update last_run_id
            self.last_run_id = run_id
            
            # Wait before next check
            time.sleep(CHECK_INTERVAL)

def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description="Monitor GitHub Actions workflows for AMCP website deployment"
    )
    parser.add_argument(
        "--watch",
        action="store_true",
        help="Keep monitoring until workflow completes"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Show detailed output"
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=3600,
        help="Maximum monitoring time in seconds (default: 3600)"
    )
    
    args = parser.parse_args()
    
    # Create monitor
    monitor = GitHubActionsMonitor(REPO, BRANCH, args.verbose)
    
    # Run monitoring
    try:
        exit_code = monitor.monitor(watch=args.watch, timeout=args.timeout)
        sys.exit(exit_code)
    except KeyboardInterrupt:
        print("\n")
        monitor.print_status("info", "Monitoring stopped by user")
        sys.exit(0)
    except Exception as e:
        monitor.print_status("error", f"Unexpected error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
