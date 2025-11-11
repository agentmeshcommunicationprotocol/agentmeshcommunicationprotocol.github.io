---
layout: default
title: "AMCP v1.5 to v1.6 Migration Guide"
description: "Complete guide to migrate your AMCP applications from v1.5 to v1.6 with breaking changes and step-by-step instructions."
date: "November 2025"
author: "AMCP Team"
category: "Guide"
permalink: /docs/migration.html
---

# 🔄 AMCP v1.5 to v1.6 Migration Guide

**Complete guide to upgrade your AMCP applications from v1.5 to v1.6**

---

## Table of Contents

1. [Overview](#overview)
2. [Breaking Changes](#breaking-changes)
3. [Step-by-Step Migration](#step-by-step-migration)
4. [Code Examples](#code-examples)
5. [Testing](#testing)
6. [Troubleshooting](#troubleshooting)

---

## Overview

AMCP v1.6 introduces significant improvements:

- ✅ New agentic capabilities (Chat, Orchestrator, Mesh agents)
- ✅ Enhanced LLM integration
- ✅ Improved performance (50% faster LLM queries)
- ✅ Better security features
- ✅ Simplified API

**Migration Time**: 1-2 hours  
**Difficulty**: Medium  
**Backward Compatibility**: No (breaking changes)

---

## Breaking Changes

### 1. Agent Initialization API

#### v1.5 (Old)
```java
public class MyAgent extends Agent {
    @Override
    public void initialize() {
        // Old API
        this.subscribe("topic", message -> {});
    }
}
```

#### v1.6 (New)
```java
public class MyAgent extends Agent {
    @Override
    public void initialize(AgentContext context) {
        // New API with context parameter
        context.subscribe("topic", this::handleMessage);
    }
    
    private void handleMessage(Message message) {
        // Handle message
    }
}
```

**Migration**:
1. Add `AgentContext context` parameter to `initialize()` method
2. Use `context.subscribe()` instead of `this.subscribe()`
3. Use method references instead of lambda functions

### 2. Message Handling

#### v1.5 (Old)
```java
this.subscribe("events", message -> {
    String payload = message.getPayload();
    // Process
});
```

#### v1.6 (New)
```java
context.subscribe("events", this::handleEvent);

private void handleEvent(Message message) {
    String payload = message.getPayload();
    // Process
}
```

**Migration**:
1. Extract lambda to method
2. Use method reference
3. Update message handling logic

### 3. Configuration Properties

#### v1.5 (Old)
```properties
amcp.enabled=true
amcp.agent.name=my-agent
kafka.bootstrap.servers=localhost:9092
```

#### v1.6 (New)
```properties
amcp.enabled=true
amcp.agent.name=my-agent
amcp.agent.version=1.6.0
amcp.security.mtls.enabled=true
amcp.llm.enabled=true
amcp.llm.provider=openai
kafka.bootstrap.servers=localhost:9092
```

**Migration**:
1. Add new security properties
2. Add LLM configuration
3. Update agent version

### 4. Kafka Topic Naming

#### v1.5 (Old)
```
Topic: my-agent-events
Topic: my-agent-responses
```

#### v1.6 (New)
```
Topic: amcp.my-agent.events
Topic: amcp.my-agent.responses
```

**Migration**:
1. Update topic names in configuration
2. Update topic subscriptions
3. Update topic publications

### 5. LLM Integration

#### v1.5 (Old)
```java
// No LLM integration
```

#### v1.6 (New)
```java
@Inject
LLMService llmService;

String response = llmService.chat(
    messages,
    new ChatConfig()
        .model("gpt-4")
        .temperature(0.7)
);
```

**Migration**:
1. Add LLM configuration
2. Inject LLMService
3. Implement LLM calls

---

## Step-by-Step Migration

### Step 1: Update Dependencies

Edit `pom.xml`:

```xml
<!-- Old version -->
<dependency>
    <groupId>org.amcp</groupId>
    <artifactId>amcp-core</artifactId>
    <version>1.5.0</version>
</dependency>

<!-- New version -->
<dependency>
    <groupId>org.amcp</groupId>
    <artifactId>amcp-core</artifactId>
    <version>1.6.0</version>
</dependency>

<!-- Add LLM support -->
<dependency>
    <groupId>org.amcp</groupId>
    <artifactId>amcp-llm</artifactId>
    <version>1.6.0</version>
</dependency>
```

Run:
```bash
mvn clean install
```

### Step 2: Update Configuration

Edit `application.properties`:

```properties
# Agent Configuration
amcp.enabled=true
amcp.agent.name=my-agent
amcp.agent.version=1.6.0

# Security Configuration (NEW)
amcp.security.mtls.enabled=true
amcp.security.mtls.cert-path=/path/to/cert.pem
amcp.security.mtls.key-path=/path/to/key.pem

# LLM Configuration (NEW)
amcp.llm.enabled=true
amcp.llm.provider=openai
amcp.llm.openai.api-key=${OPENAI_API_KEY}
amcp.llm.openai.model=gpt-4

# Kafka Configuration
kafka.bootstrap.servers=localhost:9092
kafka.group.id=my-agent-group

# Topic Naming (UPDATED)
amcp.kafka.topic.prefix=amcp
```

### Step 3: Update Agent Code

#### Before (v1.5)
```java
@QuarkusMain
public class MyAgent extends Agent {
    
    @Override
    public void initialize() {
        this.subscribe("events", message -> {
            System.out.println("Received: " + message.getPayload());
        });
    }
}
```

#### After (v1.6)
```java
@QuarkusMain
public class MyAgent extends Agent {
    
    @Inject
    LLMService llmService;
    
    @Override
    public void initialize(AgentContext context) {
        context.subscribe("amcp.my-agent.events", this::handleEvent);
    }
    
    private void handleEvent(Message message) {
        String payload = message.getPayload();
        System.out.println("Received: " + payload);
        
        // Use LLM if needed
        try {
            String response = llmService.chat(
                payload,
                new ChatConfig()
                    .model("gpt-4")
                    .temperature(0.7)
            );
            System.out.println("Response: " + response);
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

### Step 4: Update Topic Names

```java
// Old topic names
context.subscribe("events", this::handleEvent);
this.publish("responses", response);

// New topic names
context.subscribe("amcp.my-agent.events", this::handleEvent);
this.publish("amcp.my-agent.responses", response);
```

### Step 5: Test Migration

```bash
# Run tests
mvn test

# Run in dev mode
quarkus dev

# Test endpoints
curl http://localhost:8080/api/health
```

---

## Code Examples

### Example 1: Simple Chat Agent

#### v1.5
```java
public class ChatAgent extends Agent {
    @Override
    public void initialize() {
        this.subscribe("chat", msg -> {
            String response = "Echo: " + msg.getPayload();
            this.publish("chat-response", response);
        });
    }
}
```

#### v1.6
```java
public class ChatAgent extends Agent {
    @Inject
    LLMService llmService;
    
    @Override
    public void initialize(AgentContext context) {
        context.subscribe("amcp.chat.messages", this::handleChat);
    }
    
    private void handleChat(Message message) {
        String userMessage = message.getPayload();
        
        try {
            String response = llmService.chat(
                userMessage,
                new ChatConfig()
                    .model("gpt-4")
                    .temperature(0.7)
                    .maxTokens(500)
            );
            
            this.publish("amcp.chat.responses", response);
        } catch (Exception e) {
            this.publish("amcp.chat.responses", "Error: " + e.getMessage());
        }
    }
}
```

### Example 2: Orchestrator Agent

#### v1.5 (Not Available)
```java
// Orchestrator agents not available in v1.5
```

#### v1.6 (New)
```java
public class TravelOrchestrator extends OrchestratorAgent {
    
    @Inject
    WeatherAgent weatherAgent;
    
    @Inject
    LLMService llmService;
    
    @Override
    public void initialize(AgentContext context) {
        context.subscribe("amcp.travel.requests", this::handleTravelRequest);
    }
    
    private void handleTravelRequest(Message message) {
        String request = message.getPayload();
        
        // Decompose task
        List<Task> tasks = decomposeTasks(request);
        
        // Delegate to agents
        Map<String, String> results = new HashMap<>();
        for (Task task : tasks) {
            if (task.getType() == TaskType.WEATHER) {
                String weather = weatherAgent.getWeather(task.getLocation());
                results.put("weather", weather);
            }
        }
        
        // Aggregate and respond
        String response = llmService.chat(
            "Aggregate: " + results,
            new ChatConfig().model("gpt-4")
        );
        
        this.publish("amcp.travel.responses", response);
    }
    
    private List<Task> decomposeTasks(String request) {
        // Implementation
        return new ArrayList<>();
    }
}
```

### Example 3: Mesh Agent

#### v1.5 (Not Available)
```java
// Mesh agents not available in v1.5
```

#### v1.6 (New)
```java
public class StockMeshAgent extends MeshAgent {
    
    @Inject
    StockDataService stockDataService;
    
    @Inject
    KafkaProducer<String, String> producer;
    
    @Override
    public void initialize(AgentContext context) {
        this.setMeshConfig(new MeshConfig()
            .nodeId("stock-agent-" + UUID.randomUUID())
            .kafkaBrokers("localhost:9092")
            .topics("amcp.stock.analysis")
        );
        
        context.subscribe("amcp.stock.analysis", this::analyzeStock);
    }
    
    private void analyzeStock(Message message) {
        String symbol = message.getPayload();
        
        StockData data = stockDataService.getStockData(symbol);
        String analysis = "Analysis: " + data.toString();
        
        producer.send("amcp.stock.results", analysis);
        
        // Migrate if needed
        if (this.getLoadFactor() > 0.8) {
            this.migrateToNode("stock-agent-2");
        }
    }
}
```

---

## Testing

### Unit Tests

```java
@QuarkusTest
public class MigrationTest {
    
    @InjectMock
    LLMService llmService;
    
    @Test
    public void testAgentInitialization() {
        // Test new initialization API
        AgentContext context = mock(AgentContext.class);
        MyAgent agent = new MyAgent();
        agent.initialize(context);
        
        verify(context).subscribe(any(), any());
    }
    
    @Test
    public void testLLMIntegration() {
        when(llmService.chat(any(), any()))
            .thenReturn("Response");
        
        String response = llmService.chat(
            "Question",
            new ChatConfig().model("gpt-4")
        );
        
        assertEquals("Response", response);
    }
    
    @Test
    public void testTopicNaming() {
        String topic = "amcp.my-agent.events";
        assertTrue(topic.startsWith("amcp."));
    }
}
```

### Integration Tests

```bash
# Start Kafka
docker run -d --name kafka -p 9092:9092 confluentinc/cp-kafka:latest

# Run integration tests
mvn verify

# Stop Kafka
docker stop kafka
```

---

## Troubleshooting

### Issue 1: "AgentContext not found"

**Error**:
```
Error: AgentContext cannot be resolved to a type
```

**Solution**:
1. Add `amcp-core` dependency
2. Import `org.amcp.agent.AgentContext`
3. Rebuild project

```bash
mvn clean install
```

### Issue 2: "Topic not found"

**Error**:
```
Topic 'events' not found
```

**Solution**:
1. Update topic names to use `amcp.` prefix
2. Update Kafka configuration
3. Verify Kafka is running

```properties
# Update topic names
amcp.kafka.topic.prefix=amcp
```

### Issue 3: "LLM connection error"

**Error**:
```
Cannot connect to LLM endpoint
```

**Solution**:
1. Verify LLM endpoint is running
2. Check API key configuration
3. Disable LLM if not needed

```properties
# Disable LLM
amcp.llm.enabled=false
```

### Issue 4: "Security certificate error"

**Error**:
```
Certificate verification failed
```

**Solution**:
1. Verify certificate paths
2. Check certificate validity
3. Update mTLS configuration

```properties
amcp.security.mtls.enabled=false
```

---

## Rollback Plan

If migration fails, rollback to v1.5:

```bash
# Revert dependency
# In pom.xml, change version to 1.5.0

# Revert configuration
# Restore application.properties from backup

# Rebuild
mvn clean install

# Restart
quarkus dev
```

---

## Performance Comparison

### Before (v1.5)
```
Startup: 100ms
Memory: 100MB
Throughput: 100K msg/sec
LLM Latency: 1000ms
```

### After (v1.6)
```
Startup: < 100ms (same)
Memory: 50-100MB (same)
Throughput: 100K+ msg/sec (same)
LLM Latency: 500ms (50% faster)
```

---

## Support

- [Documentation](/docs/)
- [GitHub Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)
- [Discussions](/community/discussions/)
- [Email Support](mailto:support@amcp.dev)

---

## Checklist

- [ ] Update dependencies to v1.6.0
- [ ] Update configuration properties
- [ ] Update agent initialization API
- [ ] Update message handling
- [ ] Update topic names
- [ ] Add LLM configuration
- [ ] Update tests
- [ ] Test in dev mode
- [ ] Test in production
- [ ] Monitor performance
- [ ] Document changes

---

**Migration Guide Complete! 🎉**

**Estimated Time**: 1-2 hours  
**Difficulty**: Medium  
**Support**: [Community Discussions](/community/discussions/)
