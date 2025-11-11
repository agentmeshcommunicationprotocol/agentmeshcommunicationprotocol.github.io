---
layout: default
title: "Contributing to AMCP - Developer Guide for Agent Mesh Communication Protocol"
description: "Join the AMCP community! Learn how to contribute to the Agent Mesh Communication Protocol. Guidelines for code contributions, bug reports, feature requests, and documentation."
date: "November 2025"
author: "AMCP Team"
category: "Community"
permalink: /community/contributing/
keywords: "AMCP contribution, open source, agent framework, LLM integration, Quarkus, Kafka, agentic AI"
---

# 🤝 Contributing to AMCP

**Help build the future of distributed agentic systems. Contribute to AMCP and shape the Agent Mesh Communication Protocol.**

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Code of Conduct](#code-of-conduct)
3. [How to Contribute](#how-to-contribute)
4. [Development Setup](#development-setup)
5. [Coding Standards](#coding-standards)
6. [Submitting Changes](#submitting-changes)
7. [Testing Requirements](#testing-requirements)
8. [Documentation](#documentation)

---

## Getting Started

### Prerequisites

- Java 11+
- Maven 3.6+
- Git
- Docker (optional)
- Quarkus CLI (optional)

### Fork & Clone

```bash
# Fork the repository on GitHub
# https://github.com/agentmeshcommunicationprotocol/amcpcore

# Clone your fork
git clone https://github.com/YOUR_USERNAME/amcpcore.git
cd amcpcore

# Add upstream remote
git remote add upstream https://github.com/agentmeshcommunicationprotocol/amcpcore.git

# Verify remotes
git remote -v
```

### Build Locally

```bash
# Build the project
mvn clean install

# Run tests
mvn test

# Build with all profiles
mvn clean install -P all

# Output:
# [INFO] BUILD SUCCESS
```

---

## Code of Conduct

We are committed to providing a welcoming and inspiring community for all. Please read and adhere to our Code of Conduct:

### Our Pledge

- **Inclusive**: We welcome contributions from all backgrounds
- **Respectful**: We treat all community members with respect
- **Professional**: We maintain a professional and constructive environment
- **Safe**: We maintain a harassment-free space for everyone

### Expected Behavior

- Use welcoming and inclusive language
- Be respectful of differing opinions and experiences
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

### Unacceptable Behavior

- Harassment or discrimination
- Offensive comments or language
- Personal attacks
- Trolling or insulting comments
- Unwelcome sexual attention
- Publishing others' private information

### Reporting Issues

Report Code of Conduct violations to: conduct@amcp.dev

---

## How to Contribute

### 1. Report Bugs

**Found a bug?** Help us fix it!

```bash
# Create an issue on GitHub
# https://github.com/agentmeshcommunicationprotocol/amcpcore/issues

# Include:
# - Description of the bug
# - Steps to reproduce
# - Expected behavior
# - Actual behavior
# - Environment (OS, Java version, etc.)
# - Screenshots (if applicable)
```

**Bug Report Template**:
```markdown
## Description
Brief description of the bug

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: [e.g., Linux, macOS, Windows]
- Java Version: [e.g., 11, 17]
- AMCP Version: [e.g., 1.6.0]

## Screenshots
[If applicable]
```

### 2. Request Features

**Have an idea?** Suggest a feature!

```bash
# Create a feature request on GitHub
# https://github.com/agentmeshcommunicationprotocol/amcpcore/issues

# Include:
# - Description of the feature
# - Use case and motivation
# - Proposed implementation
# - Examples
```

**Feature Request Template**:
```markdown
## Description
What feature would you like?

## Motivation
Why do you need this feature?

## Use Case
How would you use this feature?

## Proposed Implementation
How should it work?

## Examples
Code examples or mockups
```

### 3. Submit Code

**Want to code?** Submit a pull request!

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Make your changes
# Follow coding standards (see below)

# Commit with clear messages
git commit -m "feat: add new agentic capability"

# Push to your fork
git push origin feature/your-feature-name

# Create a pull request on GitHub
```

### 4. Improve Documentation

**Good at writing?** Help improve our docs!

```bash
# Documentation files are in /docs
# Edit markdown files

# Build docs locally
jekyll serve

# View at http://localhost:4000
```

### 5. Write Examples

**Want to showcase AMCP?** Create examples!

```bash
# Examples are in /examples
# Create a new example directory

mkdir examples/my-example
cd examples/my-example

# Create README.md with:
# - Description
# - Setup instructions
# - Usage examples
# - Expected output
```

---

## Development Setup

### Clone & Build

```bash
# Clone repository
git clone https://github.com/agentmeshcommunicationprotocol/amcpcore.git
cd amcpcore

# Build
mvn clean install

# Run tests
mvn test
```

### IDE Setup

#### IntelliJ IDEA

```bash
# Open project
# File > Open > select amcpcore directory

# Configure JDK
# File > Project Structure > Project > SDK > Java 11+

# Enable annotation processing
# File > Settings > Build, Execution, Deployment > Compiler > Annotation Processors
# Check "Enable annotation processing"
```

#### Eclipse

```bash
# Import project
# File > Import > Maven > Existing Maven Projects

# Select amcpcore directory
# Click Finish

# Configure JDK
# Window > Preferences > Java > Installed JREs
# Add Java 11+
```

#### VS Code

```bash
# Install extensions
# - Extension Pack for Java
# - Maven for Java
# - Quarkus Tools

# Open folder
# File > Open Folder > select amcpcore

# Build
# Ctrl+Shift+P > Maven: Build
```

### Development Mode

```bash
# Start Quarkus dev mode
quarkus dev

# Or with Maven
mvn quarkus:dev

# Application runs at http://localhost:8080
# Changes are automatically reloaded
```

---

## Coding Standards

### Java Code Style

```java
// Use clear, descriptive names
public class ChatAgent extends Agent {
    
    // Use meaningful variable names
    private final LLMService llmService;
    private final KafkaProducer<String, String> producer;
    
    // Add JavaDoc comments
    /**
     * Initialize the chat agent with context
     * 
     * @param context the agent context
     */
    @Override
    public void initialize(AgentContext context) {
        // Implementation
    }
    
    // Use proper indentation (4 spaces)
    private void handleMessage(Message message) {
        String payload = message.getPayload();
        
        if (payload != null && !payload.isEmpty()) {
            processMessage(payload);
        }
    }
}
```

### Naming Conventions

```java
// Classes: PascalCase
public class ChatAgent { }

// Methods: camelCase
public void handleMessage() { }

// Constants: UPPER_SNAKE_CASE
public static final String AGENT_NAME = "chat-agent";

// Variables: camelCase
String userMessage = "Hello";
int maxRetries = 3;
```

### Documentation

```java
/**
 * Handles incoming chat messages and generates responses using LLM
 * 
 * This method:
 * 1. Extracts the message payload
 * 2. Calls the LLM service for response generation
 * 3. Publishes the response to Kafka
 * 
 * @param message the incoming message
 * @throws LLMException if LLM call fails
 * @throws KafkaException if publishing fails
 * 
 * @see LLMService#chat(String, ChatConfig)
 * @see KafkaProducer#send(String, String)
 */
private void handleMessage(Message message) {
    // Implementation
}
```

### Error Handling

```java
// Use specific exceptions
try {
    String response = llmService.chat(message, config);
    producer.send(topic, response);
} catch (LLMException e) {
    logger.error("LLM service error: {}", e.getMessage(), e);
    handleLLMError(e);
} catch (KafkaException e) {
    logger.error("Kafka error: {}", e.getMessage(), e);
    handleKafkaError(e);
} catch (Exception e) {
    logger.error("Unexpected error: {}", e.getMessage(), e);
    throw new RuntimeException("Failed to process message", e);
}
```

### Logging

```java
// Use appropriate log levels
logger.debug("Processing message: {}", message);
logger.info("Agent initialized: {}", agentName);
logger.warn("Retry attempt {} of {}", attempt, maxRetries);
logger.error("Failed to process message", exception);
```

---

## Submitting Changes

### Create a Pull Request

```bash
# 1. Ensure your branch is up to date
git fetch upstream
git rebase upstream/main

# 2. Push to your fork
git push origin feature/your-feature-name

# 3. Create PR on GitHub
# - Title: Clear, descriptive title
# - Description: Explain what and why
# - Link related issues: Fixes #123
```

### PR Description Template

```markdown
## Description
What does this PR do?

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation
- [ ] Performance improvement

## Related Issues
Fixes #123

## Testing
How was this tested?

## Checklist
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No breaking changes
```

### PR Review Process

1. **Automated Checks**
   - CI/CD pipeline runs
   - Code quality checks
   - Test coverage

2. **Code Review**
   - Maintainers review code
   - Feedback provided
   - Changes requested

3. **Approval**
   - Minimum 2 approvals required
   - All checks passing
   - Ready to merge

4. **Merge**
   - Squash and merge
   - Delete branch
   - Close related issues

---

## Testing Requirements

### Unit Tests

```java
@QuarkusTest
public class ChatAgentTest {
    
    @InjectMock
    LLMService llmService;
    
    @Test
    public void testMessageHandling() {
        // Arrange
        Message message = new Message("Hello");
        when(llmService.chat(any(), any()))
            .thenReturn("Response");
        
        // Act
        agent.handleMessage(message);
        
        // Assert
        verify(llmService).chat(any(), any());
    }
    
    @Test
    public void testErrorHandling() {
        // Arrange
        when(llmService.chat(any(), any()))
            .thenThrow(new LLMException("Error"));
        
        // Act & Assert
        assertThrows(LLMException.class, () -> {
            agent.handleMessage(new Message("Test"));
        });
    }
}
```

### Integration Tests

```java
@QuarkusIntegrationTest
public class ChatAgentIntegrationTest {
    
    @Test
    public void testEndToEnd() {
        // Test with real Kafka and LLM
        given()
            .body("Hello")
            .when()
            .post("/api/chat")
            .then()
            .statusCode(200);
    }
}
```

### Test Coverage

```bash
# Run tests with coverage
mvn clean test jacoco:report

# View coverage report
# target/site/jacoco/index.html

# Minimum coverage: 80%
```

### Performance Tests

```java
@QuarkusTest
public class PerformanceTest {
    
    @Test
    public void testLatency() {
        long start = System.currentTimeMillis();
        
        for (int i = 0; i < 1000; i++) {
            agent.handleMessage(new Message("Test"));
        }
        
        long duration = System.currentTimeMillis() - start;
        
        // Assert < 1ms per message
        assertTrue(duration < 1000);
    }
}
```

---

## Documentation

### Update Docs

```bash
# Documentation files
docs/
├── index.md
├── getting-started.md
├── api-reference.md
├── tutorials/
│   └── first-agent.md
└── examples/
    └── weather-agent.md

# Edit markdown files
# Follow Jekyll format
# Include code examples
# Add internal links
```

### Documentation Template

```markdown
---
layout: default
title: "Your Title"
description: "SEO-friendly description"
date: "November 2025"
author: "Your Name"
category: "Tutorial"
permalink: /docs/your-page.html
keywords: "keyword1, keyword2, keyword3"
---

# Your Title

Brief introduction

## Table of Contents

1. [Section 1](#section-1)
2. [Section 2](#section-2)

## Section 1

Content with code examples

\`\`\`java
// Code example
\`\`\`

## Section 2

More content

---

**Related**: [Link to related page](/docs/related.html)
```

---

## Contribution Areas

### High Priority

- ✅ LLM integration improvements
- ✅ Agentic capability enhancements
- ✅ Performance optimizations
- ✅ Security improvements
- ✅ Documentation

### Medium Priority

- ✅ Example applications
- ✅ Tutorial content
- ✅ Community tools
- ✅ Integration examples
- ✅ Blog posts

### Low Priority

- ✅ UI improvements
- ✅ Website enhancements
- ✅ Community discussions
- ✅ Social media content
- ✅ Translations

---

## Getting Help

### Resources

- **Documentation**: [/docs/](/docs/)
- **GitHub Issues**: [Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)
- **Discussions**: [/community/discussions/](/community/discussions/)
- **Email**: support@amcp.dev

### Questions?

- Check existing issues and discussions
- Search documentation
- Ask in GitHub discussions
- Email support team

---

## Recognition

### Contributors

We recognize all contributions! Contributors are listed in:

- GitHub contributors page
- CONTRIBUTORS.md file
- Release notes
- Website contributors section

### Levels

- **Bronze**: 1-5 contributions
- **Silver**: 6-20 contributions
- **Gold**: 21-50 contributions
- **Platinum**: 50+ contributions

---

## Legal

### License

AMCP is licensed under Apache License 2.0. By contributing, you agree that your contributions will be licensed under the same license.

### CLA

For significant contributions, we may require a Contributor License Agreement (CLA).

---

## Thank You!

Thank you for contributing to AMCP! Your efforts help make distributed agentic systems more accessible and powerful for everyone.

**Happy contributing! 🚀**

---

**Questions?** [Contact us](mailto:support@amcp.dev)  
**Report Issues**: [GitHub Issues](https://github.com/agentmeshcommunicationprotocol/amcpcore/issues)  
**Join Discussions**: [/community/discussions/](/community/discussions/)
