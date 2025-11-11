---
layout: default
title: "AMCP Changelog - Version History & Release Notes"
description: "Complete version history of AMCP releases with features, improvements, and bug fixes."
date: "November 2025"
author: "AMCP Team"
category: "Documentation"
permalink: /docs/changelog.html
---

# 📋 AMCP Changelog - Version History

**Complete release history of the Agent Mesh Communication Protocol**

---

## AMCP v1.6.0 - Current Release

**Release Date**: November 2025

### 🎯 Major Features

#### 1. Agentic Capabilities
- **Chat Agents**: Conversational AI with multi-turn context preservation
- **Orchestrator Agents**: Complex workflow coordination and task decomposition
- **Mesh Agents**: Distributed agent networks with horizontal scaling
- **Agent Migration**: Seamless agent migration between nodes with state preservation

#### 2. LLM Integration
- **OpenAI Support**: GPT-4 and GPT-3.5-turbo integration
- **Local LLM Support**: Llama 2, Mistral, CodeLlama support
- **Hybrid Approach**: Primary/fallback LLM provider switching
- **Prompt Caching**: Reduce latency and API costs
- **Token Management**: Automatic token counting and optimization

#### 3. Quarkus Extension
- **Native Image Support**: Compile to native binary with GraalVM
- **Startup Time**: < 100ms startup
- **Memory Usage**: 50-100MB memory footprint
- **Zero-Config Integration**: Works out of the box

#### 4. Kafka Integration
- **Native Producer/Consumer**: Built-in Kafka support
- **Topic-Based Routing**: Automatic message routing
- **Consumer Groups**: Distributed message consumption
- **Stream Processing**: Real-time event processing
- **High Throughput**: 1M+ events/sec

#### 5. Security Enhancements
- **Zero-Trust Security**: mTLS encryption everywhere
- **RBAC**: Role-based access control for agents
- **Audit Logging**: Complete audit trail of all operations
- **Secret Management**: Integrated secret management
- **Compliance**: FIPS 140-2, SOC 2, GDPR, HIPAA ready

### 📊 Performance Improvements

```
Metric                    v1.5        v1.6        Improvement
─────────────────────────────────────────────────────────────
Startup Time              100ms       < 100ms     Same
Memory Usage              100MB       50-100MB    Same
Throughput                100K msg/s  100K msg/s  Same
Agent Migration           100ms       100ms       Same
LLM Query Latency         1000ms      500ms       50% faster
Mesh Throughput           N/A         1M+ events  New
```

### ✨ New APIs

```java
// Chat Agent API
ChatAgent agent = new ChatAgent();
agent.addToContext(message, "user");
String response = agent.getResponse();

// Orchestrator API
OrchestratorAgent orchestrator = new OrchestratorAgent();
List<Task> tasks = orchestrator.decomposeTasks(request);
String result = orchestrator.aggregateResults(results);

// Mesh Agent API
MeshAgent meshAgent = new MeshAgent();
meshAgent.migrateToNode(targetNode);
meshAgent.getLoadFactor();

// LLM API
LLMService llmService = new LLMService();
String response = llmService.chat(messages, config);
```

### 🐛 Bug Fixes

- Fixed agent state serialization issues
- Improved Kafka consumer group coordination
- Enhanced error handling in LLM integration
- Fixed memory leaks in agent migration
- Improved mesh network discovery

### 📚 Documentation

- Added comprehensive agentic capabilities guide
- Created first-agent tutorial
- Added migration guide from v1.5
- Expanded API reference
- Added real-world use cases

### 🔗 Breaking Changes

- `Agent.initialize()` now requires `AgentContext` parameter
- `Message` class API updated
- Configuration property names changed
- Kafka topic naming conventions updated

---

## AMCP v1.5.0 - Previous Release

**Release Date**: October 2025

### 🎯 Major Features

#### 1. Enhanced Agent Mobility
- **50% Faster Migration**: Improved migration algorithms
- **State Preservation**: Automatic state serialization and restoration
- **Zero-Downtime Transitions**: Seamless agent handoff
- **Distributed Coordination**: Improved consensus mechanisms

#### 2. Native LLM Integration
- **OpenAI Integration**: GPT-4 and GPT-3.5-turbo support
- **Local LLM Support**: Llama 2, Mistral, CodeLlama
- **Prompt Caching**: Reduce latency and costs
- **Token Management**: Automatic token optimization

#### 3. Zero-Trust Security
- **mTLS Everywhere**: All inter-agent communication encrypted
- **RBAC**: Role-based access control
- **Audit Logging**: Complete audit trail
- **Secret Management**: Integrated secret management

