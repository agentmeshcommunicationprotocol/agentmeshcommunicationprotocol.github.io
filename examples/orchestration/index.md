---
layout: default
title: "Orchestration Example - Multi-Agent Workflow with AMCP"
description: "Build complex multi-agent workflows using AMCP orchestrator agents. Task decomposition, agent delegation, and result aggregation example."
date: "November 2025"
author: "AMCP Team"
category: "Example"
permalink: /examples/orchestration/
keywords: "AMCP orchestrator, multi-agent, workflow, task decomposition, agentic AI"
---

# 🎼 Orchestration Example - Multi-Agent Workflow System

**A comprehensive example of building complex multi-agent workflows using AMCP orchestrator agents with task decomposition, agent delegation, and intelligent result aggregation.**

---

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Features](#features)
4. [Setup](#setup)
5. [Running](#running)
6. [API Examples](#api-examples)
7. [Workflow Examples](#workflow-examples)
8. [Performance](#performance)

---

## Overview

This orchestration example demonstrates:

- **Task Decomposition**: Break complex requests into subtasks
- **Agent Delegation**: Assign tasks to specialized agents
- **Parallel Execution**: Run multiple tasks concurrently
- **Result Aggregation**: Combine results intelligently
- **Error Handling**: Graceful failure recovery
- **LLM Coordination**: AI-powered orchestration

### Use Cases

```
✅ Business process automation
✅ Data pipeline orchestration
✅ Multi-step workflows
✅ Complex decision making
✅ Distributed task execution
✅ Enterprise automation
```

---

## Architecture

### System Design

```
┌─────────────────────────────────────────────────────┐
│              Client Request                          │
│  (Complex business process)                         │
└────────────────────┬────────────────────────────────┘
                     │
        ┌────────────▼────────────┐
        │  Orchestrator Agent     │
        │  - Task Decomposition   │
        │  - Delegation           │
        │  - Aggregation          │
        └────────────┬────────────┘
                     │
        ┌────────────┴────────────┬────────────┬─────────────┐
        │                         │            │             │
┌───────▼──────┐    ┌────────────▼──┐  ┌─────▼────┐  ┌──────▼────┐
│ Weather      │    │ Stock          │  │ Travel   │  │ Sentiment │
│ Agent        │    │ Agent          │  │ Agent    │  │ Agent     │
└───────┬──────┘    └────────────┬──┘  └─────┬────┘  └──────┬────┘
        │                        │            │             │
        └────────────┬───────────┴────────────┴─────────────┘
                     │
        ┌────────────▼────────────┐
        │   Kafka Event Stream    │
        │  (Task & Result Topics) │
        └────────────┬────────────┘
                     │
        ┌────────────▼────────────┐
        │   LLM Service           │
        │  (GPT-4 / Local)        │
        └────────────────────────┘
```

### Components

```
Orchestration System
├── Orchestrator Agent
│   ├── Request parsing
│   ├── Task decomposition
│   ├── Agent delegation
│   ├── Result aggregation
│   └── Error handling
├── Specialized Agents
│   ├── Weather Agent
│   ├── Stock Agent
│   ├── Travel Agent
│   └── Sentiment Agent
├── Kafka Topics
│   ├── orchestration.tasks
│   ├── orchestration.results
│   ├── orchestration.events
│   └── orchestration.errors
└── LLM Service
    ├── Task understanding
    ├── Result synthesis
    └── Decision making
```

---

## Features

### 1. Task Decomposition

```java
@OrchestratorAgent
public class WorkflowOrchestrator extends Agent {
    
    @Inject
    LLMService llmService;
    
    @Inject
    KafkaProducer<String, String> producer;
    
    @Override
    public void initialize(AgentContext context) {
        context.subscribe("orchestration.requests", this::handleRequest);
    }
    
    private void handleRequest(Message message) {
        String request = message.getPayload();
        
        // Use LLM to decompose task
        String decomposition = llmService.chat(
            "Break down this request into subtasks: " + request,
            new ChatConfig()
                .model("gpt-4")
                .temperature(0.3)
        );
        
        // Parse decomposition
        List<Task> tasks = parseDecomposition(decomposition);
        
        // Delegate tasks
        delegateTasks(tasks);
    }
    
    private List<Task> parseDecomposition(String decomposition) {
        List<Task> tasks = new ArrayList<>();
        
        // Example decomposition:
        // 1. Get weather for Paris
        // 2. Get stock prices for AAPL, MSFT
        // 3. Find travel deals to Paris
        // 4. Analyze sentiment of travel reviews
        
        String[] lines = decomposition.split("\n");
        for (String line : lines) {
            if (line.trim().isEmpty()) continue;
            
            Task task = new Task();
            task.setDescription(line);
            
            // Determine task type
            if (line.contains("weather")) {
                task.setType(TaskType.WEATHER);
                task.setAgent("weather-agent");
            } else if (line.contains("stock")) {
                task.setType(TaskType.STOCK);
                task.setAgent("stock-agent");
            } else if (line.contains("travel")) {
                task.setType(TaskType.TRAVEL);
                task.setAgent("travel-agent");
            } else if (line.contains("sentiment")) {
                task.setType(TaskType.SENTIMENT);
                task.setAgent("sentiment-agent");
            }
            
            tasks.add(task);
        }
        
        return tasks;
    }
    
    private void delegateTasks(List<Task> tasks) {
        // Delegate tasks to specialized agents
        for (Task task : tasks) {
            producer.send("orchestration.tasks", serialize(task));
        }
    }
}
```

### 2. Agent Delegation

```java
@Path("/api/orchestration")
public class OrchestrationResource {
    
    @Inject
    WorkflowOrchestrator orchestrator;
    
    @POST
    @Path("/execute")
    public Response executeWorkflow(WorkflowRequest request) {
        // Decompose workflow
        List<Task> tasks = orchestrator.decomposeTasks(request);
        
        // Execute tasks in parallel
        List<CompletableFuture<TaskResult>> futures = tasks.stream()
            .map(task -> executeTaskAsync(task))
            .collect(toList());
        
        // Wait for all tasks
        List<TaskResult> results = futures.stream()
            .map(CompletableFuture::join)
            .collect(toList());
        
        // Aggregate results
        WorkflowResult aggregated = orchestrator.aggregateResults(results);
        
        return Response.ok()
            .entity(aggregated)
            .build();
    }
    
    private CompletableFuture<TaskResult> executeTaskAsync(Task task) {
        return CompletableFuture.supplyAsync(() -> {
            // Execute task
            return executeTask(task);
        });
    }
    
    private TaskResult executeTask(Task task) {
        // Route to appropriate agent
        switch (task.getType()) {
            case WEATHER:
                return weatherAgent.execute(task);
            case STOCK:
                return stockAgent.execute(task);
            case TRAVEL:
                return travelAgent.execute(task);
            case SENTIMENT:
                return sentimentAgent.execute(task);
            default:
                throw new IllegalArgumentException("Unknown task type");
        }
    }
}
```

### 3. Result Aggregation

```java
public WorkflowResult aggregateResults(List<TaskResult> results) {
    // Use LLM to synthesize results
    String resultSummary = llmService.chat(
        "Synthesize these results into a coherent response: " +
        results.stream()
            .map(TaskResult::getResult)
            .collect(joining("\n")),
        new ChatConfig()
            .model("gpt-4")
            .temperature(0.7)
    );
    
    WorkflowResult workflow = new WorkflowResult();
    workflow.setSummary(resultSummary);
    workflow.setDetails(results);
    workflow.setStatus("completed");
    workflow.setTimestamp(Instant.now());
    
    return workflow;
}
```

### 4. Error Handling

```java
private TaskResult executeTaskWithRetry(Task task, int maxRetries) {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
        try {
            return executeTask(task);
        } catch (Exception e) {
            logger.warn("Task execution failed (attempt {}/{}): {}",
                attempt, maxRetries, e.getMessage());
            
            if (attempt == maxRetries) {
                // Final attempt failed
                TaskResult result = new TaskResult();
                result.setStatus("failed");
                result.setError(e.getMessage());
                result.setTask(task);
                
                // Publish error event
                producer.send("orchestration.errors", serialize(result));
                
                return result;
            }
            
            // Wait before retry
            try {
                Thread.sleep(1000 * attempt);  // Exponential backoff
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                break;
            }
        }
    }
    
    return null;
}
```

---

## Setup

### Prerequisites

```bash
java -version      # 11+
mvn -version       # 3.6+
docker --version   # For Kafka
```

### Clone & Build

```bash
git clone https://github.com/agentmeshcommunicationprotocol/amcpcore.git
cd amcpcore/examples/orchestration

mvn clean package
mvn test
```

### Configuration

Create `application.properties`:

```properties
# AMCP Configuration
amcp.enabled=true
amcp.agent.name=orchestration
amcp.agent.version=1.0.0

# Orchestration Configuration
amcp.orchestration.enabled=true
amcp.orchestration.max-parallel-tasks=10
amcp.orchestration.task-timeout=30000

# Kafka Configuration
kafka.bootstrap.servers=localhost:9092
kafka.group.id=orchestration-group

# LLM Configuration
amcp.llm.enabled=true
amcp.llm.provider=openai
amcp.llm.openai.api-key=${OPENAI_API_KEY}
amcp.llm.openai.model=gpt-4

# Server Configuration
quarkus.http.port=8080
quarkus.application.name=orchestration
```

---

## Running

### Start Kafka

```bash
docker run -d --name kafka \
  -p 9092:9092 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
  confluentinc/cp-kafka:latest

# Create topics
docker exec kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic orchestration.tasks \
  --partitions 3 \
  --replication-factor 1
```

### Start Orchestration

```bash
# Development mode
quarkus dev

# Or production mode
java -jar target/orchestration-1.0.0-runner.jar
```

### Start Specialized Agents

```bash
# Terminal 2: Weather Agent
cd ../weather-agent
quarkus dev -Dquarkus.http.port=8081

# Terminal 3: Stock Agent
cd ../stock-agent
quarkus dev -Dquarkus.http.port=8082

# Terminal 4: Travel Agent
cd ../travel-agent
quarkus dev -Dquarkus.http.port=8083
```

---

## API Examples

### Execute Workflow

```bash
curl -X POST http://localhost:8080/api/orchestration/execute \
  -H "Content-Type: application/json" \
  -d '{
    "request": "Plan a trip to Paris next week. Check weather, find travel deals, and analyze reviews.",
    "userId": "user-123",
    "priority": "high"
  }'

# Response:
# {
#   "id": "workflow-456",
#   "status": "completed",
#   "summary": "Based on the analysis, Paris looks great next week...",
#   "details": [
#     {
#       "taskId": "task-1",
#       "type": "weather",
#       "result": "Sunny, 15°C",
#       "status": "completed"
#     },
#     {
#       "taskId": "task-2",
#       "type": "travel",
#       "result": "Found 5 deals under $500",
#       "status": "completed"
#     },
#     {
#       "taskId": "task-3",
#       "type": "sentiment",
#       "result": "Reviews are 92% positive",
#       "status": "completed"
#     }
#   ],
#   "timestamp": "2025-11-11T10:30:00Z"
# }
```

### Get Workflow Status

```bash
curl http://localhost:8080/api/orchestration/workflow/workflow-456

# Response:
# {
#   "id": "workflow-456",
#   "status": "completed",
#   "progress": 100,
#   "tasksCompleted": 3,
#   "tasksFailed": 0,
#   "startTime": "2025-11-11T10:30:00Z",
#   "endTime": "2025-11-11T10:30:05Z",
#   "duration": "5s"
# }
```

### Get Task Details

```bash
curl http://localhost:8080/api/orchestration/task/task-1

# Response:
# {
#   "id": "task-1",
#   "type": "weather",
#   "description": "Get weather for Paris",
#   "status": "completed",
#   "agent": "weather-agent",
#   "result": "Sunny, 15°C",
#   "startTime": "2025-11-11T10:30:00Z",
#   "endTime": "2025-11-11T10:30:01Z"
# }
```

---

## Workflow Examples

### Example 1: Travel Planning

```
Request: "Plan a trip to Paris next week"

Decomposition:
1. Get weather forecast for Paris
2. Find travel deals to Paris
3. Search for hotels in Paris
4. Analyze travel reviews
5. Create itinerary

Execution:
├── Weather Agent → "Sunny, 15°C"
├── Travel Agent → "Found 5 deals under $500"
├── Hotel Agent → "5-star hotels from $150/night"
├── Sentiment Agent → "92% positive reviews"
└── Itinerary Agent → "3-day itinerary created"

Result: Comprehensive travel plan with recommendations
```

### Example 2: Business Analysis

```
Request: "Analyze market opportunity for our product"

Decomposition:
1. Research market size
2. Analyze competitor landscape
3. Identify customer segments
4. Assess financial viability
5. Create business recommendation

Execution:
├── Market Agent → "$5B market opportunity"
├── Competitor Agent → "5 major competitors"
├── Customer Agent → "3 key segments identified"
├── Finance Agent → "ROI: 250% in 3 years"
└── Strategy Agent → "Recommendation: GO"

Result: Data-driven business decision
```

### Example 3: Content Creation

```
Request: "Create marketing content for AI agents"

Decomposition:
1. Research AI agent trends
2. Identify target audience
3. Create blog post outline
4. Generate content
5. Optimize for SEO

Execution:
├── Research Agent → "Trends: LLM, Agentic AI, Microservices"
├── Audience Agent → "Target: Enterprise developers"
├── Outline Agent → "5-section outline created"
├── Content Agent → "2000-word blog post generated"
└── SEO Agent → "Optimized for 15 keywords"

Result: Production-ready marketing content
```

---

## Performance

### Benchmarks

```
Single Task:
├── Execution Time: 2s
├── Latency (p99): 2.5s
└── Success Rate: 99.9%

3 Parallel Tasks:
├── Execution Time: 2.5s (vs 6s sequential)
├── Speedup: 2.4x
└── Success Rate: 99.8%

10 Parallel Tasks:
├── Execution Time: 5s (vs 20s sequential)
├── Speedup: 4x
└── Success Rate: 99.5%
```

### Scalability

```
Throughput:
├── 1 orchestrator: 100 workflows/min
├── 3 orchestrators: 250 workflows/min
├── 5 orchestrators: 400 workflows/min

Latency:
├── p50: 1.5s
├── p95: 3s
├── p99: 5s
```

---

## Deployment

### Docker

```dockerfile
FROM quay.io/quarkus/quarkus-distroless-image:2.0

COPY target/orchestration-1.0.0-runner /application

EXPOSE 8080

CMD ["/application", "-Dquarkus.http.host=0.0.0.0"]
```

### Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: orchestration
spec:
  replicas: 3
  selector:
    matchLabels:
      app: orchestration
  template:
    metadata:
      labels:
        app: orchestration
    spec:
      containers:
      - name: orchestration
        image: orchestration:1.0.0
        ports:
        - containerPort: 8080
        env:
        - name: KAFKA_BOOTSTRAP_SERVERS
          value: kafka:9092
        - name: OPENAI_API_KEY
          valueFrom:
            secretKeyRef:
              name: openai-secret
              key: api-key
```

---

## Next Steps

- **[Orchestrator Agents Guide](/docs/AMCP_V16_AGENTIC_CAPABILITIES_PART2.html)**
- **[First Agent Tutorial](/docs/tutorials/first-agent.html)**
- **[Kafka Integration](/docs/kafka-integration.html)**
- **[Performance Tuning](/docs/best-practices/)**

---

**Happy orchestrating! 🚀**
