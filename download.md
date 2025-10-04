---
layout: page
title: "Download AMCP"
description: "Download AMCP - Agent Mesh Communication Protocol for your platform"
permalink: /download/
---

# Download AMCP v1.5

Get started with AMCP today. Choose your preferred installation method:

<div class="download-hero">
  <div class="download-card featured">
    <div class="download-header">
      <h3>🚀 Latest Release</h3>
      <span class="version-badge">v1.5.0</span>
    </div>
    <p>Stable release with all features, examples, and documentation.</p>
    <div class="download-actions">
      <a href="https://github.com/xaviercallens/amcp-v1.5-opensource/archive/refs/heads/main.zip" class="btn btn-primary btn-large">
        <svg class="icon" viewBox="0 0 24 24" width="20" height="20">
          <path d="M12 2L2 7v10c0 5.55 3.84 9.739 9 11 5.16-1.261 9-5.45 9-11V7l-10-5z"/>
        </svg>
        Download ZIP
      </a>
      <a href="https://github.com/xaviercallens/amcp-v1.5-opensource" class="btn btn-outline btn-large">
        <svg class="icon" viewBox="0 0 24 24" width="20" height="20">
          <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
        </svg>
        View on GitHub
      </a>
    </div>
  </div>
</div>

## Installation Methods

### 🔧 Source Installation (Recommended)

Perfect for developers who want the latest features and ability to customize:

```bash
# Clone the repository
git clone https://github.com/xaviercallens/amcp-v1.5-opensource.git
cd amcp-v1.5-opensource

# Build the project
mvn clean package -DskipTests

# Run the CLI
java -jar cli/target/amcp-cli-1.5.0.jar
```

### 📦 Pre-built JAR

Download the pre-built JAR file (when available):

<div class="download-options">
  <div class="download-option">
    <h4>AMCP CLI</h4>
    <p>Interactive command-line interface with all agents</p>
    <a href="#" class="btn btn-primary">Download CLI JAR</a>
    <span class="file-info">~50MB • Java 21+ required</span>
  </div>
  
  <div class="download-option">
    <h4>Core Library</h4>
    <p>Core AMCP library for integration into existing projects</p>
    <a href="#" class="btn btn-outline">Download Core JAR</a>
    <span class="file-info">~15MB • Maven dependency</span>
  </div>
</div>

### 🐳 Docker Installation

Run AMCP in a containerized environment:

```bash
# Pull the Docker image (when available)
docker pull amcp/amcp-v1.5:latest

# Run AMCP CLI
docker run -it amcp/amcp-v1.5:latest

# Or with environment variables
docker run -it -e OPENWEATHER_API_KEY=your_key amcp/amcp-v1.5:latest
```

### 📋 Maven Dependency

Add AMCP to your Maven project:

```xml
<dependency>
    <groupId>io.amcp</groupId>
    <artifactId>amcp-core</artifactId>
    <version>1.5.0</version>
</dependency>

<dependency>
    <groupId>io.amcp</groupId>
    <artifactId>amcp-connectors</artifactId>
    <version>1.5.0</version>
</dependency>
```

## System Requirements

### Minimum Requirements

- **Java**: OpenJDK 21 or Oracle JDK 21+
- **Memory**: 4GB RAM
- **Storage**: 1GB free space
- **OS**: Linux, macOS, Windows

### Recommended Requirements

- **Java**: OpenJDK 21 LTS
- **Memory**: 8GB RAM
- **Storage**: 5GB free space
- **CPU**: 4+ cores
- **Network**: Broadband internet for API integrations

## Verification

After installation, verify AMCP is working correctly:

### 1. Check Java Version

```bash
java --version
# Should show Java 21 or later
```

### 2. Verify Installation

```bash
# Test the CLI
java -jar cli/target/amcp-cli-1.5.0.jar --version

# Or run a quick test
echo "help" | java -jar cli/target/amcp-cli-1.5.0.jar
```

### 3. Run Tests

```bash
# Run the test suite
mvn test

# Should show: Tests run: 23, Failures: 0, Errors: 0
```

## Release Information

### v1.5.0 (Latest) - October 2024

**New Features:**
- ✅ Enhanced LLM orchestration with simulation mode
- ✅ Improved unit test coverage (23 tests, 100% pass rate)
- ✅ Weather Agent with OpenWeatherMap integration
- ✅ MeshChat AI with conversational capabilities
- ✅ Interactive CLI with rich terminal interface
- ✅ Comprehensive documentation and examples