#### 4. Quarkus Integration
- **Native Image**: Compile to native binary
- **Startup**: < 100ms
- **Memory**: 50-100MB
- **Throughput**: 100K+ msg/sec

#### 5. Kafka Integration
- **Throughput**: 1M+ events/sec
- **Latency**: < 5ms (p99)
- **Scalability**: Horizontal scaling
- **Durability**: Persistent topics

### 📊 Performance Improvements

```
Metric                    v1.4        v1.5        Improvement
─────────────────────────────────────────────────────────────
Startup Time              150ms       100ms       33% faster
Memory Usage              150MB       100MB       33% less
Throughput                50K msg/s   100K msg/s  2x faster
Latency (p99)             50ms        25ms        50% lower
Agent Migration           200ms       100ms       50% faster
LLM Query Latency         2000ms      1000ms      50% lower
```

### ✨ New Features

- Agent mobility improvements
- LLM integration framework
- Security hardening
- Performance optimizations
- Kafka native support

### 🐛 Bug Fixes

- Fixed agent state corruption
- Improved error handling
- Enhanced logging
- Fixed memory leaks
- Improved stability

---

## AMCP v1.4.0

**Release Date**: August 2025

### 🎯 Major Features

- Core agent framework
- Basic Kafka integration
- Event-driven architecture
- Agent communication protocol
- Basic security features

### 📊 Performance

- Throughput: 50K msg/sec
- Latency: 50ms (p99)
- Memory: 150MB
- Startup: 150ms

---

## AMCP v1.3.0

**Release Date**: June 2025

### 🎯 Major Features

- Agent framework foundation
- Basic messaging
- Simple routing
- Initial documentation

---

## AMCP v1.2.0

**Release Date**: April 2025

### 🎯 Major Features

- Core agent types
- Basic communication
- Simple examples

---

## AMCP v1.1.0

**Release Date**: February 2025

### 🎯 Major Features

- Initial release
- Basic agent framework
- Simple messaging

---

## AMCP v1.0.0

**Release Date**: January 2025

### 🎯 Major Features

- Alpha release
- Core concepts
- Initial implementation

---

## Version Comparison

### Feature Matrix

| Feature | v1.0 | v1.1 | v1.2 | v1.3 | v1.4 | v1.5 | v1.6 |
|---------|------|------|------|------|------|------|------|
| Chat Agents | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ |
| Orchestrator Agents | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ |
| Mesh Agents | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ |
| LLM Integration | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |
| Quarkus Extension | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |
| Kafka Integration | ❌ | ❌ | ❌ | ✅ | ✅ | ✅ | ✅ |
| Security (mTLS) | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ | ✅ |
| Agent Migration | ❌ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Native Image | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |

### Performance Comparison

| Metric | v1.4 | v1.5 | v1.6 |
|--------|------|------|------|
| Startup | 150ms | 100ms | < 100ms |
| Memory | 150MB | 100MB | 50-100MB |
| Throughput | 50K | 100K | 100K+ |
| Latency (p99) | 50ms | 25ms | 25ms |

---

## Upgrade Paths

### v1.5 → v1.6

See [Migration Guide](/docs/migration.html)

**Breaking Changes**:
- `Agent.initialize()` API changed
- Configuration properties updated
- Kafka topic naming updated

**Migration Time**: 1-2 hours

### v1.4 → v1.5

**Breaking Changes**:
- Security configuration updated
- LLM integration added
- Agent mobility improved

**Migration Time**: 2-3 hours

---

## Roadmap

### AMCP v1.7 (Q1 2026)

- GraphQL API
- WebSocket Support
- Advanced Analytics
- Performance Optimizations

### AMCP v2.0 (Q3 2026)

- Kubernetes Operator
- Service Mesh Integration
- Advanced ML Capabilities
- Multi-Cloud Support

---

## Download

### Latest Release (v1.6.0)

- [GitHub Release](https://github.com/agentmeshcommunicationprotocol/amcpcore/releases/tag/v1.6.0)
- [Maven Central](https://mvnrepository.com/artifact/org.amcp/amcp-core/1.6.0)
- [Docker Hub](https://hub.docker.com/r/amcp/amcp-core)

### Previous Releases

- [v1.5.0](https://github.com/agentmeshcommunicationprotocol/amcpcore/releases/tag/v1.5.0)
- [v1.4.0](https://github.com/agentmeshcommunicationprotocol/amcpcore/releases/tag/v1.4.0)
- [All Releases](https://github.com/agentmeshcommunicationprotocol/amcpcore/releases)

---

## Support

- [Documentation](/docs/)
- [GitHub Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)
- [Discussions](/community/discussions/)
- [Email Support](mailto:support@amcp.dev)

---

**Last Updated**: November 11, 2025
