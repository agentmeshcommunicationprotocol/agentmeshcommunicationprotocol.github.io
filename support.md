---
layout: default
title: "AMCP Support & Resources - Help for Agentic AI Development"
description: "Get support for AMCP. Find documentation, tutorials, troubleshooting guides, and community help for building agentic AI systems."
date: "November 2025"
author: "AMCP Team"
category: "Support"
permalink: /support/
keywords: "AMCP support, help, troubleshooting, agentic AI, LLM, microservices"
---

# 🆘 AMCP Support & Resources

**Find help, troubleshoot issues, and learn how to build amazing agentic systems with AMCP.**

---

## Table of Contents

1. [Getting Help](#getting-help)
2. [Documentation](#documentation)
3. [Troubleshooting](#troubleshooting)
4. [Common Issues](#common-issues)
5. [Performance Tips](#performance-tips)
6. [Security & Best Practices](#security--best-practices)
7. [Community Resources](#community-resources)

---

## Getting Help

### Quick Links

| Need | Resource | Time |
|------|----------|------|
| **Getting Started** | [First Agent Tutorial](/docs/tutorials/first-agent.html) | 5 min |
| **API Reference** | [API Documentation](/docs/api-reference/) | 10 min |
| **Examples** | [Example Applications](/examples/) | 15 min |
| **Troubleshooting** | [Troubleshooting Guide](#troubleshooting) | 10 min |
| **Ask Questions** | [GitHub Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions) | 24 hours |
| **Report Bugs** | [GitHub Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues) | 48 hours |

### Support Channels

```
📚 Documentation     → https://agentmeshcommunicationprotocol.github.io/docs/
💬 Discussions       → https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions
🐛 Bug Reports       → https://github.com/agentmeshcommunicationprotocol/amcpcore/issues
📧 Email Support     → support@amcp.dev
🐦 Twitter           → @amcp_framework
💻 Stack Overflow    → tag: amcp
```

---

## Documentation

### Core Documentation

#### Getting Started

- **[Installation Guide](/docs/installation/)** - Set up AMCP
- **[First Agent Tutorial](/docs/tutorials/first-agent.html)** - Build your first agent
- **[Quick Start](/docs/getting-started/)** - 5-minute quickstart

#### Guides & Tutorials

- **[Agentic Capabilities Guide](/docs/AMCP_V16_AGENTIC_CAPABILITIES_PART1.html)** - Chat, Orchestrator, Mesh agents
- **[LLM Integration](/docs/AMCP_V16_AGENTIC_CAPABILITIES_PART1.html)** - OpenAI, local models, hybrid
- **[Kafka Integration](/docs/kafka-integration.html)** - Event streaming
- **[Quarkus Extension](/docs/quarkus-extension.html)** - Native compilation

#### Reference

- **[API Reference](/docs/api-reference/)** - Complete API documentation
- **[Architecture](/docs/architecture/)** - System design and concepts
- **[Best Practices](/docs/best-practices/)** - Performance and security tips
- **[Changelog](/docs/changelog.html)** - Version history

#### Migration & Upgrade

- **[Migration Guide](/docs/migration.html)** - Upgrade from v1.5 to v1.6
- **[Breaking Changes](/docs/migration.html)** - What changed

### Example Applications

```
📦 Weather Agent       → /examples/weather-agent/
📦 Stock Agent         → /examples/stock-agent/
📦 Travel Agent        → /examples/travel-agent/
📦 More Examples       → /examples/
```

---

## Troubleshooting

### Common Problems & Solutions

#### 1. Build Issues

**Problem**: Maven build fails

```bash
# Solution 1: Clean build
mvn clean install

# Solution 2: Update dependencies
mvn dependency:resolve

# Solution 3: Check Java version
java -version  # Should be 11+

# Solution 4: Clear Maven cache
rm -rf ~/.m2/repository
mvn clean install
```

#### 2. Startup Issues

**Problem**: Agent fails to start

```bash
# Check logs
quarkus dev

# Common causes:
# - Port already in use
# - Kafka not running
# - LLM endpoint not available
# - Configuration error

# Solutions:
# Use different port
quarkus dev -Dquarkus.http.port=8081

# Start Kafka
docker run -d --name kafka -p 9092:9092 confluentinc/cp-kafka:latest

# Disable LLM if not needed
# In application.properties:
# amcp.llm.enabled=false
```

#### 3. Kafka Connection Issues

**Problem**: Cannot connect to Kafka

```bash
# Check Kafka is running
docker ps | grep kafka

# Check bootstrap servers
# In application.properties:
kafka.bootstrap.servers=localhost:9092

# Test connection
kafka-broker-api-versions --bootstrap-server localhost:9092

# If using Docker:
docker run -d --name kafka \
  -p 9092:9092 \
  confluentinc/cp-kafka:latest
```

#### 4. LLM Connection Issues

**Problem**: Cannot connect to LLM endpoint

```bash
# Check endpoint is running
curl http://localhost:8000/health

# Verify configuration
# In application.properties:
amcp.llm.provider=local
amcp.llm.local.endpoint=http://localhost:8000

# Test with curl
curl -X POST http://localhost:8000/chat \
  -d '{"message": "Hello"}'

# If using OpenAI:
# Check API key is set
echo $OPENAI_API_KEY

# If using local LLM:
# Start Ollama or similar
ollama serve
```

#### 5. Memory Issues

**Problem**: Out of memory errors

```bash
# Increase heap size
export JAVA_OPTS="-Xmx512m"
quarkus dev

# Or in Maven
mvn quarkus:dev -Dquarkus.jvm.java-opts="-Xmx512m"

# Check memory usage
jps -l
jmap -heap <pid>
```

#### 6. Performance Issues

**Problem**: Slow response times

```bash
# Enable debug logging
# In application.properties:
quarkus.log.level=DEBUG

# Check latency
# Use performance monitoring tools
# Review Best Practices guide

# Common causes:
# - LLM latency (1000ms+)
# - Kafka latency
# - Network issues
# - Resource constraints
```

---

## Common Issues

### Issue 1: "Port 8080 already in use"

**Error**:
```
Address already in use: bind
```

**Solution**:
```bash
# Option 1: Use different port
quarkus dev -Dquarkus.http.port=8081

# Option 2: Kill process using port
lsof -i :8080
kill -9 <PID>

# Option 3: Check what's using the port
netstat -tlnp | grep 8080
```

### Issue 2: "Cannot find Kafka broker"

**Error**:
```
org.apache.kafka.common.errors.TimeoutException
```

**Solution**:
```bash
# Start Kafka
docker run -d --name kafka \
  -p 9092:9092 \
  confluentinc/cp-kafka:latest

# Or verify it's running
docker ps | grep kafka

# Check bootstrap servers in config
# kafka.bootstrap.servers=localhost:9092
```

### Issue 3: "LLM API key not found"

**Error**:
```
OpenAI API key not configured
```

**Solution**:
```bash
# Set environment variable
export OPENAI_API_KEY="your-key-here"

# Or in application.properties
amcp.llm.openai.api-key=your-key-here

# Or use system property
-Damcp.llm.openai.api-key=your-key-here
```

### Issue 4: "Agent initialization failed"

**Error**:
```
AgentContext not found
```

**Solution**:
```java
// Ensure initialize method has context parameter
@Override
public void initialize(AgentContext context) {  // ✅ Correct
    context.subscribe("topic", this::handleMessage);
}

// Not like this:
@Override
public void initialize() {  // ❌ Wrong
    this.subscribe("topic", this::handleMessage);
}
```

### Issue 5: "Tests failing"

**Error**:
```
Test failed: Expected X but got Y
```

**Solution**:
```bash
# Run tests with verbose output
mvn test -X

# Run specific test
mvn test -Dtest=MyAgentTest

# Run with coverage
mvn test jacoco:report

# Check test logs
cat target/surefire-reports/
```

---

## Performance Tips

### 1. Optimize LLM Calls

```java
// ✅ Good: Cache responses
@Cacheable(value = "llm-responses")
public String chat(String message) {
    return llmService.chat(message, config);
}

// ✅ Good: Use prompt caching
ChatConfig config = new ChatConfig()
    .cachePrompt(true)
    .temperature(0.7);

// ❌ Avoid: Repeated calls for same input
for (int i = 0; i < 100; i++) {
    llmService.chat("same message", config);  // Wasteful
}
```

### 2. Optimize Kafka Usage

```java
// ✅ Good: Batch messages
List<String> batch = new ArrayList<>();
for (Message msg : messages) {
    batch.add(msg.getPayload());
    if (batch.size() >= 100) {
        producer.sendBatch(topic, batch);
        batch.clear();
    }
}

// ✅ Good: Use async sending
producer.sendAsync(topic, message, callback);

// ❌ Avoid: Synchronous calls in loop
for (Message msg : messages) {
    producer.send(topic, msg);  // Blocks on each send
}
```

### 3. Optimize Memory

```java
// ✅ Good: Use object pooling
ObjectPool<Message> pool = new ObjectPool<>(Message::new);
Message msg = pool.acquire();
// Use message
pool.release(msg);

// ✅ Good: Stream large datasets
Stream<Message> messages = getMessages();
messages.forEach(this::process);

// ❌ Avoid: Loading all in memory
List<Message> all = getMessages().collect(toList());  // OOM risk
```

### 4. Optimize Queries

```java
// ✅ Good: Use filtering
agents.stream()
    .filter(a -> a.getStatus() == ACTIVE)
    .map(Agent::getName)
    .collect(toList());

// ✅ Good: Use pagination
List<Agent> page = agents.stream()
    .skip((pageNum - 1) * pageSize)
    .limit(pageSize)
    .collect(toList());

// ❌ Avoid: Processing all data
agents.stream()
    .map(Agent::getName)
    .collect(toList());  // Processes everything
```

### 5. Optimize Logging

```java
// ✅ Good: Use appropriate levels
logger.debug("Processing message: {}", message);  // Debug level
logger.info("Agent started: {}", agentName);      // Info level
logger.warn("Retry attempt {}", attempt);         // Warning level
logger.error("Error occurred", exception);        // Error level

// ✅ Good: Use lazy evaluation
logger.debug("Details: {}", () -> expensiveOperation());

// ❌ Avoid: String concatenation
logger.debug("Processing: " + message);  // Always evaluated
```

---

## Security & Best Practices

### Security Checklist

- [ ] Enable mTLS encryption
- [ ] Use strong API keys
- [ ] Implement RBAC
- [ ] Enable audit logging
- [ ] Use secrets management
- [ ] Validate inputs
- [ ] Sanitize outputs
- [ ] Keep dependencies updated
- [ ] Use HTTPS only
- [ ] Implement rate limiting

### Security Configuration

```properties
# Enable mTLS
amcp.security.mtls.enabled=true
amcp.security.mtls.cert-path=/path/to/cert.pem
amcp.security.mtls.key-path=/path/to/key.pem

# Enable RBAC
amcp.security.rbac.enabled=true

# Enable audit logging
amcp.security.audit.enabled=true
amcp.security.audit.log-path=/var/log/amcp/audit.log

# Use secrets
amcp.llm.openai.api-key=${OPENAI_API_KEY}
```

### Best Practices

1. **Never hardcode secrets**
   ```java
   // ❌ Bad
   String apiKey = "sk-1234567890";
   
   // ✅ Good
   String apiKey = System.getenv("OPENAI_API_KEY");
   ```

2. **Validate all inputs**
   ```java
   // ✅ Good
   if (message == null || message.isEmpty()) {
       throw new IllegalArgumentException("Message cannot be empty");
   }
   ```

3. **Use HTTPS**
   ```properties
   quarkus.http.ssl.certificate.files=/path/to/cert.pem
   quarkus.http.ssl.certificate.key-files=/path/to/key.pem
   ```

4. **Implement rate limiting**
   ```java
   @RateLimit(requests = 100, period = 1, unit = TimeUnit.MINUTES)
   public void handleRequest() { }
   ```

5. **Keep dependencies updated**
   ```bash
   mvn dependency:update-properties
   mvn versions:use-latest-versions
   ```

---

## Community Resources

### Learning Resources

- **[Official Documentation](/docs/)**
- **[GitHub Examples](/examples/)**
- **[Tutorial Videos](https://youtube.com/@amcp)**
- **[Blog Posts](https://amcp.dev/blog/)**
- **[Community Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)**

### External Resources

- **[Quarkus Guide](https://quarkus.io/guides/)**
- **[Kafka Documentation](https://kafka.apache.org/documentation/)**
- **[OpenAI API](https://platform.openai.com/docs/)**
- **[Java Documentation](https://docs.oracle.com/javase/)**

### Community Help

- **[Stack Overflow](https://stackoverflow.com/questions/tagged/amcp)**
- **[Reddit](https://reddit.com/r/amcp/)**
- **[Twitter](https://twitter.com/amcp_framework)**
- **[GitHub Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)**

---

## Getting More Help

### Still Need Help?

1. **Check Documentation**: [/docs/](/docs/)
2. **Search Discussions**: [GitHub Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)
3. **Ask a Question**: [New Discussion](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions/new)
4. **Report a Bug**: [New Issue](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)
5. **Contact Support**: [support@amcp.dev](mailto:support@amcp.dev)

---

## Feedback

### Help Us Improve

We're constantly improving AMCP. Help us by:

- **Reporting bugs**: [GitHub Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)
- **Suggesting features**: [GitHub Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)
- **Sharing feedback**: [feedback@amcp.dev](mailto:feedback@amcp.dev)
- **Contributing code**: [Contributing Guide](/community/contributing/)

---

## Thank You!

Thank you for using AMCP! We're here to help you build amazing agentic systems.

**Need help? We're here for you! 🚀**

---

**Support Email**: support@amcp.dev  
**Documentation**: [/docs/](/docs/)  
**GitHub**: [Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues) | [Discussions](https://github.com/agentmeshcommunicationprotocol/amcpcore/discussions)
