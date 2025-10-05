---
layout: default
title: "AMCP Community"
description: "Join the AMCP community - contribute, get support, and collaborate on multi-agent systems"
permalink: /community/
---

<section class="page-hero">
  <div class="container">
    <div class="page-hero-content">
      <h1>Join the AMCP Community</h1>
      <p class="page-subtitle">
        Connect with developers, researchers, and enthusiasts building the future of multi-agent systems
      </p>
      <div class="community-stats">
        <div class="stat-item">
          <div class="stat-number">500+</div>
          <div class="stat-label">Developers</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">50+</div>
          <div class="stat-label">Contributors</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">1000+</div>
          <div class="stat-label">GitHub Stars</div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="community-channels">
  <div class="container">
    <h2>Community Channels</h2>
    
    <div class="channels-grid">
      
      <div class="channel-card primary">
        <div class="channel-icon">💬</div>
        <h3>GitHub Discussions</h3>
        <p>Ask questions, share ideas, and get help from the community and maintainers.</p>
        <div class="channel-stats">
          <span>📊 200+ discussions</span>
          <span>⚡ Active daily</span>
        </div>
        <a href="{{ site.amcp_core_url }}/discussions" class="btn btn-primary" target="_blank">Join Discussions</a>
      </div>

      <div class="channel-card">
        <div class="channel-icon">🐛</div>
        <h3>Issue Tracker</h3>
        <p>Report bugs, request features, and track development progress.</p>
        <div class="channel-stats">
          <span>🔧 Bug reports</span>
          <span>💡 Feature requests</span>
        </div>
        <a href="{{ site.amcp_core_url }}/issues" class="btn btn-outline" target="_blank">View Issues</a>
      </div>

      <div class="channel-card">
        <div class="channel-icon">📚</div>
        <h3>Documentation</h3>
        <p>Comprehensive guides, API reference, and tutorials for all skill levels.</p>
        <div class="channel-stats">
          <span>📖 Complete guides</span>
          <span>🎯 Examples included</span>
        </div>
        <a href="/docs/" class="btn btn-outline">Read Docs</a>
      </div>

      <div class="channel-card">
        <div class="channel-icon">🎓</div>
        <h3>Learning Resources</h3>
        <p>Tutorials, workshops, and educational content for mastering AMCP.</p>
        <div class="channel-stats">
          <span>🚀 Quick start guides</span>
          <span>🔬 Advanced topics</span>
        </div>
        <a href="/examples/" class="btn btn-outline">Explore Examples</a>
      </div>

    </div>
  </div>
</section>

<section class="contribution-guide">
  <div class="container">
    <h2>How to Contribute</h2>
    
    <div class="contribution-grid">
      
      <div class="contribution-step">
        <div class="step-number">1</div>
        <div class="step-content">
          <h3>🍴 Fork the Repository</h3>
          <p>Start by forking the AMCP repository to your GitHub account.</p>
          <div class="code-snippet">
            <code>git clone {{ site.amcp_core_url }}.git</code>
          </div>
        </div>
      </div>

      <div class="contribution-step">
        <div class="step-number">2</div>
        <div class="step-content">
          <h3>🔧 Set Up Development</h3>
          <p>Install dependencies and set up your development environment.</p>
          <div class="code-snippet">
            <code>mvn clean install</code>
          </div>
        </div>
      </div>

      <div class="contribution-step">
        <div class="step-number">3</div>
        <div class="step-content">
          <h3>✨ Make Your Changes</h3>
          <p>Create a feature branch and implement your improvements.</p>
          <div class="code-snippet">
            <code>git checkout -b feature/your-feature</code>
          </div>
        </div>
      </div>

      <div class="contribution-step">
        <div class="step-number">4</div>
        <div class="step-content">
          <h3>🧪 Test Your Code</h3>
          <p>Run the test suite to ensure your changes don't break anything.</p>
          <div class="code-snippet">
            <code>mvn test</code>
          </div>
        </div>
      </div>

      <div class="contribution-step">
        <div class="step-number">5</div>
        <div class="step-content">
          <h3>📝 Submit Pull Request</h3>
          <p>Create a pull request with a clear description of your changes.</p>
          <div class="code-snippet">
            <code>git push origin feature/your-feature</code>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<section class="contribution-areas">
  <div class="container">
    <h2>Ways to Contribute</h2>
    
    <div class="areas-grid">
      
      <div class="area-card">
        <div class="area-icon">💻</div>
        <h3>Code Contributions</h3>
        <p>Help improve AMCP by contributing code, fixing bugs, and implementing new features.</p>
        <ul class="area-list">
          <li>🐛 Bug fixes and improvements</li>
          <li>⚡ Performance optimizations</li>
          <li>🆕 New agent implementations</li>
          <li>🔧 Core framework enhancements</li>
        </ul>
        <a href="{{ site.amcp_core_url }}/blob/main/CONTRIBUTING.md" class="area-link" target="_blank">Contributing Guide →</a>
      </div>

      <div class="area-card">
        <div class="area-icon">📚</div>
        <h3>Documentation</h3>
        <p>Help make AMCP more accessible by improving documentation and tutorials.</p>
        <ul class="area-list">
          <li>📖 API documentation</li>
          <li>🎯 Tutorial improvements</li>
          <li>🌍 Translations</li>
          <li>📝 Blog posts and guides</li>
        </ul>
        <a href="{{ site.amcp_docs_url }}" class="area-link">Documentation Site →</a>
      </div>

      <div class="area-card">
        <div class="area-icon">🧪</div>
        <h3>Testing & QA</h3>
        <p>Ensure AMCP quality by testing features, reporting bugs, and improving test coverage.</p>
        <ul class="area-list">
          <li>🔍 Manual testing</li>
          <li>🤖 Automated test writing</li>
          <li>📊 Performance testing</li>
          <li>🐛 Bug reporting</li>
        </ul>
        <a href="{{ site.amcp_core_url }}/issues/new/choose" class="area-link" target="_blank">Report Issues →</a>
      </div>

      <div class="area-card">
        <div class="area-icon">🎨</div>
        <h3>Design & UX</h3>
        <p>Improve the user experience of AMCP tools, documentation, and interfaces.</p>
        <ul class="area-list">
          <li>🎨 UI/UX improvements</li>
          <li>📱 Website enhancements</li>
          <li>🖼️ Graphics and illustrations</li>
          <li>♿ Accessibility improvements</li>
        </ul>
        <a href="{{ site.amcp_core_url }}/discussions/categories/design" class="area-link" target="_blank">Design Discussions →</a>
      </div>

    </div>
  </div>
