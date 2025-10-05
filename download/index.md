---
layout: default
title: "Download AMCP"
description: "Download the latest version of AMCP - Agent Mesh Communication Protocol"
permalink: /download/
---

<section class="page-hero">
  <div class="container">
    <div class="page-hero-content">
      <h1>Download AMCP</h1>
      <p class="page-subtitle">
        Get the latest version of the Agent Mesh Communication Protocol
      </p>
      <div class="version-info">
        <span class="current-version">v1.5.0</span>
        <span class="release-date">Released October 2024</span>
        <span class="license">Apache 2.0 License</span>
      </div>
    </div>
  </div>
</section>

<section class="download-options">
  <div class="container">
    
    <div class="download-grid">
      
      <div class="download-card primary">
        <div class="download-header">
          <div class="download-icon">📦</div>
          <h3>Binary Release</h3>
          <span class="recommended">Recommended</span>
        </div>
        <p>Ready-to-run JAR file with all dependencies included. Perfect for quick setup and production deployment.</p>
        <div class="download-details">
          <div class="detail-item">
            <strong>Size:</strong> ~45 MB
          </div>
          <div class="detail-item">
            <strong>Requirements:</strong> Java 17+
          </div>
          <div class="detail-item">
            <strong>Includes:</strong> All core modules and examples
          </div>
        </div>
        <div class="download-actions">
          <a href="{{ site.amcp_core_url }}/releases/latest/download/amcp-core-1.5.0.jar" class="btn btn-primary btn-large">
            <svg class="icon" viewBox="0 0 24 24">
              <path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/>
            </svg>
            Download JAR (45 MB)
          </a>
          <a href="{{ site.amcp_core_url }}/releases/tag/v1.5.0" class="btn btn-outline" target="_blank">View Release Notes</a>
        </div>
      </div>

      <div class="download-card">
        <div class="download-header">
          <div class="download-icon">🔧</div>
          <h3>Source Code</h3>
        </div>
        <p>Complete source code for building from scratch, customization, and contributing to the project.</p>
        <div class="download-details">
          <div class="detail-item">
            <strong>Size:</strong> ~15 MB
          </div>
          <div class="detail-item">
            <strong>Requirements:</strong> Java 17+, Maven 3.8+
          </div>
          <div class="detail-item">
            <strong>Includes:</strong> Full source, tests, documentation
          </div>
        </div>
        <div class="download-actions">
          <a href="{{ site.amcp_core_url }}/archive/refs/tags/v1.5.0.zip" class="btn btn-primary">
            <svg class="icon" viewBox="0 0 24 24">
              <path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/>
            </svg>
            Download ZIP
          </a>
          <a href="{{ site.amcp_core_url }}/archive/refs/tags/v1.5.0.tar.gz" class="btn btn-outline">Download TAR.GZ</a>
        </div>
      </div>

      <div class="download-card">
        <div class="download-header">
          <div class="download-icon">🐳</div>
          <h3>Docker Image</h3>
        </div>
        <p>Containerized AMCP for easy deployment with Docker, Kubernetes, and container orchestration platforms.</p>
        <div class="download-details">
          <div class="detail-item">
            <strong>Size:</strong> ~200 MB
          </div>
          <div class="detail-item">
            <strong>Requirements:</strong> Docker or Podman
          </div>
          <div class="detail-item">
            <strong>Includes:</strong> Runtime environment and tools
          </div>
        </div>
        <div class="download-actions">
          <div class="docker-command">
            <code>docker pull ghcr.io/agentmeshcommunicationprotocol/amcp:1.5.0</code>
            <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
          </div>
          <a href="{{ site.amcp_core_url }}/pkgs/container/amcp" class="btn btn-outline" target="_blank">View on Registry</a>
        </div>
      </div>

    </div>
  </div>
</section>

