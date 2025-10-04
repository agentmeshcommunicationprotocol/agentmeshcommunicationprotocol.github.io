---
layout: page
title: "AMCP Examples"
description: "Explore real-world examples and use cases for AMCP"
permalink: /examples/
---

# AMCP Examples & Use Cases

Discover the power of AMCP through practical examples and real-world use cases. Each example includes complete source code, setup instructions, and detailed explanations.

<div class="examples-hero">
  <div class="example-stats">
    <div class="stat">
      <div class="stat-number">4</div>
      <div class="stat-label">Built-in Agents</div>
    </div>
    <div class="stat">
      <div class="stat-number">3</div>
      <div class="stat-label">Demo Scenarios</div>
    </div>
    <div class="stat">
      <div class="stat-number">100%</div>
      <div class="stat-label">Working Examples</div>
    </div>
  </div>
</div>

## 🚀 Quick Start Examples

Perfect for getting started with AMCP:

<div class="examples-grid">
  <div class="example-card featured">
    <div class="example-header">
      <div class="example-icon">🌤️</div>
      <div class="example-meta">
        <h3>Weather Agent</h3>
        <span class="difficulty beginner">Beginner</span>
        <span class="time">5 minutes</span>
      </div>
    </div>
    <p>Real-time weather monitoring with OpenWeatherMap API integration. Learn agent basics, API integration, and event handling.</p>
    <div class="example-features">
      <span class="feature">API Integration</span>
      <span class="feature">Real-time Data</span>
      <span class="feature">Event Handling</span>
    </div>
    <div class="example-actions">
      <a href="{{ '/examples/weather-agent/' | relative_url }}" class="btn btn-primary">View Example</a>
      <a href="https://github.com/xaviercallens/amcp-v1.5-opensource/tree/main/examples/src/main/java/io/amcp/examples/weather" class="btn btn-outline">Source Code</a>
    </div>
  </div>

  <div class="example-card">
    <div class="example-header">
      <div class="example-icon">💬</div>
      <div class="example-meta">
        <h3>MeshChat AI</h3>
        <span class="difficulty intermediate">Intermediate</span>
        <span class="time">10 minutes</span>
      </div>
    </div>
    <p>Conversational AI agent with LLM integration. Build sophisticated chatbots with context management and multi-turn conversations.</p>
    <div class="example-features">
      <span class="feature">LLM Integration</span>
      <span class="feature">Context Management</span>
      <span class="feature">Multi-turn Chat</span>
    </div>
    <div class="example-actions">
      <a href="{{ '/examples/meshchat/' | relative_url }}" class="btn btn-primary">View Example</a>
      <a href="https://github.com/xaviercallens/amcp-v1.5-opensource/tree/main/examples/src/main/java/io/amcp/examples/meshchat" class="btn btn-outline">Source Code</a>
    </div>
  </div>

  <div class="example-card">
    <div class="example-header">
      <div class="example-icon">🧠</div>
      <div class="example-meta">
        <h3>LLM Orchestration</h3>
        <span class="difficulty advanced">Advanced</span>
        <span class="time">15 minutes</span>
      </div>
    </div>
    <p>Multi-agent coordination with AI-powered task planning. Learn complex workflows, agent discovery, and intelligent routing.</p>
    <div class="example-features">
      <span class="feature">Multi-Agent</span>
      <span class="feature">AI Planning</span>
      <span class="feature">Dynamic Routing</span>
    </div>
    <div class="example-actions">
      <a href="{{ '/examples/orchestration/' | relative_url }}" class="btn btn-primary">View Example</a>
      <a href="https://github.com/xaviercallens/amcp-v1.5-opensource/tree/main/connectors/src/main/java/io/amcp/connectors/ai" class="btn btn-outline">Source Code</a>
    </div>
  </div>
</div>

## 📈 Domain-Specific Examples

Real-world applications in specific domains:

