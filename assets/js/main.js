// AMCP GitHub Pages JavaScript
(function() {
    'use strict';

    // Mobile navigation toggle
    function initMobileNavigation() {
        const navToggle = document.querySelector('.navbar-toggle');
        const navMenu = document.querySelector('.navbar-menu');
        
        if (navToggle && navMenu) {
            navToggle.addEventListener('click', function() {
                navMenu.classList.toggle('active');
                navToggle.classList.toggle('active');
                
                // Toggle hamburger animation
                const lines = navToggle.querySelectorAll('.hamburger-line');
                lines.forEach((line, index) => {
                    if (navToggle.classList.contains('active')) {
                        if (index === 0) line.style.transform = 'rotate(45deg) translate(5px, 5px)';
                        if (index === 1) line.style.opacity = '0';
                        if (index === 2) line.style.transform = 'rotate(-45deg) translate(7px, -6px)';
                    } else {
                        line.style.transform = '';
                        line.style.opacity = '';
                    }
                });
            });

            // Close mobile menu when clicking outside
            document.addEventListener('click', function(e) {
                if (!navToggle.contains(e.target) && !navMenu.contains(e.target)) {
                    navMenu.classList.remove('active');
                    navToggle.classList.remove('active');
                    
                    const lines = navToggle.querySelectorAll('.hamburger-line');
                    lines.forEach(line => {
                        line.style.transform = '';
                        line.style.opacity = '';
                    });
                }
            });
        }
    }

    // Smooth scrolling for anchor links
    function initSmoothScrolling() {
        const links = document.querySelectorAll('a[href^="#"]');
        
        links.forEach(link => {
            link.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href === '#') return;
                
                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    }

    // Terminal animation
    function initTerminalAnimation() {
        const terminals = document.querySelectorAll('.terminal-body');
        
        terminals.forEach(terminal => {
            const lines = terminal.querySelectorAll('.terminal-line');
            if (lines.length === 0) return;
            
            // Hide all lines initially
            lines.forEach(line => {
                line.style.opacity = '0';
                line.style.transform = 'translateY(10px)';
            });
            
            // Animate lines one by one
            let delay = 0;
            lines.forEach((line, index) => {
                setTimeout(() => {
                    line.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    line.style.opacity = '1';
                    line.style.transform = 'translateY(0)';
                }, delay);
                
                // Add extra delay for output lines
                delay += line.classList.contains('output') ? 800 : 1200;
            });
        });
    }

    // Intersection Observer for animations
    function initScrollAnimations() {
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                }
            });
        }, observerOptions);

        // Observe elements for animation
        const animatedElements = document.querySelectorAll(
            '.feature-card, .example-card, .domain-card, .tutorial-card, .tool-card'
        );
        
        animatedElements.forEach(el => {
            observer.observe(el);
        });
    }

    // Copy code functionality
    function initCodeCopy() {
        const codeBlocks = document.querySelectorAll('.code-block, pre code');
        
        codeBlocks.forEach(block => {
            const wrapper = document.createElement('div');
            wrapper.className = 'code-wrapper';
            
            const copyButton = document.createElement('button');
            copyButton.className = 'copy-button';
            copyButton.innerHTML = `
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                </svg>
                Copy
            `;
            
            copyButton.addEventListener('click', async () => {
                const text = block.textContent || block.innerText;
                
                try {
                    await navigator.clipboard.writeText(text);
                    copyButton.innerHTML = `
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="20,6 9,17 4,12"></polyline>
                        </svg>
                        Copied!
                    `;
                    copyButton.classList.add('copied');
                    
                    setTimeout(() => {
                        copyButton.innerHTML = `
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                                <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                            </svg>
                            Copy
                        `;
                        copyButton.classList.remove('copied');
                    }, 2000);
                } catch (err) {
                    console.error('Failed to copy text: ', err);
                }
            });
            
            block.parentNode.insertBefore(wrapper, block);
            wrapper.appendChild(block);
            wrapper.appendChild(copyButton);
        });
    }

    // Search functionality (if search box exists)
    function initSearch() {
        const searchInput = document.querySelector('#search-input');
        const searchResults = document.querySelector('#search-results');
        
        if (!searchInput || !searchResults) return;
        
        let searchTimeout;
        
        searchInput.addEventListener('input', function() {
            clearTimeout(searchTimeout);
            const query = this.value.trim();
            
            if (query.length < 2) {
                searchResults.innerHTML = '';
                searchResults.style.display = 'none';
                return;
            }
            
            searchTimeout = setTimeout(() => {
                performSearch(query);
            }, 300);
        });
        
        function performSearch(query) {
            // Simple client-side search (in a real implementation, you'd use a search service)
            const searchableElements = document.querySelectorAll('h1, h2, h3, h4, p');
            const results = [];
            
            searchableElements.forEach(element => {
                const text = element.textContent.toLowerCase();
                if (text.includes(query.toLowerCase())) {
                    results.push({
                        title: element.textContent.substring(0, 100),
                        url: window.location.pathname + '#' + (element.id || ''),
                        snippet: text.substring(0, 200) + '...'
                    });
                }
            });
            
            displaySearchResults(results.slice(0, 5));
        }
        
        function displaySearchResults(results) {
            if (results.length === 0) {
                searchResults.innerHTML = '<div class="search-no-results">No results found</div>';
            } else {
                searchResults.innerHTML = results.map(result => `
                    <div class="search-result">
                        <h4><a href="${result.url}">${result.title}</a></h4>
                        <p>${result.snippet}</p>
                    </div>
                `).join('');
            }
            
            searchResults.style.display = 'block';
        }
    }

    // Theme toggle (if implemented)
    function initThemeToggle() {
        const themeToggle = document.querySelector('#theme-toggle');
        if (!themeToggle) return;
        
        const currentTheme = localStorage.getItem('theme') || 'light';
        document.documentElement.setAttribute('data-theme', currentTheme);
        
        themeToggle.addEventListener('click', function() {
            const currentTheme = document.documentElement.getAttribute('data-theme');
            const newTheme = currentTheme === 'light' ? 'dark' : 'light';
            
            document.documentElement.setAttribute('data-theme', newTheme);
            localStorage.setItem('theme', newTheme);
        });
    }

    // Analytics event tracking
    function trackEvent(category, action, label) {
        if (typeof gtag !== 'undefined') {
            gtag('event', action, {
                event_category: category,
                event_label: label
            });
        }
    }

    // Track download clicks
    function initDownloadTracking() {
        const downloadLinks = document.querySelectorAll('a[href*="download"], a[href*=".zip"], a[href*=".jar"]');
        
        downloadLinks.forEach(link => {
            link.addEventListener('click', function() {
                const href = this.getAttribute('href');
                trackEvent('Download', 'Click', href);
            });
        });
    }

    // Track external links
    function initExternalLinkTracking() {
        const externalLinks = document.querySelectorAll('a[href^="http"]:not([href*="' + window.location.hostname + '"])');
        
        externalLinks.forEach(link => {
            link.addEventListener('click', function() {
                const href = this.getAttribute('href');
                trackEvent('External Link', 'Click', href);
            });
        });
    }

    // Initialize everything when DOM is ready
    function init() {
        initMobileNavigation();
        initSmoothScrolling();
        initTerminalAnimation();
        initScrollAnimations();
        initCodeCopy();
        initSearch();
        initThemeToggle();
        initDownloadTracking();
        initExternalLinkTracking();
    }

    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

})();

