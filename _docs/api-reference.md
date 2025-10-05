---
layout: default
title: "API Reference"
description: "Complete API documentation for AMCP - Agent Mesh Communication Protocol"
permalink: /docs/api-reference/
---

<section class="page-hero">
  <div class="container">
    <div class="page-hero-content">
      <h1>API Reference</h1>
      <p class="page-subtitle">
        Complete API documentation for the Agent Mesh Communication Protocol
      </p>
      <div class="page-meta">
        <span class="meta-item">📖 Complete Reference</span>
        <span class="meta-item">🔗 Live Examples</span>
        <span class="meta-item">⚡ v1.5.0</span>
      </div>
    </div>
  </div>
</section>

<section class="api-navigation">
  <div class="container">
    <div class="api-nav-grid">
      
      <div class="api-nav-card">
        <div class="api-nav-icon">🤖</div>
        <h3>Core Agent API</h3>
        <p>Base agent classes and interfaces</p>
        <a href="#core-agent" class="api-nav-link">Explore →</a>
      </div>

      <div class="api-nav-card">
        <div class="api-nav-icon">💬</div>
        <h3>Messaging API</h3>
        <p>Message handling and communication</p>
        <a href="#messaging" class="api-nav-link">Explore →</a>
      </div>

      <div class="api-nav-card">
        <div class="api-nav-icon">🔧</div>
        <h3>Configuration API</h3>
        <p>System configuration and setup</p>
        <a href="#configuration" class="api-nav-link">Explore →</a>
      </div>

      <div class="api-nav-card">
        <div class="api-nav-icon">📊</div>
        <h3>Monitoring API</h3>
        <p>Metrics and health monitoring</p>
        <a href="#monitoring" class="api-nav-link">Explore →</a>
      </div>

    </div>
  </div>
</section>

