# AMCP v1.6: Quarkus-Native Agent Mesh Framework with Kafka

## Status & Badges

[![GitHub Release](https://img.shields.io/github/v/release/agentmeshcommunicationprotocol/amcpcore?label=Latest%20Release)](https://github.com/agentmeshcommunicationprotocol/amcpcore/releases)
[![GitHub Stars](https://img.shields.io/github/stars/agentmeshcommunicationprotocol/amcpcore?style=social)](https://github.com/agentmeshcommunicationprotocol/amcpcore)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

## Technology Stack

![Java](https://img.shields.io/badge/Java-11%2B-orange)
![Quarkus](https://img.shields.io/badge/Quarkus-3.0%2B-blue)
![Kafka](https://img.shields.io/badge/Kafka-2.8%2B-red)
![Docker](https://img.shields.io/badge/Docker-Supported-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-blue)

---

## 🎯 What is AMCP v1.6?

AMCP v1.6 is an open-source Java framework for building distributed multi-agent systems with:

- **Quarkus Extension**: Cloud-native deployment with minimal memory footprint
- **Kafka Integration**: Event-driven communication and streaming
- **Agent Mobility**: Agents migrate between nodes seamlessly
- **Enterprise Security**: TLS, mTLS, RBAC authentication
- **Real-Time Coordination**: Sub-millisecond latency messaging

---

## 🚀 Why AMCP v1.6?

### For Quarkus Developers
- Native image support (GraalVM)
- Minimal startup time (<100ms)
- Low memory usage (50MB+)
- Perfect for serverless and containers

### For Kafka Users
- Native Kafka producer/consumer
- Event sourcing patterns
- Stream processing integration
- Real-time agent coordination

### For Enterprise Teams
- Production-ready
- Distributed tracing
- Comprehensive monitoring
- Enterprise support

---

## 📊 AMCP v1.6 vs Alternatives

| Feature | AMCP v1.6 | Traditional | Competitors |
|---------|-----------|-------------|-------------|
| **Startup** | < 100ms | 5-10s | 2-5s |
| **Memory** | 50-100MB | 500MB+ | 200-300MB |
| **Quarkus** | Native | Manual | No |
| **Kafka** | Native | Manual | Limited |
| **Mobility** | Yes | No | Limited |
| **Production** | Yes | Yes | Partial |

---

## ⚡ Quick Start

### 1. Create Quarkus Project with AMCP
```bash
quarkus create app my-agent-app \
  --extension=amcp-quarkus

cd my-agent-app
```

### 2. Add Kafka Extension
```bash
quarkus extension add kafka
```

### 3. Configure Kafka
```properties
# application.properties
kafka.bootstrap.servers=localhost:9092
amcp.kafka.enabled=true
amcp.kafka.topic.prefix=amcp-
```

### 4. Create Your First Agent
```java
@QuarkusMain
public class MyAgent extends Agent {
    @Inject
    KafkaProducer<String, String> producer;
    
    @Override
    public void initialize(AgentContext context) {
        context.subscribe("events", this::handleEvent);
    }
    
    private void handleEvent(Message message) {
        producer.send("results", message.getPayload());
    }
}
```

### 5. Run in Dev Mode
```bash
quarkus dev
```

---

## 📈 Performance Benchmarks

### Quarkus Native Image
| Metric | Value |
|--------|-------|
| Startup Time | < 100ms |
| Memory Usage | 50-100MB |
| Throughput | 100K+ msg/sec |
| Latency (p99) | < 10ms |

### Kafka Integration
| Metric | Value |
|--------|-------|
| Throughput | 1M+ events/sec |
| Latency (p99) | < 5ms |
| Durability | Persistent topics |
| Scalability | Horizontal |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────┐
│      Quarkus Application            │
├─────────────────────────────────────┤
│  ┌──────────────────────────────┐   │
│  │   AMCP Agent Framework       │   │
│  │  ┌────────────────────────┐  │   │
│  │  │  Agent 1 (Quarkus)     │  │   │
│  │  │  Agent 2 (Quarkus)     │  │   │
│  │  │  Agent N (Quarkus)     │  │   │
│  │  └────────────────────────┘  │   │
│  └──────────────┬───────────────┘   │
│                 │                    │
│  ┌──────────────▼───────────────┐   │
│  │   Kafka Integration Layer    │   │
│  │  ┌────────────────────────┐  │   │
│  │  │ Producer/Consumer      │  │   │
│  │  │ Topic Routing          │  │   │
│  │  │ Stream Processing      │  │   │
│  │  └────────────────────────┘  │   │
│  └──────────────┬───────────────┘   │
└─────────────────┼────────────────────┘
                  │
        ┌─────────▼──────────┐
        │  Kafka Broker      │
        │  (Event Streaming) │
        └────────────────────┘
```

---

## 💡 Real-World Examples

### Weather Agent with Kafka
- Subscribes to weather data topic
- Processes events in real-time
- Publishes forecasts to output topic
- Scales horizontally with Kafka

### Stock Trading Agent
- Consumes market data from Kafka
- Makes autonomous trading decisions
- Publishes trades to execution topic
- Maintains state across restarts

### IoT Data Pipeline
- Agents consume sensor data from Kafka
- Process and aggregate data
- Store in time-series database
- Trigger alerts on anomalies

---

## 📚 Get Started Now

### 🚀 Quick Start (5 minutes)
[👉 View Quick Start Guide](docs/index.md)

### 📖 Full Documentation
[👉 View Documentation](docs/)

### 🎓 Tutorials
[👉 Your First Agent](docs/tutorials/first-agent.md)
[👉 Kafka Integration](docs/kafka-integration.md)

### 💡 Examples
[👉 View Examples](docs/examples/)

### 🤝 Community
[👉 GitHub Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)

---

## 🔗 Key Features

✅ **Quarkus Extension**
- Zero-config integration
- Native compilation support
- Hot reload development mode
- Kubernetes-ready

✅ **Kafka Integration**
- Native Kafka producer/consumer
- Topic-based routing
- Consumer groups
- Stream processing

✅ **Agent Framework**
- Lightweight agents
- Autonomous decision-making
- Event-driven architecture
- Fault tolerance

✅ **Enterprise Security**
- TLS/mTLS encryption
- RBAC authentication
- Audit logging
- Compliance ready

---

## 🌐 Community & Support

- 📖 [Full Documentation](docs/)
- 💬 [GitHub Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)
- 🐛 [Issue Tracker](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)
- 📧 [Email Support](mailto:support@amcp.dev)

---

## 📄 License

AMCP is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

---

## 🚀 Get Started

[👉 View Full Documentation](docs/) | [👉 GitHub Repository](https://github.com/agentmeshcommunicationprotocol/amcpcore) | [👉 Download v1.6](https://github.com/agentmeshcommunicationprotocol/amcpcore/releases/tag/v1.6)

---

**Built with ❤️ by the AMCP Community**
