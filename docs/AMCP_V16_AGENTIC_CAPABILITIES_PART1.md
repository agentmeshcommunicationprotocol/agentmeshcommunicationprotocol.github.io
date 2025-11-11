---
layout: default
title: "AMCP v1.6 Agentic Capabilities: LLM Integration & Agent Types (Part 1)"
description: "Comprehensive guide to AMCP v1.6 agentic capabilities with LLM integration, Chat agents, Orchestrator agents, and Mesh agents."
date: "November 2025"
author: "AMCP Team"
category: "Guide"
permalink: /docs/AMCP_V16_AGENTIC_CAPABILITIES_PART1.html
---

# 🤖 AMCP v1.6 Agentic Capabilities: LLM Integration & Agent Types

**Part 1: LLM Integration & Chat Agents**

---

## Introduction

AMCP v1.6 introduces **agentic capabilities** that enable autonomous, intelligent agents powered by Large Language Models (LLMs).

### Key Features

- **Local LLM Support**: Run models on-premise (Llama 2, Mistral, CodeLlama)
- **OpenAI Integration**: Direct integration with GPT-4 and GPT-3.5-turbo
- **Three Agent Types**: Chat, Orchestrator, and Mesh agents
- **Autonomous Decision Making**: Agents make decisions without human intervention
- **Event-Driven Architecture**: Seamless integration with Kafka

---

## LLM Integration

### OpenAI Configuration

```properties
# application.properties
amcp.llm.provider=openai
amcp.llm.openai.api-key=${OPENAI_API_KEY}
amcp.llm.openai.model=gpt-4
amcp.llm.openai.temperature=0.7
amcp.llm.openai.max-tokens=2000
```

**Supported Models**:
- ✅ GPT-4 (Most capable)
- ✅ GPT-3.5-turbo (Fast and cost-effective)

### Local LLM Configuration

```properties
# application.properties
amcp.llm.provider=local
amcp.llm.local.endpoint=http://localhost:8000
amcp.llm.local.model=llama2-7b
amcp.llm.local.temperature=0.7
amcp.llm.local.max-tokens=2000
```

**Setup with Ollama**:
```bash
ollama pull llama2
ollama pull mistral
ollama serve
```

### Hybrid Approach

```properties
amcp.llm.provider=hybrid
amcp.llm.hybrid.primary=openai
amcp.llm.hybrid.fallback=local
amcp.llm.hybrid.cost-threshold=0.10
```

---

## Chat Agents

### Definition

Chat agents are **conversational agents** that interact with users through natural language, maintaining context across multiple turns.

### Implementation

```java
@QuarkusMain
public class WeatherChatAgent extends ChatAgent {
    
    @Inject
    LLMService llmService;
    
    @Inject
    WeatherService weatherService;
    
    @Override
    public void initialize(AgentContext context) {
        this.setSystemPrompt("""
            You are a helpful weather assistant. You can:
            1. Provide current weather information
            2. Forecast weather for upcoming days
            3. Explain weather phenomena
            4. Recommend activities based on weather
        """);
        
        context.subscribe("weather-chat", this::handleChatMessage);
    }
    
    private void handleChatMessage(Message message) {
        String userMessage = message.getPayload();
        this.addToContext(userMessage, "user");
        
        String weatherData = weatherService.getCurrentWeather();
        
        String response = llmService.chat(
            this.getConversationHistory(),
            new ChatConfig()
                .model("gpt-4")
                .temperature(0.7)
                .maxTokens(500)
                .context(weatherData)
        );
        
        this.addToContext(response, "assistant");
        this.publish("weather-chat-response", response);
    }
}
```

### CLI Example: Weather Chat

```bash
# Start agent
$ quarkus dev

# Single query
$ curl -X POST http://localhost:8080/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is the weather in Paris?"}'

# Response:
# {
#   "response": "The weather in Paris today is partly cloudy with a high of 15°C. 
#               There's a 20% chance of rain in the evening.",
#   "timestamp": "2025-11-11T08:00:00Z",
#   "confidence": 0.95
# }

# Multi-turn conversation
$ curl -X POST http://localhost:8080/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What about tomorrow?"}'

# Response:
# {
#   "response": "Tomorrow in Paris will be mostly sunny with temperatures reaching 18°C. 
#               It's a perfect day for outdoor activities!",
#   "timestamp": "2025-11-11T08:05:00Z",
#   "confidence": 0.93
# }
```

### Test Case: Weather Chat Agent

```java
@QuarkusTest
public class WeatherChatAgentTest {
    
    @InjectMock
    WeatherService weatherService;
    
    @InjectMock
    LLMService llmService;
    
    @Test
    public void testWeatherQuery() {
        when(weatherService.getCurrentWeather())
            .thenReturn("Paris: 15°C, Partly Cloudy");
        
        when(llmService.chat(any(), any()))
            .thenReturn("The weather in Paris is 15°C and partly cloudy...");
        
        String response = chatAgent.handleMessage("What is the weather in Paris?");
        
        assertThat(response)
            .contains("Paris")
            .contains("15°C");
    }
    
    @Test
    public void testMultiTurnConversation() {
        chatAgent.handleMessage("What is the weather in Paris?");
        String response = chatAgent.handleMessage("What about tomorrow?");
        
        assertThat(response)
            .contains("tomorrow");
    }
}
```

### Stock Chat Agent Example

