---
layout: default
title: "AMCP Kafka Integration"
description: "Event-driven architecture with Kafka"
---

# AMCP Kafka Integration

## Features

✅ Native producer/consumer
✅ Topic-based routing
✅ Consumer groups
✅ Stream processing

## Configuration

```properties
kafka.bootstrap.servers=localhost:9092
amcp.kafka.enabled=true
amcp.kafka.topic.prefix=amcp-
```

## Publishing

```java
@Inject
KafkaProducer<String, String> producer;

public void publish(String topic, String message) {
    producer.send(topic, message);
}
```

## Consuming

```java
@Incoming("amcp-events")
public void consume(String message) {
    System.out.println("Event: " + message);
}
```

## Performance

- Throughput: 1M+ events/sec
- Latency: < 5ms p99
- Durability: Persistent
- Scalability: Horizontal

[👈 Back to Home](index.md)