// Add CSS for animations
const animationCSS = `
<style>
.animate-in {
    animation: slideInUp 0.6s ease-out forwards;
}

@keyframes slideInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.code-wrapper {
    position: relative;
}

.copy-button {
    position: absolute;
    top: 0.5rem;
    right: 0.5rem;
    background: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    color: #ccc;
    padding: 0.5rem;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.8rem;
    display: flex;
    align-items: center;
    gap: 0.25rem;
    transition: all 0.3s ease;
}

.copy-button:hover {
    background: rgba(255, 255, 255, 0.2);
    color: white;
}

.copy-button.copied {
    background: #4CAF50;
    color: white;
}

.search-results {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-height: 300px;
    overflow-y: auto;
    z-index: 1000;
}

.search-result {
    padding: 1rem;
    border-bottom: 1px solid #eee;
}

.search-result:last-child {
    border-bottom: none;
}

.search-result h4 {
    margin: 0 0 0.5rem 0;
}

.search-result a {
    color: #2196F3;
    text-decoration: none;
}

.search-result p {
    margin: 0;
    color: #666;
    font-size: 0.9rem;
}

.search-no-results {
    padding: 1rem;
    text-align: center;
    color: #666;
}

/* Dark theme support */
[data-theme="dark"] {
    --bg-color: #1a1a1a;
    --text-color: #ffffff;
    --border-color: #333333;
}

[data-theme="dark"] body {
    background-color: var(--bg-color);
    color: var(--text-color);
}

[data-theme="dark"] .search-results {
    background: #2a2a2a;
    border-color: #444;
}

[data-theme="dark"] .search-result {
    border-color: #444;
}

/* Responsive animations */
@media (prefers-reduced-motion: reduce) {
    .animate-in,
    * {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
    }
}
</style>
`;

// Inject animation CSS
document.head.insertAdjacentHTML('beforeend', animationCSS);