```java
@QuarkusMain
public class StockChatAgent extends ChatAgent {
    
    @Inject
    StockDataService stockDataService;
    
    @Inject
    LLMService llmService;
    
    @Override
    public void initialize(AgentContext context) {
        this.setSystemPrompt("""
            You are a stock market analyst. Provide:
            1. Current stock prices
            2. Market analysis
            3. Investment recommendations
            4. Risk assessments
        """);
        
        context.subscribe("stock-chat", this::handleStockQuery);
    }
    
    private void handleStockQuery(Message message) {
        String query = message.getPayload();
        this.addToContext(query, "user");
        
        // Extract stock symbol from query
        String symbol = extractSymbol(query);
        StockData data = stockDataService.getStockData(symbol);
        
        String response = llmService.chat(
            this.getConversationHistory(),
            new ChatConfig()
                .model("gpt-4")
                .temperature(0.5)
                .context(data.toString())
        );
        
        this.addToContext(response, "assistant");
        this.publish("stock-chat-response", response);
    }
    
    private String extractSymbol(String query) {
        // Extract stock symbol from natural language query
        return query.replaceAll(".*\\b([A-Z]{1,5})\\b.*", "$1");
    }
}
```

### CLI Example: Stock Chat

```bash
# Query stock information
$ curl -X POST http://localhost:8080/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is the current price of Apple stock?"}'

# Response:
# {
#   "response": "Apple (AAPL) is currently trading at $195.50, up 2.5% today. 
#               The stock has shown strong performance with consistent revenue growth.",
#   "timestamp": "2025-11-11T08:15:00Z",
#   "confidence": 0.94
# }

# Follow-up question
$ curl -X POST http://localhost:8080/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Should I buy it?"}'

# Response:
# {
#   "response": "Based on current fundamentals and technical analysis, Apple shows 
#               strong buy signals. However, consider your risk tolerance and investment goals.",
#   "timestamp": "2025-11-11T08:20:00Z",
#   "confidence": 0.88
# }
```

### Travel Chat Agent Example

```java
@QuarkusMain
public class TravelChatAgent extends ChatAgent {
    
    @Inject
    WeatherService weatherService;
    
    @Inject
    AccommodationService accommodationService;
    
    @Inject
    LLMService llmService;
    
    @Override
    public void initialize(AgentContext context) {
        this.setSystemPrompt("""
            You are a travel advisor. Help with:
            1. Destination recommendations
            2. Weather information
            3. Accommodation suggestions
            4. Activity planning
            5. Budget optimization
        """);
        
        context.subscribe("travel-chat", this::handleTravelQuery);
    }
    
    private void handleTravelQuery(Message message) {
        String query = message.getPayload();
        this.addToContext(query, "user");
        
        // Extract destination
        String destination = extractDestination(query);
        String weatherInfo = weatherService.getWeather(destination);
        String accommodations = accommodationService.search(destination);
        
        String context = String.format(
            "Weather: %s\nAccommodations: %s",
            weatherInfo, accommodations
        );
        
        String response = llmService.chat(
            this.getConversationHistory(),
            new ChatConfig()
                .model("gpt-4")
                .temperature(0.8)
                .context(context)
        );
        
        this.addToContext(response, "assistant");
        this.publish("travel-chat-response", response);
    }
    
    private String extractDestination(String query) {
        // Extract destination from query
        return query.replaceAll(".*to\\s+([A-Za-z\\s]+).*", "$1").trim();
    }
}
```

### CLI Example: Travel Chat

```bash
# Plan a trip
$ curl -X POST http://localhost:8080/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "I want to travel to Barcelona next week"}'

# Response:
# {
#   "response": "Great choice! Barcelona is wonderful in November. The weather will be 
#               pleasant with temperatures around 18-20°C. I found several excellent 
#               accommodations in the Gothic Quarter and near Sagrada Familia.",
#   "timestamp": "2025-11-11T08:25:00Z",
#   "confidence": 0.92
# }

# Get recommendations
$ curl -X POST http://localhost:8080/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What activities would you recommend?"}'

# Response:
# {
#   "response": "For a week in Barcelona, I recommend:\n
#     1. Sagrada Familia (must-see)\n
#     2. Park Güell (stunning views)\n
#     3. Gothic Quarter walking tour\n
#     4. La Boqueria Market (food experience)\n
#     5. Beach day at Barceloneta",
#   "timestamp": "2025-11-11T08:30:00Z",
#   "confidence": 0.90
# }
```

---

## Performance Metrics

### Chat Agent Latency

```
OpenAI GPT-4:
- First response: 800-1200ms
- Subsequent responses: 600-900ms
- Context size: Up to 8K tokens

Local Llama 2 7B:
- First response: 400-600ms
- Subsequent responses: 300-500ms
- Context size: Up to 4K tokens

Hybrid (OpenAI + Local):
- Fallback latency: 300-400ms
- Cost savings: 60-80%
```

---

## Best Practices

### 1. Context Management

```java
// Limit context size to prevent token overflow
if (this.getConversationHistory().size() > 10) {
    this.trimOldestMessages(5);
}

// Summarize long conversations
if (this.getTokenCount() > 4000) {
    String summary = llmService.summarize(this.getConversationHistory());
    this.clearHistory();
    this.addToContext(summary, "summary");
}
```

### 2. Error Handling

```java
try {
    String response = llmService.chat(messages, config);
} catch (LLMException e) {
    logger.error("LLM error", e);
    return fallbackResponse();
} catch (TimeoutException e) {
    logger.warn("LLM timeout, using local model");
    return localLLMService.chat(messages, config);
}
```

### 3. Cost Optimization

```java
// Monitor API costs
if (costTracker.getDailySpend() > threshold) {
    llmService.switchProvider("local");
}

// Use caching for repeated queries
String cachedResponse = cache.get(query);
if (cachedResponse != null) {
    return cachedResponse;
}
```

---

## Conclusion (Part 1)

Chat agents provide conversational AI capabilities with:
- Multi-turn context preservation
- LLM integration (OpenAI or local)
- Real-time data integration
- Natural language understanding

**See Part 2 for Orchestrator and Mesh agents!**