</section>

<section class="community-guidelines">
  <div class="container">
    <h2>Community Guidelines</h2>
    
    <div class="guidelines-content">
      
      <div class="guideline-card">
        <h3>🤝 Be Respectful</h3>
        <p>Treat all community members with respect and kindness. We welcome developers of all skill levels and backgrounds.</p>
      </div>

      <div class="guideline-card">
        <h3>💡 Be Constructive</h3>
        <p>Provide helpful feedback and suggestions. Focus on the problem, not the person, when discussing issues.</p>
      </div>

      <div class="guideline-card">
        <h3>🔍 Be Clear</h3>
        <p>When asking questions or reporting issues, provide clear descriptions and relevant context to help others help you.</p>
      </div>

      <div class="guideline-card">
        <h3>🌍 Be Inclusive</h3>
        <p>Foster an inclusive environment where everyone feels welcome to contribute and participate.</p>
      </div>

    </div>
  </div>
</section>

<section class="community-resources">
  <div class="container">
    <h2>Community Resources</h2>
    
    <div class="resources-grid">
      
      <div class="resource-item">
        <div class="resource-icon">📋</div>
        <div class="resource-content">
          <h4>Code of Conduct</h4>
          <p>Our community standards and expectations for respectful collaboration.</p>
          <a href="{{ site.amcp_core_url }}/blob/main/CODE_OF_CONDUCT.md" target="_blank">Read Code of Conduct →</a>
        </div>
      </div>

      <div class="resource-item">
        <div class="resource-icon">🛠️</div>
        <div class="resource-content">
          <h4>Contributing Guide</h4>
          <p>Detailed instructions for contributing code, documentation, and other improvements.</p>
          <a href="{{ site.amcp_core_url }}/blob/main/CONTRIBUTING.md" target="_blank">Contributing Guide →</a>
        </div>
      </div>

      <div class="resource-item">
        <div class="resource-icon">🏷️</div>
        <div class="resource-content">
          <h4>Release Notes</h4>
          <p>Stay updated with the latest features, improvements, and bug fixes.</p>
          <a href="{{ site.amcp_core_url }}/releases" target="_blank">View Releases →</a>
        </div>
      </div>

      <div class="resource-item">
        <div class="resource-icon">📊</div>
        <div class="resource-content">
          <h4>Project Roadmap</h4>
          <p>See what's planned for future versions and contribute to the direction.</p>
          <a href="{{ site.amcp_core_url }}/projects" target="_blank">View Roadmap →</a>
        </div>
      </div>

    </div>
  </div>
</section>

<section class="get-started-community">
  <div class="container">
    <div class="cta-content">
      <h2>Ready to Get Involved?</h2>
      <p>Join our growing community of developers building the future of multi-agent systems.</p>
      
      <div class="cta-actions">
        <a href="{{ site.amcp_core_url }}/discussions" class="btn btn-primary btn-large" target="_blank">
          💬 Join Discussions
        </a>
        <a href="{{ site.amcp_core_url }}" class="btn btn-outline btn-large" target="_blank">
          ⭐ Star on GitHub
        </a>
      </div>
      
      <div class="quick-links">
        <a href="/docs/getting-started/">📚 Getting Started</a>
        <a href="/examples/">🎯 Examples</a>
        <a href="{{ site.amcp_core_url }}/issues/good-first-issue" target="_blank">🌱 Good First Issues</a>
      </div>
    </div>
  </div>
</section>

<style>
.community-stats {
  display: flex;
  justify-content: center;
  gap: 3rem;
  margin-top: 2rem;
}

.stat-item {
  text-align: center;
}