<section class="installation-guide">
  <div class="container">
    <h2>Quick Installation</h2>
    
    <div class="installation-tabs">
      <div class="tab-buttons">
        <button class="tab-btn active" onclick="showTab('binary')">Binary</button>
        <button class="tab-btn" onclick="showTab('source')">Source</button>
        <button class="tab-btn" onclick="showTab('docker')">Docker</button>
        <button class="tab-btn" onclick="showTab('maven')">Maven</button>
      </div>
      
      <div class="tab-content">
        
        <div id="binary-tab" class="tab-pane active">
          <h3>Binary Installation</h3>
          <div class="step-by-step">
            <div class="step">
              <div class="step-number">1</div>
              <div class="step-content">
                <h4>Download JAR File</h4>
                <p>Download the latest AMCP binary release:</p>
                <div class="code-block">
                  <code>curl -L -O {{ site.amcp_core_url }}/releases/latest/download/amcp-core-1.5.0.jar</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">2</div>
              <div class="step-content">
                <h4>Run AMCP</h4>
                <p>Start the AMCP application:</p>
                <div class="code-block">
                  <code>java -jar amcp-core-1.5.0.jar</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">3</div>
              <div class="step-content">
                <h4>Verify Installation</h4>
                <p>Check that AMCP is running:</p>
                <div class="code-block">
                  <code>curl http://localhost:8080/health</code>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div id="source-tab" class="tab-pane">
          <h3>Build from Source</h3>
          <div class="step-by-step">
            <div class="step">
              <div class="step-number">1</div>
              <div class="step-content">
                <h4>Clone Repository</h4>
                <p>Clone the AMCP source code:</p>
                <div class="code-block">
                  <code>git clone {{ site.amcp_core_url }}.git<br>cd amcpcore.github.io</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">2</div>
              <div class="step-content">
                <h4>Build Project</h4>
                <p>Compile and package AMCP:</p>
                <div class="code-block">
                  <code>mvn clean install</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">3</div>
              <div class="step-content">
                <h4>Run Application</h4>
                <p>Start the built application:</p>
                <div class="code-block">
                  <code>mvn exec:java -Dexec.mainClass="io.amcp.core.AMCPApplication"</code>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div id="docker-tab" class="tab-pane">
          <h3>Docker Deployment</h3>
          <div class="step-by-step">
            <div class="step">
              <div class="step-number">1</div>
              <div class="step-content">
                <h4>Pull Image</h4>
                <p>Download the AMCP Docker image:</p>
                <div class="code-block">
                  <code>docker pull ghcr.io/agentmeshcommunicationprotocol/amcp:1.5.0</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">2</div>
              <div class="step-content">
                <h4>Run Container</h4>
                <p>Start AMCP in a container:</p>
                <div class="code-block">
                  <code>docker run -p 8080:8080 -p 9090:9090 ghcr.io/agentmeshcommunicationprotocol/amcp:1.5.0</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">3</div>
              <div class="step-content">
                <h4>Docker Compose</h4>
                <p>For production deployment with monitoring:</p>
                <div class="code-block">
                  <code>curl -O {{ site.amcp_core_url }}/raw/main/docker-compose.yml<br>docker-compose up -d</code>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div id="maven-tab" class="tab-pane">
          <h3>Maven Dependency</h3>
          <div class="step-by-step">
            <div class="step">
              <div class="step-number">1</div>
              <div class="step-content">
                <h4>Add Repository</h4>
                <p>Add the AMCP Maven repository to your pom.xml:</p>
                <div class="code-block">
                  <code>&lt;repositories&gt;<br>  &lt;repository&gt;<br>    &lt;id&gt;github&lt;/id&gt;<br>    &lt;url&gt;https://maven.pkg.github.com/agentmeshcommunicationprotocol/amcpcore.github.io&lt;/url&gt;<br>  &lt;/repository&gt;<br>&lt;/repositories&gt;</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">2</div>
              <div class="step-content">
                <h4>Add Dependency</h4>
                <p>Include AMCP in your dependencies:</p>
                <div class="code-block">
                  <code>&lt;dependency&gt;<br>  &lt;groupId&gt;io.amcp&lt;/groupId&gt;<br>  &lt;artifactId&gt;amcp-core&lt;/artifactId&gt;<br>  &lt;version&gt;1.5.0&lt;/version&gt;<br>&lt;/dependency&gt;</code>
                </div>
              </div>
            </div>
            
            <div class="step">
              <div class="step-number">3</div>
              <div class="step-content">
                <h4>Use in Code</h4>
                <p>Start using AMCP in your application:</p>
                <div class="code-block">
                  <code>import io.amcp.core.AMCPApplication;<br><br>AMCPApplication app = new AMCPApplication();<br>app.start();</code>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>