**Improvements:**
- 🔧 Fixed Ollama integration issues
- 🔧 Enhanced error handling and logging
- 🔧 Optimized performance and memory usage
- 🔧 Better simulation mode for development

**Bug Fixes:**
- 🐛 Resolved compilation errors
- 🐛 Fixed agent lifecycle management
- 🐛 Improved event broker stability

[View Full Changelog]({{ '/docs/changelog/' | relative_url }})

## Previous Versions

<div class="version-history">
  <div class="version-item">
    <div class="version-info">
      <h4>v1.4.0</h4>
      <span class="version-date">September 2024</span>
    </div>
    <p>Initial multi-agent framework with basic event-driven architecture</p>
    <a href="#" class="version-link">Download v1.4.0</a>
  </div>
</div>

## Getting Help

### 📚 Documentation

- **[Getting Started Guide]({{ '/docs/getting-started/' | relative_url }})** - Quick setup and first steps
- **[API Reference]({{ '/docs/api-reference/' | relative_url }})** - Complete API documentation
- **[Examples]({{ '/examples/' | relative_url }})** - Real-world usage examples

### 🤝 Community Support

- **GitHub Issues**: [Report bugs or request features](https://github.com/xaviercallens/amcp-v1.5-opensource/issues)
- **Discussions**: [Community discussions and Q&A](https://github.com/xaviercallens/amcp-v1.5-opensource/discussions)
- **Contributing**: [Contribution guidelines]({{ '/community/contributing/' | relative_url }})

### 🚨 Security

Found a security vulnerability? Please report it privately:
- **Email**: security@amcp.dev
- **GitHub**: [Security advisories](https://github.com/xaviercallens/amcp-v1.5-opensource/security)

## License

AMCP is released under the **MIT License**. You are free to use, modify, and distribute AMCP in your projects.

[View License](https://github.com/xaviercallens/amcp-v1.5-opensource/blob/main/LICENSE)

---

<div class="download-footer">
  <p><strong>Ready to get started?</strong> Download AMCP now and build your first multi-agent application in minutes!</p>
  <a href="{{ '/docs/getting-started/' | relative_url }}" class="btn btn-primary">Get Started Guide →</a>
</div>

<style>
.download-hero {
  margin: 2rem 0 3rem;
}

.download-card {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 2rem;
  border-radius: 12px;
  text-align: center;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.download-card.featured {
  border: 3px solid #4CAF50;
}

.download-header {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 1rem;
}

.download-header h3 {
  margin: 0;
  font-size: 1.5rem;
}

.version-badge {
  background: rgba(255, 255, 255, 0.2);
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.9rem;
  font-weight: 600;
}

.download-actions {
  display: flex;
  gap: 1rem;
  justify-content: center;
  margin-top: 1.5rem;
}

.btn-large {
  padding: 0.75rem 2rem;
  font-size: 1.1rem;
}

.download-options {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
}

.download-option {
  background: white;
  border: 2px solid #e0e0e0;
  border-radius: 12px;
  padding: 2rem;
  text-align: center;
  transition: all 0.3s ease;
}

.download-option:hover {
  border-color: #2196F3;
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.download-option h4 {
  color: #333;
  margin-bottom: 0.5rem;
}

.download-option p {
  color: #666;
  margin-bottom: 1.5rem;
}

.file-info {
  display: block;
  font-size: 0.9rem;
  color: #999;
  margin-top: 0.5rem;
}

.version-history {
  background: #f8f9fa;
  border-radius: 8px;
  padding: 1.5rem;
  margin: 2rem 0;
}

.version-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem 0;
  border-bottom: 1px solid #e0e0e0;
}

.version-item:last-child {
  border-bottom: none;
}

.version-info h4 {
  margin: 0;
  color: #333;
}

.version-date {
  font-size: 0.9rem;
  color: #666;
}

.version-link {
  color: #2196F3;
  text-decoration: none;
  font-weight: 500;
}

.download-footer {
  background: #f8f9fa;
  padding: 2rem;
  border-radius: 12px;
  text-align: center;
  margin: 3rem 0;
}

.download-footer p {
  margin-bottom: 1rem;
  font-size: 1.1rem;
}

@media (max-width: 768px) {
  .download-actions {
    flex-direction: column;
    align-items: center;
  }
  
  .download-options {
    grid-template-columns: 1fr;
  }
  
  .version-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }
}
</style>
