---
layout: default
title: "Getting Started with AMCP"
description: "Quick start guide for AMCP - Agent Mesh Communication Protocol"
permalink: /docs/getting-started/
---

<section class="page-hero">
  <div class="container">
    <div class="page-hero-content">
      <h1>Getting Started with AMCP</h1>
      <p class="page-subtitle">
        Get up and running with the Agent Mesh Communication Protocol in minutes
      </p>
      <div class="page-meta">
        <span class="meta-item">📚 5 min read</span>
        <span class="meta-item">🚀 Beginner friendly</span>
        <span class="meta-item">💻 Cross-platform</span>
      </div>
    </div>
  </div>
</section>

<section class="content-section">
  <div class="container">
    <div class="content-grid">
      
      <div class="content-main">
        
        ## What is AMCP?

        The **Agent Mesh Communication Protocol (AMCP)** is an enterprise-grade framework for building distributed multi-agent systems. It provides a robust, scalable foundation for agent-to-agent communication, coordination, and collaboration.

        ### Key Features

        - 🤖 **Multi-Agent Architecture**: Seamless communication between distributed agents
        - ⚡ **Event-Driven**: Real-time message passing and event handling
        - 🧠 **LLM Integration**: Built-in support for Large Language Models
        - 🌐 **Scalable**: Designed for enterprise-grade deployments
        - 🔒 **Secure**: End-to-end encryption and authentication
        - 📊 **Observable**: Comprehensive monitoring and logging

        ## Quick Installation

        ### Prerequisites

        Before installing AMCP, ensure you have:

        - **Java 17+** (OpenJDK or Oracle JDK)
        - **Maven 3.8+** for dependency management
        - **Git** for source code management

        ### Option 1: Download Release

        Download the latest release from our GitHub repository:

        ```bash
        # Download latest release
        curl -L https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io/releases/latest/download/amcp-core.jar -o amcp-core.jar

        # Run AMCP
        java -jar amcp-core.jar
        ```

        ### Option 2: Build from Source

        Clone and build the AMCP core framework:

        ```bash
        # Clone the repository
        git clone https://github.com/agentmeshcommunicationprotocol/amcpcore.github.io.git
        cd amcpcore.github.io

        # Build the project
        mvn clean install

        # Run tests
        mvn test

        # Start AMCP
        mvn exec:java -Dexec.mainClass="io.amcp.core.AMCPApplication"
        ```

        ### Option 3: Maven Dependency

        Add AMCP to your existing Maven project:

        ```xml
        <dependency>
            <groupId>io.amcp</groupId>
            <artifactId>amcp-core</artifactId>
            <version>1.5.0</version>
        </dependency>
        ```

        ## Your First AMCP Agent

        Let's create a simple agent to demonstrate AMCP capabilities:

        ### 1. Create Agent Class

        ```java
        package com.example.agents;

        import io.amcp.core.Agent;
        import io.amcp.core.Message;
        import io.amcp.core.annotations.AgentComponent;

        @AgentComponent("weather-agent")
        public class WeatherAgent extends Agent {
            
            @Override
            public void initialize() {
                super.initialize();
                log.info("Weather Agent initialized");
            }
            
            @Override
            public void handleMessage(Message message) {
                if ("GET_WEATHER".equals(message.getType())) {
                    String location = message.getPayload("location");
                    String weather = getWeatherForLocation(location);
                    
                    Message response = Message.builder()
                        .type("WEATHER_RESPONSE")
                        .payload("weather", weather)
                        .payload("location", location)
                        .build();
                        
                    sendMessage(message.getSender(), response);
                }
            }
            
            private String getWeatherForLocation(String location) {
                // Simulate weather API call
                return "Sunny, 22°C in " + location;
            }
        }
        ```

        ### 2. Configure Agent Registry

        ```java
        package com.example.config;

        import io.amcp.core.AgentRegistry;
        import io.amcp.core.config.AMCPConfiguration;
        import com.example.agents.WeatherAgent;

        public class AgentConfiguration {
            
            public static void configureAgents(AgentRegistry registry) {
                // Register weather agent
                registry.registerAgent("weather-agent", WeatherAgent.class);
                
                // Configure agent properties
                registry.setAgentProperty("weather-agent", "api.key", "your-api-key");
                registry.setAgentProperty("weather-agent", "cache.ttl", "300");
            }
        }
        ```

        ### 3. Start AMCP Application

        ```java
        package com.example;

        import io.amcp.core.AMCPApplication;
        import io.amcp.core.AgentRegistry;
        import com.example.config.AgentConfiguration;

        public class WeatherApp {
            
            public static void main(String[] args) {
                // Initialize AMCP
                AMCPApplication app = new AMCPApplication();
                
                // Configure agents
                AgentRegistry registry = app.getAgentRegistry();
                AgentConfiguration.configureAgents(registry);
                
                // Start the application
                app.start();
                
                System.out.println("AMCP Weather Application started!");
            }
        }
        ```

        ### 4. Test Your Agent

        ```java
        package com.example.test;

        import io.amcp.core.Message;
        import io.amcp.core.AgentRegistry;

        public class WeatherTest {
            
            public static void testWeatherAgent(AgentRegistry registry) {
                // Create weather request
                Message request = Message.builder()
                    .type("GET_WEATHER")
                    .payload("location", "San Francisco")
                    .build();
                
                // Send message to weather agent
                registry.sendMessage("weather-agent", request);
            }
        }
        ```

        ## Configuration

        AMCP uses a flexible configuration system. Create `amcp.properties`:

        ```properties
        # AMCP Core Configuration
        amcp.cluster.name=my-amcp-cluster
        amcp.cluster.port=8080
        amcp.cluster.discovery=multicast

        # Agent Configuration
        amcp.agents.auto-discovery=true
        amcp.agents.heartbeat.interval=30s
        amcp.agents.timeout=60s

        # Messaging Configuration
        amcp.messaging.protocol=tcp
        amcp.messaging.compression=true
        amcp.messaging.encryption=true

        # Monitoring Configuration
        amcp.monitoring.enabled=true
        amcp.monitoring.port=9090
        amcp.monitoring.metrics.export=prometheus
        ```

        ## Next Steps

        Now that you have AMCP running, explore these advanced topics:

        ### 📚 Learn More
        - [Architecture Overview](/docs/architecture/) - Understand AMCP's design
        - [Agent Development](/docs/agents/) - Build sophisticated agents
        - [API Reference](/docs/api-reference/) - Complete API documentation

        ### 🎯 Try Examples
        - [Weather Agent](/examples/weather-agent/) - Complete weather service
        - [Chat System](/examples/meshchat/) - Multi-agent chat application
        - [LLM Integration](/examples/orchestration/) - AI-powered agents

        ### 🛠️ Advanced Topics
        - [Custom Protocols](/docs/protocols/) - Implement custom communication
        - [Clustering](/docs/clustering/) - Scale across multiple nodes
        - [Security](/docs/security/) - Secure your agent network

      </div>
      
      <div class="content-sidebar">
        
        <div class="sidebar-section">
          <h3>🚀 Quick Links</h3>
          <ul class="sidebar-links">
            <li><a href="{{ site.amcp_core_url }}" target="_blank">Source Code</a></li>
            <li><a href="/docs/installation/">Installation Guide</a></li>
            <li><a href="/docs/api-reference/">API Reference</a></li>
            <li><a href="/examples/">Examples</a></li>
          </ul>
        </div>

        <div class="sidebar-section">
          <h3>📋 Prerequisites</h3>
          <ul class="sidebar-checklist">
            <li>✅ Java 17+</li>
            <li>✅ Maven 3.8+</li>
            <li>✅ Git</li>
            <li>⚡ 5 minutes</li>
          </ul>
        </div>

        <div class="sidebar-section">
          <h3>💡 Need Help?</h3>
          <p>Join our community for support and discussions.</p>
          <a href="/community/" class="btn btn-outline btn-sm">Join Community</a>
        </div>

        <div class="sidebar-section">
          <h3>📖 Related Docs</h3>
          <ul class="sidebar-links">
            <li><a href="/docs/architecture/">Architecture</a></li>
            <li><a href="/docs/configuration/">Configuration</a></li>
            <li><a href="/docs/best-practices/">Best Practices</a></li>
          </ul>
        </div>

      </div>
      
    </div>
  </div>