<section class="system-requirements">
  <div class="container">
    <h2>System Requirements</h2>
    
    <div class="requirements-grid">
      
      <div class="requirement-card">
        <h3>💻 Operating System</h3>
        <ul>
          <li>✅ Linux (Ubuntu 20.04+, CentOS 8+, RHEL 8+)</li>
          <li>✅ macOS (10.15+)</li>
          <li>✅ Windows (10, 11, Server 2019+)</li>
          <li>✅ Docker/Container platforms</li>
        </ul>
      </div>

      <div class="requirement-card">
        <h3>☕ Java Runtime</h3>
        <ul>
          <li>✅ OpenJDK 17+ (Recommended: 21)</li>
          <li>✅ Oracle JDK 17+</li>
          <li>✅ Amazon Corretto 17+</li>
          <li>✅ Eclipse Temurin 17+</li>
        </ul>
      </div>

      <div class="requirement-card">
        <h3>🔧 Development Tools</h3>
        <ul>
          <li>✅ Maven 3.8+ (for building from source)</li>
          <li>✅ Git 2.20+ (for source code)</li>
          <li>✅ Docker 20.10+ (for containers)</li>
          <li>⚡ IDE support: IntelliJ IDEA, Eclipse, VS Code</li>
        </ul>
      </div>

      <div class="requirement-card">
        <h3>💾 Hardware</h3>
        <ul>
          <li>✅ RAM: 2GB minimum, 4GB+ recommended</li>
          <li>✅ CPU: 2 cores minimum, 4+ recommended</li>
          <li>✅ Storage: 1GB free space</li>
          <li>✅ Network: Internet connection for dependencies</li>
        </ul>
      </div>

    </div>
  </div>
</section>

<section class="release-info">
  <div class="container">
    <h2>Release Information</h2>
    
    <div class="release-grid">
      
      <div class="release-card">
        <h3>🆕 What's New in v1.5.0</h3>
        <ul class="changelog">
          <li>🤖 Enhanced multi-agent orchestration capabilities</li>
          <li>🧠 Improved LLM integration with TinyLlama support</li>
          <li>⚡ Performance optimizations and memory improvements</li>
          <li>📊 Advanced monitoring and metrics collection</li>
          <li>🔒 Enhanced security with end-to-end encryption</li>
          <li>🐳 Official Docker images and Kubernetes support</li>
          <li>📚 Comprehensive documentation and examples</li>
          <li>🧪 Expanded testing framework with 23 unit tests</li>
        </ul>
        <a href="{{ site.amcp_core_url }}/releases/tag/v1.5.0" class="btn btn-outline" target="_blank">View Full Changelog</a>
      </div>

      <div class="release-card">
        <h3>📈 Previous Versions</h3>
        <div class="version-list">
          <div class="version-item">
            <span class="version">v1.4.2</span>
            <span class="date">September 2024</span>
            <a href="{{ site.amcp_core_url }}/releases/tag/v1.4.2" target="_blank">Download</a>
          </div>
          <div class="version-item">
            <span class="version">v1.4.1</span>
            <span class="date">August 2024</span>
            <a href="{{ site.amcp_core_url }}/releases/tag/v1.4.1" target="_blank">Download</a>
          </div>
          <div class="version-item">
            <span class="version">v1.4.0</span>
            <span class="date">July 2024</span>
            <a href="{{ site.amcp_core_url }}/releases/tag/v1.4.0" target="_blank">Download</a>
          </div>
        </div>
        <a href="{{ site.amcp_core_url }}/releases" class="btn btn-outline" target="_blank">View All Releases</a>
      </div>

    </div>
  </div>
