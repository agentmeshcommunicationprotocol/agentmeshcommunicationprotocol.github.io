#\!/bin/bash

echo "=== AMCP Website Link Checker ==="
echo "Checking: https://agentmeshcommunicationprotocol.github.io/"
echo ""

# Get all links from the homepage
echo "Fetching homepage..."
curl -s https://agentmeshcommunicationprotocol.github.io/ > /tmp/homepage.html

# Extract all href links
echo "Extracting links..."
grep -oP 'href="\K[^"]+' /tmp/homepage.html | sort -u > /tmp/links.txt

echo "Found $(wc -l < /tmp/links.txt) unique links"
echo ""
echo "=== Testing Links ==="
echo ""

broken_count=0
working_count=0

while IFS= read -r link; do
    # Skip anchors and javascript
    if [[ $link == "#"* ]] || [[ $link == "javascript:"* ]]; then
        continue
    fi
    
    # Convert relative URLs to absolute
    if [[ $link == "/"* ]]; then
        full_url="https://agentmeshcommunicationprotocol.github.io${link}"
    elif [[ $link == "http"* ]]; then
        full_url="$link"
    else
        full_url="https://agentmeshcommunicationprotocol.github.io/${link}"
    fi
    
    # Test the link
    status=$(curl -s -o /dev/null -w "%{http_code}" -L "$full_url" 2>/dev/null)
    
    if [ "$status" = "200" ] || [ "$status" = "301" ] || [ "$status" = "302" ]; then
        echo "✅ $status - $link"
        ((working_count++))
    else
        echo "❌ $status - $link"
        ((broken_count++))
    fi
done < /tmp/links.txt

echo ""
echo "=== Summary ==="
echo "Working links: $working_count"
echo "Broken links: $broken_count"