</section>

<style>
.page-hero {
  background: linear-gradient(135deg, var(--primary-50) 0%, var(--primary-100) 100%);
  padding: 3rem 0;
}

.page-hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.page-hero-content h1 {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--primary-dark);
  margin-bottom: 1rem;
}

.page-subtitle {
  font-size: 1.25rem;
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
}

.page-meta {
  display: flex;
  justify-content: center;
  gap: 1rem;
  flex-wrap: wrap;
}

.meta-item {
  background: rgba(255, 255, 255, 0.9);
  padding: 0.5rem 1rem;
  border-radius: var(--radius-full);
  font-size: 0.875rem;
  color: var(--primary-dark);
  font-weight: 500;
}

.content-section {
  padding: 3rem 0;
}

.content-grid {
  display: grid;
  grid-template-columns: 1fr 300px;
  gap: 3rem;
}

.content-main {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  border: 1px solid var(--border-light);
}

.content-main h2 {
  color: var(--text-primary);
  margin-top: 2rem;
  margin-bottom: 1rem;
  padding-bottom: 0.5rem;
  border-bottom: 2px solid var(--primary-100);
}

.content-main h3 {
  color: var(--text-primary);
  margin-top: 1.5rem;
  margin-bottom: 0.75rem;
}

.content-main h4 {
  color: var(--text-primary);
  margin-top: 1rem;
  margin-bottom: 0.5rem;
}