</section>

<section class="next-steps">
  <div class="container">
    <h2>Next Steps</h2>
    
    <div class="steps-grid">
      
      <div class="next-step">
        <div class="step-icon">🚀</div>
        <h3>Get Started</h3>
        <p>Follow our quick start guide to build your first AMCP agent in 5 minutes.</p>
        <a href="/docs/getting-started/" class="btn btn-primary">Get Started Guide →</a>
      </div>

      <div class="next-step">
        <div class="step-icon">📚</div>
        <h3>Learn More</h3>
        <p>Explore comprehensive documentation, API reference, and best practices.</p>
        <a href="/docs/" class="btn btn-primary">Full Documentation →</a>
      </div>

      <div class="next-step">
        <div class="step-icon">🎯</div>
        <h3>Try Examples</h3>
        <p>Run ready-made examples including weather agents, chat systems, and LLM integration.</p>
        <a href="/examples/" class="btn btn-primary">Explore Examples →</a>
      </div>

      <div class="next-step">
        <div class="step-icon">💬</div>
        <h3>Join Community</h3>
        <p>Connect with other developers, get support, and contribute to the project.</p>
        <a href="/community/" class="btn btn-primary">Join Community →</a>
      </div>

    </div>
  </div>
</section>

<style>
.version-info {
  display: flex;
  justify-content: center;
  gap: 2rem;
  flex-wrap: wrap;
  margin-top: 1.5rem;
}

.current-version {
  background: var(--primary-color);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: var(--radius-full);
  font-weight: 600;
}

.release-date, .license {
  background: rgba(255, 255, 255, 0.9);
  color: var(--primary-dark);
  padding: 0.5rem 1rem;
  border-radius: var(--radius-full);
  font-weight: 500;
}

.download-options {
  padding: 4rem 0;
}

.download-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
}

.download-card {
  background: var(--bg-primary);
  border: 2px solid var(--border-light);
  border-radius: var(--radius-xl);
  padding: 2rem;
  transition: all var(--transition-normal);
}

.download-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg);
}

.download-card.primary {
  border-color: var(--primary-color);
  background: linear-gradient(135deg, var(--primary-50) 0%, var(--primary-100) 100%);
}

.download-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1rem;
}

.download-icon {
  font-size: 2.5rem;
}

.download-header h3 {
  color: var(--text-primary);
  margin: 0;
  flex: 1;
}

.recommended {
  background: var(--success-color);
  color: white;
  padding: 0.25rem 0.75rem;
  border-radius: var(--radius-full);
  font-size: 0.8rem;
  font-weight: 600;
}

.download-details {
  margin: 1.5rem 0;
  padding: 1rem;
  background: var(--bg-secondary);
  border-radius: var(--radius-md);
}

.detail-item {
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
  color: var(--text-secondary);
}

.detail-item:last-child {
  margin-bottom: 0;
}

