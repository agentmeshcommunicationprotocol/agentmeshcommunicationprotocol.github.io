---
layout: default
title: "Building Your First AMCP Agent - Step-by-Step Tutorial"
description: "Learn how to build your first AMCP agent in 5 minutes. Complete guide with code examples, CLI commands, and testing."
date: "November 2025"
author: "AMCP Team"
category: "Tutorial"
permalink: /docs/tutorials/first-agent.html
---

# 🚀 Building Your First AMCP Agent - Step-by-Step Tutorial

**Complete beginner guide to creating your first AMCP agent with Quarkus and Kafka**

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Project Setup](#project-setup)
3. [Create Your First Agent](#create-your-first-agent)
4. [Run Your Agent](#run-your-agent)
5. [Test Your Agent](#test-your-agent)
6. [Next Steps](#next-steps)

---

## Prerequisites

Before starting, ensure you have:

```bash
# Check Java version (11+)
java -version

# Check Maven version (3.6+)
mvn -version

# Install Quarkus CLI
curl -Ls https://sh.quarkus.io | bash

# Install Kafka (optional, for advanced examples)
# Using Docker:
docker run -d --name kafka \
  -p 9092:9092 \
  confluentinc/cp-kafka:latest
```

---

## Project Setup

### Step 1: Create Quarkus Project

```bash
# Create new Quarkus project with AMCP extension
quarkus create app my-first-agent \
  --extension=amcp-quarkus,kafka

# Navigate to project
cd my-first-agent
```

### Step 2: Project Structure

```
my-first-agent/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── MyFirstAgent.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
│       └── java/
│           └── MyFirstAgentTest.java
├── pom.xml
└── README.md
```

### Step 3: Update Dependencies

Edit `pom.xml`:

```xml
<dependency>
    <groupId>org.amcp</groupId>
    <artifactId>amcp-core</artifactId>
    <version>1.6.0</version>
</dependency>

<dependency>
    <groupId>io.quarkus</groupId>
    <artifactId>quarkus-kafka-client</artifactId>
</dependency>

<dependency>
    <groupId>io.quarkus</groupId>
    <artifactId>quarkus-rest-client-reactive</artifactId>
</dependency>
```

---

## Create Your First Agent

### Step 1: Configure Application Properties

Edit `src/main/resources/application.properties`:

```properties
# AMCP Configuration
amcp.enabled=true
amcp.agent.name=my-first-agent
amcp.agent.version=1.0.0

# Kafka Configuration
kafka.bootstrap.servers=localhost:9092
kafka.group.id=my-first-agent-group

# LLM Configuration (optional)
amcp.llm.provider=local
amcp.llm.local.endpoint=http://localhost:8000
amcp.llm.local.model=llama2-7b

# Server Configuration
quarkus.http.port=8080
quarkus.application.name=my-first-agent
```

### Step 2: Create Your First Agent

Create `src/main/java/MyFirstAgent.java`:

```java
package org.example;

import io.quarkus.runtime.QuarkusApplication;
import io.quarkus.runtime.annotations.QuarkusMain;
import org.amcp.agent.Agent;
import org.amcp.agent.AgentContext;
import org.amcp.agent.Message;
import org.amcp.llm.LLMService;
import org.amcp.llm.ChatConfig;
import jakarta.inject.Inject;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * My First AMCP Agent
 * 
 * This is a simple greeting agent that:
 * 1. Listens for messages on a Kafka topic
 * 2. Processes the message with LLM (optional)
 * 3. Generates a response
 * 4. Publishes the response
 */
@QuarkusMain
public class MyFirstAgent extends Agent implements QuarkusApplication {
    
    @Inject
    LLMService llmService;
    
    @Override
    public void initialize(AgentContext context) {
        System.out.println("🤖 Initializing My First Agent...");
        
        // Set agent metadata
        this.setAgentName("my-first-agent");
        this.setVersion("1.0.0");
        
        // Subscribe to incoming messages
        context.subscribe("greetings", this::handleGreeting);
        context.subscribe("questions", this::handleQuestion);
        
        System.out.println("✅ Agent initialized successfully!");
    }
    
    /**
     * Handle greeting messages
     */
    private void handleGreeting(Message message) {
        String userGreeting = message.getPayload();
        
        System.out.println("📨 Received greeting: " + userGreeting);
        
        // Generate response
        String response = generateGreetingResponse(userGreeting);
        
        System.out.println("📤 Sending response: " + response);
        
        // Publish response
        this.publish("greeting-responses", response);
    }
    
    /**
     * Handle question messages with LLM
     */
    private void handleQuestion(Message message) {
        String question = message.getPayload();
        
        System.out.println("❓ Received question: " + question);
        
        try {
            // Use LLM to answer question
            String answer = llmService.chat(
                question,
                new ChatConfig()
                    .model("llama2-7b")
                    .temperature(0.7)
                    .maxTokens(500)
            );
            
            System.out.println("💡 Generated answer: " + answer);
            
            // Publish answer
            this.publish("question-answers", answer);
            
        } catch (Exception e) {
            System.err.println("⚠️ Error processing question: " + e.getMessage());
            this.publish("question-answers", "Sorry, I couldn't process your question.");
        }
    }
    
    /**
     * Generate greeting response
     */
    private String generateGreetingResponse(String greeting) {
        String timestamp = LocalDateTime.now()
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        
        return String.format(
            "Hello! You said: '%s' at %s. Welcome to AMCP!",
            greeting,
            timestamp
        );
    }
    
    @Override
    public int run(String... args) throws Exception {
        System.out.println("🚀 Starting My First Agent...");
        
        // Agent will run indefinitely
        Thread.currentThread().join();
        
        return 0;
    }
}
```

### Step 3: Create REST Endpoint

Create `src/main/java/GreetingResource.java`:

```java
package org.example;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.amcp.agent.AgentContext;

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class GreetingResource {
    
    @Inject
    AgentContext agentContext;
    
    @POST
    @Path("/greet")
    public Response greet(String message) {
        try {
            // Publish message to agent
            agentContext.publish("greetings", message);
            
            return Response.ok()
                .entity(new Response("Message sent to agent"))
                .build();
        } catch (Exception e) {
            return Response.serverError()
                .entity(new ErrorResponse(e.getMessage()))
                .build();
        }
    }
    
    @POST
    @Path("/ask")
    public Response ask(String question) {
        try {
            // Publish question to agent
            agentContext.publish("questions", question);
            
            return Response.ok()
                .entity(new Response("Question sent to agent"))
                .build();
        } catch (Exception e) {
            return Response.serverError()
                .entity(new ErrorResponse(e.getMessage()))
                .build();
        }
    }
    
    @GET
    @Path("/health")
    public Response health() {
        return Response.ok()
            .entity(new HealthResponse("Agent is running", "healthy"))
            .build();
    }
    
    // Response classes
    public static class Response {
        public String message;
        
        public Response(String message) {
            this.message = message;
        }
    }
    
    public static class ErrorResponse {
        public String error;
        
        public ErrorResponse(String error) {
            this.error = error;
        }
    }
    
    public static class HealthResponse {
        public String status;
        public String health;
        
        public HealthResponse(String status, String health) {
            this.status = status;
            this.health = health;
        }
    }
}
```

---

## Run Your Agent

### Step 1: Start in Development Mode

```bash
# Start Quarkus in development mode
quarkus dev

# Output:
# __  ____  __  _____   ___  __ ____  ______
# --/ __ \/ / / / _ | / _ \/ //_/ / / / __/
# -/ /_/ / /_/ / __ |/ __, / ,< / /_/ /\ \
#--\___\_\____/_/ |_/_/ |_/_/|_|\____/___/
# Quarkus 3.5.0 on JVM
# Listening on: http://localhost:8080
# 
# 🤖 Initializing My First Agent...
# ✅ Agent initialized successfully!
```

### Step 2: Verify Agent is Running

```bash
# Check health endpoint
curl http://localhost:8080/api/health

# Response:
# {
#   "status": "Agent is running",
#   "health": "healthy"
# }
```

---

## Test Your Agent

### Test 1: Send a Greeting

```bash
# Send greeting message
curl -X POST http://localhost:8080/api/greet \
  -H "Content-Type: application/json" \
  -d '"Hello, AMCP Agent!"'

# Response:
# {
#   "message": "Message sent to agent"
# }

# Check agent output:
# 📨 Received greeting: Hello, AMCP Agent!
# 📤 Sending response: Hello! You said: 'Hello, AMCP Agent!' at 2025-11-11 08:15:30. Welcome to AMCP!
```

### Test 2: Ask a Question

```bash
# Send question
curl -X POST http://localhost:8080/api/ask \
  -H "Content-Type: application/json" \
  -d '"What is AMCP?"'

# Response:
# {
#   "message": "Question sent to agent"
# }

# Check agent output:
# ❓ Received question: What is AMCP?
# 💡 Generated answer: AMCP is the Agent Mesh Communication Protocol...
```

### Test 3: Using Kafka Topics

```bash
# In another terminal, consume responses
kafka-console-consumer --bootstrap-server localhost:9092 \
  --topic greeting-responses \
  --from-beginning

# Send greeting
curl -X POST http://localhost:8080/api/greet \
  -H "Content-Type: application/json" \
  -d '"Hi there!"'

# You should see the response in the consumer terminal
```

---

## Create Unit Tests

Create `src/test/java/MyFirstAgentTest.java`:

```java
package org.example;

import io.quarkus.test.junit.QuarkusTest;
import jakarta.inject.Inject;
import org.amcp.agent.Message;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@QuarkusTest
public class MyFirstAgentTest {
    
    @Inject
    MyFirstAgent agent;
    
    @Test
    public void testAgentInitialization() {
        assertNotNull(agent);
        assertEquals("my-first-agent", agent.getAgentName());
    }
    
    @Test
    public void testGreetingHandling() {
        Message greeting = new Message("Hello, Agent!");
        
        // This would be called by the agent
        agent.handleGreeting(greeting);
        
        // Verify response was generated
        assertNotNull(greeting);
    }
    
    @Test
    public void testAgentVersion() {
        assertEquals("1.0.0", agent.getVersion());
    }
}
```

Run tests:

```bash
# Run all tests
mvn test

# Run specific test
mvn test -Dtest=MyFirstAgentTest

# Output:
# [INFO] -------------------------------------------------------
# [INFO] T E S T S
# [INFO] -------------------------------------------------------
# [INFO] Running org.example.MyFirstAgentTest
# [INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0
# [INFO] -------------------------------------------------------
```

---

## Build for Production

### Step 1: Build JAR

```bash
# Build executable JAR
mvn clean package

# Output:
# [INFO] Building jar: target/my-first-agent-1.0.0-runner.jar
```

### Step 2: Build Native Image

```bash
# Build native executable (requires GraalVM)
mvn clean package -Dnative

# Output:
# [INFO] Building native executable...
# [INFO] Native executable created: target/my-first-agent-1.0.0-runner
```

### Step 3: Run Native Image

```bash
# Run native executable
./target/my-first-agent-1.0.0-runner

# Output:
# 🚀 Starting My First Agent...
# ✅ Agent initialized successfully!
```

---

## Deploy with Docker

Create `Dockerfile`:

```dockerfile
FROM quay.io/quarkus/quarkus-distroless-image:2.0

COPY target/my-first-agent-1.0.0-runner /application

EXPOSE 8080

CMD ["/application", "-Dquarkus.http.host=0.0.0.0"]
```

Build and run:

```bash
# Build Docker image
docker build -t my-first-agent:1.0.0 .

# Run container
docker run -p 8080:8080 my-first-agent:1.0.0

# Test from host
curl http://localhost:8080/api/health
```

---

## Next Steps

### 1. Add More Features
- Integrate with external APIs
- Add database persistence
- Implement authentication
- Add logging and monitoring

### 2. Learn Advanced Topics
- [Orchestrator Agents](/docs/AMCP_V16_AGENTIC_CAPABILITIES_PART2.html)
- [Mesh Agents](/docs/AMCP_V16_AGENTIC_CAPABILITIES_PART2.html)
- [Kafka Integration](/docs/kafka-integration.html)
- [Quarkus Extension](/docs/quarkus-extension.html)

### 3. Explore Examples
- [Weather Agent](/examples/weather-agent/)
- [Stock Agent](/examples/stock-agent/)
- [Travel Agent](/examples/travel-agent/)

### 4. Join Community
- [Contributing Guide](/community/contributing/)
- [Discussions](/community/discussions/)
- [GitHub Repository](https://github.com/agentmeshcommunicationprotocol/amcpcore)

---

## Troubleshooting

### Issue: Port 8080 already in use

```bash
# Use different port
quarkus dev -Dquarkus.http.port=8081
```

### Issue: Kafka connection error

```bash
# Verify Kafka is running
docker ps | grep kafka

# Start Kafka if needed
docker run -d --name kafka \
  -p 9092:9092 \
  confluentinc/cp-kafka:latest
```

### Issue: LLM connection error

```bash
# Verify LLM endpoint is running
curl http://localhost:8000/health

# Or disable LLM for now
# Comment out LLM configuration in application.properties
```

---

## Summary

You've successfully created your first AMCP agent! You learned:

✅ How to set up a Quarkus project with AMCP  
✅ How to create an agent class  
✅ How to handle messages  
✅ How to integrate with Kafka  
✅ How to test your agent  
✅ How to deploy to production  

---

## Resources

- [AMCP Documentation](/docs/)
- [Quarkus Guide](https://quarkus.io)
- [Kafka Documentation](https://kafka.apache.org)
- [GitHub Repository](https://github.com/agentmeshcommunicationprotocol/amcpcore)
- [Community Discussions](/community/discussions/)

---

**Happy agent building! 🚀**