.content-main p {
  color: var(--text-secondary);
  line-height: 1.7;
  margin-bottom: 1rem;
}

.content-main ul {
  color: var(--text-secondary);
  margin-bottom: 1rem;
  padding-left: 1.5rem;
}

.content-main li {
  margin-bottom: 0.5rem;
  line-height: 1.6;
}

.content-main pre {
  background: var(--secondary-dark);
  color: var(--text-inverse);
  padding: 1.5rem;
  border-radius: var(--radius-lg);
  overflow-x: auto;
  margin: 1.5rem 0;
  border-left: 4px solid var(--primary-color);
}

.content-main code {
  background: var(--bg-secondary);
  padding: 0.25rem 0.5rem;
  border-radius: var(--radius-sm);
  font-family: var(--font-family-mono);
  font-size: 0.875rem;
}

.content-main pre code {
  background: none;
  padding: 0;
  color: inherit;
}

.content-sidebar {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.sidebar-section {
  background: var(--bg-primary);
  padding: 1.5rem;
  border-radius: var(--radius-lg);
  border: 1px solid var(--border-light);
}

.sidebar-section h3 {
  color: var(--text-primary);
  margin-bottom: 1rem;
  font-size: 1.1rem;
}

.sidebar-section p {
  color: var(--text-secondary);
  font-size: 0.9rem;
  line-height: 1.6;
  margin-bottom: 1rem;
}

.sidebar-links {
  list-style: none;
  padding: 0;
  margin: 0;
}

.sidebar-links li {
  margin-bottom: 0.5rem;
}

.sidebar-links a {
  color: var(--primary-color);
  text-decoration: none;
  font-size: 0.9rem;
  transition: color var(--transition-fast);
}

.sidebar-links a:hover {
  color: var(--primary-dark);
  text-decoration: none;
}

.sidebar-checklist {
  list-style: none;
  padding: 0;
  margin: 0;
}

.sidebar-checklist li {
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
  color: var(--text-secondary);
}

@media (max-width: 1024px) {
  .content-grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .content-sidebar {
    order: -1;
  }
}

@media (max-width: 768px) {
  .page-hero-content h1 {
    font-size: 2rem;
  }
  
  .page-meta {
    flex-direction: column;
    align-items: center;
  }
  
  .content-main {
    padding: 1.5rem;
  }
}
</style>