.download-actions {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.docker-command {
  display: flex;
  align-items: center;
  background: var(--secondary-dark);
  border-radius: var(--radius-md);
  padding: 1rem;
  gap: 1rem;
}

.docker-command code {
  flex: 1;
  color: var(--text-inverse);
  font-family: var(--font-family-mono);
  font-size: 0.9rem;
}

.copy-btn {
  background: var(--primary-color);
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: var(--radius-md);
  cursor: pointer;
  font-size: 0.8rem;
  transition: background var(--transition-fast);
}

.copy-btn:hover {
  background: var(--primary-dark);
}

.installation-guide {
  padding: 4rem 0;
  background: var(--bg-secondary);
}

.installation-tabs {
  background: var(--bg-primary);
  border-radius: var(--radius-xl);
  overflow: hidden;
  border: 1px solid var(--border-light);
}

.tab-buttons {
  display: flex;
  background: var(--bg-secondary);
}

.tab-btn {
  flex: 1;
  padding: 1rem 2rem;
  background: none;
  border: none;
  color: var(--text-secondary);
  font-weight: 500;
  cursor: pointer;
  transition: all var(--transition-fast);
}

.tab-btn.active {
  background: var(--bg-primary);
  color: var(--primary-color);
  border-bottom: 2px solid var(--primary-color);
}

.tab-content {
  padding: 2rem;
}

.tab-pane {
  display: none;
}

.tab-pane.active {
  display: block;
}

.step-by-step {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.step {
  display: flex;
  gap: 1.5rem;
  align-items: flex-start;
}

.step-number {
  background: var(--primary-color);
  color: white;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  flex-shrink: 0;
}

.step-content h4 {
  color: var(--text-primary);
  margin-bottom: 0.5rem;
}

.step-content p {
  color: var(--text-secondary);
  margin-bottom: 1rem;
}

.code-block {
  background: var(--secondary-dark);
  color: var(--text-inverse);
  padding: 1rem;
  border-radius: var(--radius-md);
  font-family: var(--font-family-mono);
  font-size: 0.9rem;
  overflow-x: auto;
}

.system-requirements {
  padding: 4rem 0;
}

.requirements-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.requirement-card {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  border: 1px solid var(--border-light);
}

.requirement-card h3 {
  color: var(--text-primary);
  margin-bottom: 1.5rem;
}

.requirement-card ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.requirement-card li {
  padding: 0.5rem 0;
  color: var(--text-secondary);
  border-bottom: 1px solid var(--border-light);
}

.requirement-card li:last-child {
  border-bottom: none;
}

.release-info {
  padding: 4rem 0;
  background: var(--bg-secondary);
}

.release-grid {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 2rem;
}

.release-card {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  border: 1px solid var(--border-light);
}

.release-card h3 {
  color: var(--text-primary);
  margin-bottom: 1.5rem;
}

.changelog {
  list-style: none;
  padding: 0;
  margin: 0 0 1.5rem 0;
}

.changelog li {
  padding: 0.75rem 0;
  color: var(--text-secondary);
  border-bottom: 1px solid var(--border-light);
}

.changelog li:last-child {
  border-bottom: none;
}

.version-list {
  margin-bottom: 1.5rem;
}

.version-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.75rem 0;
  border-bottom: 1px solid var(--border-light);
}

.version-item:last-child {
  border-bottom: none;
}

.version {
  font-weight: 600;
  color: var(--text-primary);
}

.date {
  color: var(--text-secondary);
  font-size: 0.9rem;
}

.version-item a {
  color: var(--primary-color);
  text-decoration: none;
  font-size: 0.9rem;
}

.next-steps {
  padding: 4rem 0;
}

.steps-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.next-step {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  text-align: center;
  border: 1px solid var(--border-light);
  transition: all var(--transition-normal);
}

.next-step:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg);
}

.step-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
  display: block;
}

.next-step h3 {
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.next-step p {
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  line-height: 1.6;
}

@media (max-width: 1024px) {
  .release-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 768px) {
  .version-info {
    flex-direction: column;
    align-items: center;
  }
  
  .download-grid,
  .requirements-grid,
  .steps-grid {
    grid-template-columns: 1fr;
  }
  
  .tab-buttons {
    flex-direction: column;
  }
  
  .step {
    flex-direction: column;
    text-align: center;
  }
}
</style>

<script>
function showTab(tabName) {
  // Hide all tab panes
  document.querySelectorAll('.tab-pane').forEach(pane => {
    pane.classList.remove('active');
  });
  
  // Remove active class from all buttons
  document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.classList.remove('active');
  });
  
  // Show selected tab pane
  document.getElementById(tabName + '-tab').classList.add('active');
  
  // Add active class to clicked button
  event.target.classList.add('active');
}

function copyToClipboard(button) {
  const code = button.previousElementSibling.textContent;
  navigator.clipboard.writeText(code).then(() => {
    button.textContent = 'Copied!';
    setTimeout(() => {
      button.textContent = 'Copy';
    }, 2000);
  });
}
</script>