.stat-number {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--primary-color);
  display: block;
  margin-bottom: 0.5rem;
}

.stat-label {
  color: var(--text-secondary);
  font-weight: 500;
}

.community-channels {
  padding: 4rem 0;
}

.channels-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.channel-card {
  background: var(--bg-primary);
  border: 2px solid var(--border-light);
  border-radius: var(--radius-xl);
  padding: 2rem;
  text-align: center;
  transition: all var(--transition-normal);
}

.channel-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg);
}

.channel-card.primary {
  border-color: var(--primary-color);
  background: linear-gradient(135deg, var(--primary-50) 0%, var(--primary-100) 100%);
}

.channel-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
  display: block;
}

.channel-card h3 {
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.channel-card p {
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  line-height: 1.6;
}

.channel-stats {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
  flex-wrap: wrap;
}

.channel-stats span {
  background: var(--bg-secondary);
  color: var(--text-secondary);
  padding: 0.25rem 0.75rem;
  border-radius: var(--radius-full);
  font-size: 0.875rem;
}

.contribution-guide {
  padding: 4rem 0;
  background: var(--bg-secondary);
}

.contribution-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.contribution-step {
  background: var(--bg-primary);
  border-radius: var(--radius-xl);
  padding: 2rem;
  text-align: center;
  border: 1px solid var(--border-light);
}

.step-number {
  background: var(--primary-color);
  color: white;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 auto 1.5rem;
}

.step-content h3 {
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.step-content p {
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  line-height: 1.6;
}

.code-snippet {
  background: var(--secondary-dark);
  color: var(--text-inverse);
  padding: 1rem;
  border-radius: var(--radius-md);
  font-family: var(--font-family-mono);
  font-size: 0.9rem;
}

.contribution-areas {
  padding: 4rem 0;
}

.areas-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.area-card {
  background: var(--bg-primary);
  border: 1px solid var(--border-light);
  border-radius: var(--radius-xl);
  padding: 2rem;
  transition: all var(--transition-normal);
}

.area-card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
  border-color: var(--primary-200);
}

.area-icon {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  display: block;
}

.area-card h3 {
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.area-card p {
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  line-height: 1.6;
}

.area-list {
  list-style: none;
  padding: 0;
  margin: 0 0 1.5rem 0;
}

.area-list li {
  color: var(--text-secondary);
  padding: 0.5rem 0;
  border-bottom: 1px solid var(--border-light);
}

.area-list li:last-child {
  border-bottom: none;
}

.area-link {
  color: var(--primary-color);
  text-decoration: none;
  font-weight: 500;
}

.area-link:hover {
  color: var(--primary-dark);
  text-decoration: none;
}

.community-guidelines {
  padding: 4rem 0;
  background: var(--bg-secondary);
}

.guidelines-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.guideline-card {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  border: 1px solid var(--border-light);
  text-align: center;
}

.guideline-card h3 {
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.guideline-card p {
  color: var(--text-secondary);
  line-height: 1.6;
}

.community-resources {
  padding: 4rem 0;
}

.resources-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.resource-item {
  display: flex;
  align-items: flex-start;
  gap: 1.5rem;
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  border: 1px solid var(--border-light);
  transition: all var(--transition-normal);
}

.resource-item:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}

.resource-icon {
  font-size: 2rem;
  flex-shrink: 0;
}

.resource-content h4 {
  color: var(--text-primary);
  margin-bottom: 0.5rem;
}

.resource-content p {
  color: var(--text-secondary);
  margin-bottom: 1rem;
  line-height: 1.6;
}

.resource-content a {
  color: var(--primary-color);
  text-decoration: none;
  font-weight: 500;
}

.resource-content a:hover {
  color: var(--primary-dark);
  text-decoration: none;
}

.get-started-community {
  padding: 4rem 0;
  background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
  color: white;
  text-align: center;
}

.cta-content h2 {
  color: white;
  margin-bottom: 1rem;
  font-size: 2.5rem;
}

.cta-content p {
  font-size: 1.25rem;
  margin-bottom: 2rem;
  opacity: 0.9;
}

.cta-actions {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 2rem;
  flex-wrap: wrap;
}

.btn-large {
  padding: 1rem 2rem;
  font-size: 1.1rem;
}

.quick-links {
  display: flex;
  justify-content: center;
  gap: 2rem;
  flex-wrap: wrap;
}

.quick-links a {
  color: rgba(255, 255, 255, 0.9);
  text-decoration: none;
  font-weight: 500;
  transition: color var(--transition-fast);
}

.quick-links a:hover {
  color: white;
  text-decoration: none;
}

@media (max-width: 768px) {
  .community-stats {
    flex-direction: column;
    gap: 1.5rem;
  }
  
  .channels-grid,
  .contribution-grid,
  .areas-grid,
  .guidelines-content,
  .resources-grid {
    grid-template-columns: 1fr;
  }
  
  .cta-actions {
    flex-direction: column;
    align-items: center;
  }
  
  .quick-links {
    flex-direction: column;
    gap: 1rem;
  }
  
  .resource-item {
    flex-direction: column;
    text-align: center;
  }
}
</style>