<div class="domain-examples">
  <div class="domain-section">
    <h3>🏢 Enterprise & Business</h3>
    <div class="domain-grid">
      <div class="domain-card">
        <h4>📊 Financial Analytics</h4>
        <p>Real-time stock monitoring and portfolio analysis with Polygon.io integration.</p>
        <div class="tech-stack">
          <span>Stock API</span>
          <span>Real-time Data</span>
          <span>Analytics</span>
        </div>
        <a href="{{ '/examples/stock-agent/' | relative_url }}">Learn More →</a>
      </div>
      
      <div class="domain-card">
        <h4>✈️ Travel Planning</h4>
        <p>Intelligent trip planning with flight search and itinerary optimization.</p>
        <div class="tech-stack">
          <span>Amadeus API</span>
          <span>Planning</span>
          <span>Optimization</span>
        </div>
        <a href="{{ '/examples/travel-agent/' | relative_url }}">Learn More →</a>
      </div>
    </div>
  </div>

  <div class="domain-section">
    <h3>🤖 AI & Machine Learning</h3>
    <div class="domain-grid">
      <div class="domain-card">
        <h4>🎯 Intent Recognition</h4>
        <p>Natural language understanding with TinyLlama for query classification.</p>
        <div class="tech-stack">
          <span>NLP</span>
          <span>Classification</span>
          <span>TinyLlama</span>
        </div>
        <a href="{{ '/examples/intent-recognition/' | relative_url }}">Learn More →</a>
      </div>
      
      <div class="domain-card">
        <h4>🔄 Workflow Automation</h4>
        <p>Automated business processes with multi-agent coordination.</p>
        <div class="tech-stack">
          <span>Automation</span>
          <span>Workflows</span>
          <span>Integration</span>
        </div>
        <a href="{{ '/examples/workflow-automation/' | relative_url }}">Learn More →</a>
      </div>
    </div>
  </div>
</div>

## 🎮 Interactive Demos

Try AMCP in your browser:

<div class="demo-section">
  <div class="demo-card">
    <div class="demo-preview">
      <div class="terminal-demo">
        <div class="terminal-header">
          <span class="terminal-dot red"></span>
          <span class="terminal-dot yellow"></span>
          <span class="terminal-dot green"></span>
          <span class="terminal-title">AMCP Live Demo</span>
        </div>
        <div class="terminal-content">
          <div class="terminal-line">
            <span class="prompt">amcp></span> activate weather
          </div>
          <div class="terminal-line output">
            ✅ WeatherAgent activated
          </div>
          <div class="terminal-line">
            <span class="prompt">amcp></span> weather Tokyo
          </div>
          <div class="terminal-line output">
            🌤️ Tokyo: 22°C, partly cloudy
          </div>
        </div>
      </div>
    </div>
    <div class="demo-info">
      <h3>🌐 Browser Demo</h3>
      <p>Experience AMCP directly in your browser. No installation required - try weather queries, agent coordination, and LLM orchestration.</p>
      <a href="/examples/live-demo/" class="btn btn-primary">Launch Demo</a>
    </div>
  </div>
</div>

## 📚 Code Tutorials

Step-by-step guides for building with AMCP:

<div class="tutorials-grid">
  <div class="tutorial-card">
    <div class="tutorial-number">01</div>
    <div class="tutorial-content">
      <h4>Building Your First Agent</h4>
      <p>Create a custom agent from scratch with lifecycle management and event handling.</p>
      <a href="{{ '/docs/tutorials/first-agent/' | relative_url }}">Start Tutorial</a>
    </div>
  </div>

  <div class="tutorial-card">
    <div class="tutorial-number">02</div>
    <div class="tutorial-content">
      <h4>Event-Driven Communication</h4>
      <p>Master the event broker, topic routing, and CloudEvents specification.</p>
      <a href="{{ '/docs/tutorials/event-communication/' | relative_url }}">Start Tutorial</a>
    </div>
  </div>

  <div class="tutorial-card">
    <div class="tutorial-number">03</div>
    <div class="tutorial-content">
      <h4>LLM Integration Patterns</h4>
      <p>Integrate Large Language Models with AMCP for intelligent agent behavior.</p>
      <a href="{{ '/docs/tutorials/llm-integration/' | relative_url }}">Start Tutorial</a>
    </div>
  </div>

  <div class="tutorial-card">
    <div class="tutorial-number">04</div>
    <div class="tutorial-content">
      <h4>Production Deployment</h4>
      <p>Deploy AMCP in production with monitoring, scaling, and security best practices.</p>
      <a href="{{ '/docs/tutorials/production-deployment/' | relative_url }}">Start Tutorial</a>
    </div>
  </div>