<section class="content-section">
  <div class="container">
    <div class="content-grid">
      
      <div class="content-main">

        ## Core Agent API {#core-agent}

        The Core Agent API provides the fundamental building blocks for creating intelligent agents in the AMCP framework.

        ### Agent Class

        The base `Agent` class that all custom agents should extend:

        ```java
        package io.amcp.core;

        public abstract class Agent {
            
            // Agent lifecycle methods
            public abstract void initialize();
            public abstract void handleMessage(Message message);
            public void shutdown() { /* default implementation */ }
            
            // Message sending methods
            public void sendMessage(String targetAgent, Message message);
            public void broadcastMessage(Message message);
            public void sendResponse(Message originalMessage, Message response);
            
            // Agent information
            public String getAgentId();
            public AgentStatus getStatus();
            public AgentMetadata getMetadata();
            
            // Configuration access
            public String getProperty(String key);
            public void setProperty(String key, String value);
        }
        ```

        #### Example Implementation

        ```java
        @AgentComponent("my-agent")
        public class MyAgent extends Agent {
            
            @Override
            public void initialize() {
                log.info("MyAgent initialized with ID: {}", getAgentId());
                
                // Subscribe to message types
                subscribeToMessageType("TASK_REQUEST");
                subscribeToMessageType("STATUS_CHECK");
            }
            
            @Override
            public void handleMessage(Message message) {
                switch (message.getType()) {
                    case "TASK_REQUEST":
                        handleTaskRequest(message);
                        break;
                    case "STATUS_CHECK":
                        handleStatusCheck(message);
                        break;
                    default:
                        log.warn("Unknown message type: {}", message.getType());
                }
            }
            
            private void handleTaskRequest(Message message) {
                String task = message.getPayload("task");
                
                // Process task
                String result = processTask(task);
                
                // Send response
                Message response = Message.builder()
                    .type("TASK_RESPONSE")
                    .payload("result", result)
                    .payload("status", "completed")
                    .build();
                    
                sendResponse(message, response);
            }
        }
        ```

        ### AgentRegistry

        Central registry for managing agents in the AMCP system:

        ```java
        package io.amcp.core;

        public class AgentRegistry {
            
            // Agent registration
            public void registerAgent(String agentId, Class<? extends Agent> agentClass);
            public void registerAgent(String agentId, Agent agentInstance);
            public void unregisterAgent(String agentId);
            
            // Agent lifecycle
            public Agent createAgentInstance(String agentId);
            public void startAgent(String agentId);
            public void stopAgent(String agentId);
            public void restartAgent(String agentId);
            
            // Agent discovery
            public boolean isAgentRegistered(String agentId);
            public List<String> getAllRegisteredAgentNames();
            public Agent getAgent(String agentId);
            public AgentStatus getAgentStatus(String agentId);
            
            // Message routing
            public void sendMessage(String targetAgent, Message message);
            public void broadcastMessage(Message message);
        }
        ```

        ## Messaging API {#messaging}

        The Messaging API handles all communication between agents in the AMCP framework.

        ### Message Class

        Core message structure for agent communication:

        ```java
        package io.amcp.core;

        public class Message {
            
            // Message identification
            public String getId();
            public String getType();
            public long getTimestamp();
            
            // Sender and recipient information
            public String getSender();
            public String getRecipient();
            public String getCorrelationId();
            
            // Message content
            public Map<String, Object> getPayloads();
            public <T> T getPayload(String key);
            public <T> T getPayload(String key, Class<T> type);
            
            // Message properties
            public MessagePriority getPriority();
            public long getTtl(); // Time to live
            public boolean isExpired();
            
            // Builder pattern
            public static MessageBuilder builder();
        }
        ```

        #### Message Builder

        ```java
        Message message = Message.builder()
            .type("USER_REQUEST")
            .sender("web-agent")
            .recipient("processing-agent")
            .payload("userId", "12345")
            .payload("action", "process_data")
            .payload("data", userData)
            .priority(MessagePriority.HIGH)
            .ttl(30000) // 30 seconds
            .correlationId("req-" + UUID.randomUUID())
            .build();
        ```

        ### MessageHandler Interface

        For handling specific message types:

        ```java
        package io.amcp.core.messaging;

        @FunctionalInterface
        public interface MessageHandler {
            void handle(Message message, MessageContext context);
        }

        // Usage example
        public class WeatherAgent extends Agent {
            
            @Override
            public void initialize() {
                // Register specific message handlers
                registerMessageHandler("GET_WEATHER", this::handleWeatherRequest);
                registerMessageHandler("UPDATE_LOCATION", this::handleLocationUpdate);
            }
            
            private void handleWeatherRequest(Message message, MessageContext context) {
                String location = message.getPayload("location");
                WeatherData weather = weatherService.getWeather(location);
                
                Message response = Message.builder()
                    .type("WEATHER_RESPONSE")
                    .payload("weather", weather)
                    .build();
                    
                context.sendResponse(response);
            }
        }
        ```

        ### MessageBus

        Central message routing and delivery system:

        ```java
        package io.amcp.core.messaging;

        public class MessageBus {
            
            // Message publishing
            public void publish(Message message);
            public void publish(String topic, Message message);
            
            // Subscription management
            public void subscribe(String topic, MessageHandler handler);
            public void subscribe(String topic, Agent agent);
            public void unsubscribe(String topic, MessageHandler handler);
            
            // Message routing
            public void route(Message message);
            public void routeToAgent(String agentId, Message message);
            
            // Message filtering
            public void addMessageFilter(MessageFilter filter);
            public void removeMessageFilter(MessageFilter filter);
        }
        ```

        ## Configuration API {#configuration}

        Configuration management for AMCP applications.

        ### AMCPConfiguration

        Main configuration class for AMCP settings:

        ```java
        package io.amcp.core.config;

        public class AMCPConfiguration {
            
            // Cluster configuration
            public String getClusterName();
            public int getClusterPort();
            public String getDiscoveryMethod();
            
            // Agent configuration
            public boolean isAutoDiscoveryEnabled();
            public Duration getHeartbeatInterval();
            public Duration getAgentTimeout();
            
            // Messaging configuration
            public String getMessagingProtocol();
            public boolean isCompressionEnabled();
            public boolean isEncryptionEnabled();
            
            // Monitoring configuration
            public boolean isMonitoringEnabled();
            public int getMonitoringPort();
            public String getMetricsExportFormat();
            
            // Load configuration
            public static AMCPConfiguration load();
            public static AMCPConfiguration load(String configFile);
            public static AMCPConfiguration load(Properties properties);
        }
        ```

        #### Configuration Example

        ```java
        // Load configuration
        AMCPConfiguration config = AMCPConfiguration.load("amcp.properties");

        // Create AMCP application with configuration
        AMCPApplication app = new AMCPApplication(config);

        // Override specific settings
        config.setProperty("amcp.cluster.port", "8081");
        config.setProperty("amcp.monitoring.enabled", "true");
        ```

        ### PropertyManager

        Dynamic property management:

        ```java
        package io.amcp.core.config;

        public class PropertyManager {
            
            // Property access
            public String getProperty(String key);
            public String getProperty(String key, String defaultValue);
            public <T> T getProperty(String key, Class<T> type);
            
            // Property modification
            public void setProperty(String key, String value);
            public void setProperty(String key, Object value);
            public void removeProperty(String key);
            
            // Property watching
            public void addPropertyChangeListener(String key, PropertyChangeListener listener);
            public void removePropertyChangeListener(String key, PropertyChangeListener listener);
            
            // Bulk operations
            public void loadProperties(Properties properties);
            public Properties exportProperties();
            public void reloadProperties();
        }
        ```

        ## Monitoring API {#monitoring}

        Comprehensive monitoring and metrics collection.

        ### MetricsCollector

        Collect and export metrics from AMCP applications:

        ```java
        package io.amcp.core.monitoring;

        public class MetricsCollector {
            
            // Counter metrics
            public void incrementCounter(String name);
            public void incrementCounter(String name, long value);
            public void incrementCounter(String name, Map<String, String> tags);
            
            // Gauge metrics
            public void setGauge(String name, double value);
            public void setGauge(String name, double value, Map<String, String> tags);
            
            // Timer metrics
            public Timer startTimer(String name);
            public void recordTime(String name, Duration duration);
            
            // Histogram metrics
            public void recordValue(String name, double value);
            
            // Custom metrics
            public void recordMetric(String name, Object value, MetricType type);
            
            // Export metrics
            public String exportMetrics(MetricsFormat format);
            public void exportToEndpoint(String endpoint);
        }
        ```

        ### HealthCheck

        System health monitoring:

        ```java
        package io.amcp.core.monitoring;

        public abstract class HealthCheck {
            
            public abstract HealthStatus check();
            
            public String getName();
            public String getDescription();
            public Duration getTimeout();
        }

        // Example implementation
        public class DatabaseHealthCheck extends HealthCheck {
            
            @Override
            public HealthStatus check() {
                try {
                    // Check database connectivity
                    if (database.isConnected()) {
                        return HealthStatus.healthy("Database connection OK");
                    } else {
                        return HealthStatus.unhealthy("Database connection failed");
                    }
                } catch (Exception e) {
                    return HealthStatus.unhealthy("Database error: " + e.getMessage());
                }
            }
        }
        ```

        ### AgentMonitor

        Monitor individual agent performance:

        ```java
        package io.amcp.core.monitoring;

        public class AgentMonitor {
            
            // Agent metrics
            public long getMessagesSent(String agentId);
            public long getMessagesReceived(String agentId);
            public double getAverageResponseTime(String agentId);
            public AgentStatus getAgentStatus(String agentId);
            
            // Performance metrics
            public double getCpuUsage(String agentId);
            public long getMemoryUsage(String agentId);
            public int getActiveThreads(String agentId);
            
            // Health monitoring
            public HealthStatus getAgentHealth(String agentId);
            public List<HealthIssue> getHealthIssues(String agentId);
            
            // Event tracking
            public void recordAgentEvent(String agentId, AgentEvent event);
            public List<AgentEvent> getAgentEvents(String agentId, Duration timeWindow);
        }
        ```

        ## Error Handling

        ### AMCPException

        Base exception class for AMCP-specific errors:

        ```java
        package io.amcp.core.exceptions;

        public class AMCPException extends RuntimeException {
            
            public AMCPException(String message);
            public AMCPException(String message, Throwable cause);
            public AMCPException(ErrorCode errorCode, String message);
            
            public ErrorCode getErrorCode();
            public String getErrorDetails();
            public Map<String, Object> getErrorContext();
        }
        ```

        ### Common Exception Types

        ```java
        // Agent-related exceptions
        public class AgentNotFoundException extends AMCPException { }
        public class AgentInitializationException extends AMCPException { }
        public class AgentCommunicationException extends AMCPException { }

        // Message-related exceptions
        public class MessageDeliveryException extends AMCPException { }
        public class MessageSerializationException extends AMCPException { }
        public class MessageTimeoutException extends AMCPException { }

        // Configuration exceptions
        public class ConfigurationException extends AMCPException { }
        public class InvalidPropertyException extends AMCPException { }
        ```

      </div>
      
      <div class="content-sidebar">
        
        <div class="sidebar-section">
          <h3>🔗 Quick Navigation</h3>
          <ul class="sidebar-links">
            <li><a href="#core-agent">Core Agent API</a></li>
            <li><a href="#messaging">Messaging API</a></li>
            <li><a href="#configuration">Configuration API</a></li>
            <li><a href="#monitoring">Monitoring API</a></li>
          </ul>
        </div>

        <div class="sidebar-section">
          <h3>📚 Related Documentation</h3>
          <ul class="sidebar-links">
            <li><a href="/docs/getting-started/">Getting Started</a></li>
            <li><a href="/docs/architecture/">Architecture</a></li>
            <li><a href="/docs/best-practices/">Best Practices</a></li>
            <li><a href="/examples/">Examples</a></li>
          </ul>
        </div>

        <div class="sidebar-section">
          <h3>🔧 Source Code</h3>
          <p>Explore the complete AMCP source code on GitHub.</p>
          <a href="{{ site.amcp_core_url }}" class="btn btn-outline btn-sm" target="_blank">View on GitHub</a>
        </div>

        <div class="sidebar-section">
          <h3>💡 Need Help?</h3>
          <p>Join our community for API support and discussions.</p>
          <a href="/community/" class="btn btn-outline btn-sm">Get Support</a>
        </div>

      </div>
      
    </div>
  </div>
</section>

<style>
.api-navigation {
  padding: 3rem 0;
  background: var(--bg-secondary);
}

.api-nav-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.api-nav-card {
  background: var(--bg-primary);
  padding: 2rem;
  border-radius: var(--radius-xl);
  text-align: center;
  border: 1px solid var(--border-light);
  transition: all var(--transition-normal);
}

.api-nav-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg);
  border-color: var(--primary-200);
}

.api-nav-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
  display: block;
}

.api-nav-card h3 {
  color: var(--text-primary);
  margin-bottom: 0.75rem;
  font-size: 1.25rem;
}

.api-nav-card p {
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  font-size: 0.9rem;
}

.api-nav-link {
  color: var(--primary-color);
  font-weight: 500;
  text-decoration: none;
  transition: color var(--transition-fast);
}

.api-nav-link:hover {
  color: var(--primary-dark);
  text-decoration: none;
}
</style>
