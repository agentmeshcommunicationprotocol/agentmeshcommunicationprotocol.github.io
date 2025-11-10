---
layout: default
title: "AMCP Quarkus Extension"
description: "Cloud-native agents with Quarkus"
---

# AMCP Quarkus Extension

## Features

✅ Zero-config integration
✅ Native image support
✅ Hot reload development
✅ Kubernetes-ready

## Installation

```bash
quarkus extension add amcp-quarkus
```

## Configuration

```properties
amcp.enabled=true
amcp.agent.pool.size=10
```

## Creating Agents

```java
@QuarkusMain
public class MyAgent extends Agent {
    @Override
    public void initialize(AgentContext context) {
        context.subscribe("events", this::handleEvent);
    }
    
    private void handleEvent(Message message) {
        System.out.println("Event: " + message);
    }
}
```

## Performance

- Startup: < 100ms
- Memory: 50-100MB
- Throughput: 100K+ msg/sec

[👈 Back to Home](index.md)