</div>

## 🛠️ Development Tools

Resources for AMCP developers:

<div class="tools-section">
  <div class="tool-card">
    <h4>🧪 Testing Framework</h4>
    <p>Comprehensive testing utilities with 23 unit tests and 100% pass rate.</p>
    <a href="{{ '/docs/testing/' | relative_url }}">View Testing Guide</a>
  </div>

  <div class="tool-card">
    <h4>📊 Monitoring & Metrics</h4>
    <p>Built-in monitoring with Prometheus metrics and health checks.</p>
    <a href="{{ '/docs/monitoring/' | relative_url }}">Setup Monitoring</a>
  </div>

  <div class="tool-card">
    <h4>🐳 Docker Support</h4>
    <p>Containerized deployment with Docker Compose and Kubernetes manifests.</p>
    <a href="{{ '/docs/docker/' | relative_url }}">Docker Guide</a>
  </div>

  <div class="tool-card">
    <h4>🔧 CLI Tools</h4>
    <p>Rich command-line interface with autocompletion and interactive features.</p>
    <a href="{{ '/docs/cli/' | relative_url }}">CLI Reference</a>
  </div>
</div>

## 🚀 Getting Started

Ready to try these examples?

1. **[Install AMCP]({{ '/download/' | relative_url }})** - Get the latest version
2. **[Quick Start Guide]({{ '/docs/getting-started/' | relative_url }})** - 5-minute setup
3. **[Run Demos]({{ '/examples/demos/' | relative_url }})** - Interactive examples
4. **[Join Community]({{ '/community/' | relative_url }})** - Get help and contribute

<div class="cta-section">
  <h3>Build Something Amazing</h3>
  <p>These examples are just the beginning. AMCP's flexible architecture enables endless possibilities for multi-agent applications.</p>
  <div class="cta-actions">
    <a href="{{ '/docs/getting-started/' | relative_url }}" class="btn btn-primary btn-large">Get Started Now</a>
    <a href="https://github.com/xaviercallens/amcp-v1.5-opensource" class="btn btn-outline btn-large">View Source Code</a>
  </div>
</div>

<style>
.examples-hero {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 3rem 2rem;
  border-radius: 12px;
  text-align: center;
  margin: 2rem 0;
}

.example-stats {
  display: flex;
  justify-content: center;
  gap: 3rem;
}

.stat {
  text-align: center;
}

.stat-number {
  font-size: 2.5rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.stat-label {
  font-size: 1rem;
  opacity: 0.9;
}

.examples-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
}

.example-card {
  background: white;
  border: 2px solid #e0e0e0;
  border-radius: 12px;
  padding: 2rem;
  transition: all 0.3s ease;
}

