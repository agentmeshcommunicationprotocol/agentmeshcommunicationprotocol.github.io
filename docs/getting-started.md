---
layout: page
title: "Getting Started with AMCP"
description: "Learn how to get started with AMCP - Agent Mesh Communication Protocol"
permalink: /docs/getting-started/
---

# Getting Started with AMCP

Welcome to AMCP (Agent Mesh Communication Protocol) v1.5! This guide will help you get up and running with AMCP in just a few minutes.

## What is AMCP?

AMCP is an enterprise-grade multi-agent communication framework that enables:

- **Multi-Agent Coordination**: Seamlessly coordinate multiple intelligent agents
- **Event-Driven Architecture**: CloudEvents v1.0 compliant messaging
- **LLM Integration**: Native support for Large Language Models
- **Enterprise Scalable**: Production-ready with monitoring and security

## Prerequisites

Before you begin, ensure you have:

- **Java 21** or later
- **Maven 3.6+** for building
- **Git** for cloning the repository
- **8GB RAM** minimum (16GB recommended)

## Quick Installation

### 1. Clone the Repository

```bash
git clone https://github.com/xaviercallens/amcp-v1.5-opensource.git
cd amcp-v1.5-opensource
```

### 2. Build the Project

```bash
mvn clean package -DskipTests
```

### 3. Start the CLI

```bash
java -jar cli/target/amcp-cli-1.5.0.jar
```

You should see the AMCP Interactive CLI welcome screen:

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                         AMCP Interactive CLI v1.5                           ║
║                        Open Source Edition                                  ║
╚══════════════════════════════════════════════════════════════════════════════╝

🚀 AMCP Interactive CLI is ready!
Type 'help' for available commands or 'agents' to see registered agents.

amcp>
```

## Your First Agent

Let's activate and use the Weather Agent:

### 1. List Available Agents

```bash
amcp> agents
```

You'll see:
```
📋 Registered Agents:
  • weather - Weather information with OpenWeatherMap API integration
  • chat - Enhanced conversational agent with AI capabilities  
  • orchestrator - Master orchestrator for complex multi-agent workflows
```

### 2. Activate the Weather Agent

```bash
amcp> activate weather
```

### 3. Get Weather Information

```bash
amcp> weather London
```

You'll get real-time weather data:
```
✅ Weather for London
  Condition: partly cloudy
  Temperature: 15.2°C
  Humidity: 68%
  Wind Speed: 12.5 m/s
```

## Multi-Agent Orchestration

AMCP's power comes from coordinating multiple agents. Let's try the orchestrator:

### 1. Activate the Orchestrator

```bash
amcp> activate orchestrator
```

### 2. Ask Complex Questions

```bash
amcp> What's the weather like in Paris and should I travel there?
```

The orchestrator will:
1. Analyze your intent using AI
2. Route to the appropriate agents
3. Coordinate responses
4. Provide a comprehensive answer

## Environment Configuration

AMCP uses environment variables for configuration. Create a `.env` file:

```bash
# API Keys (optional - uses demo data without them)
export OPENWEATHER_API_KEY="your_api_key_here"
export POLYGON_API_KEY="your_polygon_key_here"

# AI Configuration
export OLLAMA_ENABLED="false"          # Set to true if you have Ollama
export USE_SIMULATION_MODE="true"      # Fast simulation mode
export CHAT_AGENT_ENABLED="false"      # Enable for LLM features

# Load environment
source .env
```

## Available Commands

| Command | Description |
|---------|-------------|
| `help` | Show all available commands |
| `agents` | List registered agents |
| `activate <agent>` | Activate an agent |
| `deactivate <agent>` | Deactivate an agent |
| `status` | Show system status |
| `weather <city>` | Get weather information |
| `quit` | Exit the CLI |

## Next Steps

Now that you have AMCP running:

1. **[Explore Examples]({{ '/examples/' | relative_url }})** - See real-world use cases
2. **[API Reference]({{ '/docs/api-reference/' | relative_url }})** - Detailed API documentation  
3. **[Architecture Guide]({{ '/docs/architecture/' | relative_url }})** - Understand AMCP's design
4. **[Build Your Own Agent]({{ '/docs/custom-agents/' | relative_url }})** - Create custom agents

## Troubleshooting

### Common Issues

**Build Fails**
```bash
# Clean and rebuild
mvn clean compile
```

**CLI Won't Start**
```bash
# Check Java version
java --version

# Verify JAR file exists
ls -la cli/target/amcp-cli-1.5.0.jar
```

**Agent Activation Fails**
```bash
# Check logs and try simulation mode
export USE_SIMULATION_MODE="true"
source .env
```

### Getting Help

- **GitHub Issues**: [Report bugs](https://github.com/xaviercallens/amcp-v1.5-opensource/issues)
- **Discussions**: [Community discussions](https://github.com/xaviercallens/amcp-v1.5-opensource/discussions)
- **Documentation**: [Full documentation]({{ '/docs/' | relative_url }})

## What's Next?

Congratulations! You now have AMCP running. Here are some suggested next steps:

- **Try the MeshChat Demo**: `./amcp-demos.sh` and select option 2
- **Explore LLM Orchestration**: Option 3 in the demos
- **Read the Architecture Guide**: Understand how AMCP works
- **Join the Community**: Contribute to the project on GitHub

Ready to build something amazing with AMCP? Let's go! 🚀