.example-card:hover {
  border-color: #2196F3;
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.example-card.featured {
  border-color: #4CAF50;
  background: linear-gradient(135deg, #f8fff8 0%, #e8f5e8 100%);
}

.example-header {
  display: flex;
  align-items: flex-start;
  gap: 1rem;
  margin-bottom: 1rem;
}

.example-icon {
  font-size: 2.5rem;
  line-height: 1;
}

.example-meta h3 {
  margin: 0 0 0.5rem 0;
  color: #333;
}

.difficulty {
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 600;
  margin-right: 0.5rem;
}

.difficulty.beginner {
  background: #e8f5e9;
  color: #2e7d32;
}

.difficulty.intermediate {
  background: #fff3e0;
  color: #f57c00;
}

.difficulty.advanced {
  background: #ffebee;
  color: #c62828;
}

.time {
  font-size: 0.9rem;
  color: #666;
}

.example-features {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin: 1rem 0;
}

.feature {
  background: #f0f0f0;
  padding: 0.25rem 0.75rem;
  border-radius: 15px;
  font-size: 0.8rem;
  color: #666;
}

.example-actions {
  display: flex;
  gap: 1rem;
  margin-top: 1.5rem;
}

.domain-examples {
  margin: 4rem 0;
}

.domain-section {
  margin-bottom: 3rem;
}

.domain-section h3 {
  color: #333;
  margin-bottom: 1.5rem;
  font-size: 1.5rem;
}

.domain-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
}

.domain-card {
  background: #f8f9fa;
  padding: 1.5rem;
  border-radius: 8px;
  border-left: 4px solid #2196F3;
}

.domain-card h4 {
  margin: 0 0 0.5rem 0;
  color: #333;
}

.domain-card p {
  color: #666;
  margin-bottom: 1rem;
  line-height: 1.6;
}

.tech-stack {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.tech-stack span {
  background: #e3f2fd;
  color: #1976d2;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-size: 0.8rem;
}

.domain-card a {
  color: #2196F3;
  text-decoration: none;
  font-weight: 600;
}

.demo-section {
  margin: 4rem 0;
}

.demo-card {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
  align-items: center;
  background: #f8f9fa;
  padding: 2rem;
  border-radius: 12px;
}

.terminal-demo {
  background: #1e1e1e;
  border-radius: 8px;
  overflow: hidden;
}

.terminal-header {
  background: #333;
  padding: 0.75rem 1rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.terminal-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}

.terminal-dot.red { background: #ff5f56; }
.terminal-dot.yellow { background: #ffbd2e; }
.terminal-dot.green { background: #27ca3f; }

.terminal-title {
  color: #ccc;
  margin-left: auto;
  font-size: 0.9rem;
}

.terminal-content {
  padding: 1rem;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.9rem;
  line-height: 1.6;
}

.terminal-line {
  margin-bottom: 0.5rem;
}

.prompt {
  color: #4CAF50;
  font-weight: bold;
}

.output {
  color: #ccc;
  margin-left: 1rem;
}

.demo-info h3 {
  margin-bottom: 1rem;
  color: #333;
}

.tutorials-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin: 3rem 0;
}

.tutorial-card {
  display: flex;
  align-items: flex-start;
  gap: 1rem;
  background: white;
  border: 2px solid #e0e0e0;
  border-radius: 8px;
  padding: 1.5rem;
  transition: all 0.3s ease;
}

.tutorial-card:hover {
  border-color: #2196F3;
  transform: translateY(-2px);
}

.tutorial-number {
  background: #2196F3;
  color: white;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  flex-shrink: 0;
}

.tutorial-content h4 {
  margin: 0 0 0.5rem 0;
  color: #333;
}

.tutorial-content p {
  color: #666;
  margin-bottom: 1rem;
  line-height: 1.5;
}

.tutorial-content a {
  color: #2196F3;
  text-decoration: none;
  font-weight: 600;
}

.tools-section {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin: 3rem 0;
}

.tool-card {
  background: #f8f9fa;
  padding: 1.5rem;
  border-radius: 8px;
  text-align: center;
}

.tool-card h4 {
  margin: 0 0 0.5rem 0;
  color: #333;
}

.tool-card p {
  color: #666;
  margin-bottom: 1rem;
  line-height: 1.5;
}

.tool-card a {
  color: #2196F3;
  text-decoration: none;
  font-weight: 600;
}

.cta-section {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 3rem 2rem;
  border-radius: 12px;
  text-align: center;
  margin: 4rem 0;
}

.cta-section h3 {
  margin-bottom: 1rem;
  font-size: 2rem;
}

.cta-section p {
  margin-bottom: 2rem;
  font-size: 1.1rem;
  opacity: 0.9;
}

.cta-actions {
  display: flex;
  gap: 1rem;
  justify-content: center;
}

.btn-large {
  padding: 0.75rem 2rem;
  font-size: 1.1rem;
}

@media (max-width: 768px) {
  .example-stats {
    flex-direction: column;
    gap: 1.5rem;
  }
  
  .examples-grid,
  .domain-grid,
  .tutorials-grid,
  .tools-section {
    grid-template-columns: 1fr;
  }
  
  .demo-card {
    grid-template-columns: 1fr;
  }
  
  .example-actions,
  .cta-actions {
    flex-direction: column;
  }
  
  .tutorial-card {
    flex-direction: column;
    text-align: center;
  }
}
</style>
