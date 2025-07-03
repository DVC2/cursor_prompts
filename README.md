# Advanced Cursor Rules Collection

[![CI Status](https://github.com/DVC2/cursor_prompts/workflows/🚀%20CI%20-%20Cursor%20Rules%20Validation/badge.svg)](https://github.com/DVC2/cursor_prompts/actions)
[![License](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](LICENSE)
[![MDC Rules](https://img.shields.io/badge/MDC%20Rules-11%20Active-green.svg)](.cursor/rules)
[![Documentation](https://img.shields.io/badge/docs-Complete-brightgreen.svg)](docs/)
[![Metrics Dashboard](https://img.shields.io/badge/📊-Metrics%20Dashboard-orange.svg)](tools/metrics-dashboard/index.html)

A curated collection of advanced `.mdc` rules for Cursor IDE that optimize AI agent behavior, memory management, and development workflows.

## 🎯 What This Repository Provides

This repository contains production-ready **Cursor project rules** (`.mdc` files) designed to:

- **Optimize AI Memory Management**: Intelligent context pruning and pattern recognition
- **Enhance Development Workflows**: Session coordination and decision tracking  
- **Improve Debugging Efficiency**: Minimize tool calls while maximizing effectiveness
- **Enforce Best Practices**: Common sense rules and mistake prevention
- **Maintain Session Continuity**: Seamless handoffs and context retention

## 🏗️ Repository Structure

```
cursor_prompts/
├── README.md                   # This file
├── .cursor/rules/             # Advanced Cursor project rules
│   ├── memory-management.mdc  # Intelligent memory & context management
│   ├── session-coordinator.mdc # Session continuity and handoffs
│   ├── development-journal.mdc # Development pattern tracking
│   ├── ADR.mdc                # Architectural Decision Records automation
│   ├── debugging.mdc          # Efficient debugging optimization
│   ├── efficiency.mdc         # Tool call and resource optimization
│   ├── commonsense.mdc        # Best practices and mistake prevention
│   ├── javascript.mdc         # JavaScript ES2022+ best practices
│   ├── typescript.mdc         # TypeScript patterns and type system mastery
│   ├── terminal.mdc           # Terminal operation optimization
│   └── audit.mdc              # Comprehensive code quality assurance
└── examples/                  # Usage guides and documentation
    └── use_cases/
        └── cursor-mdc-rules-guide.md # Comprehensive usage guide
```

## 🚀 Quick Start

### Installation

#### Option 1: Automated Installation (Recommended)
Use the provided installation scripts for easy setup:

```bash
# Unix/macOS
./scripts/install.sh

# Windows PowerShell
.\scripts\install.ps1
```

**Installation Tiers:**
- **Essential**: Core rules for any project (5 rules)
- **Language**: Essential + JavaScript/TypeScript patterns (7 rules)
- **Team**: Language + team coordination (9 rules)
- **All**: Complete feature set (11 rules)

#### Option 2: Manual Installation
1. **Copy to your project**:
   ```bash
   git clone https://github.com/DVC2/cursor_prompts.git
   cp -r cursor_prompts/.cursor/rules/ /your/project/.cursor/
   ```

2. **Restart Cursor IDE** to load the new rules

3. **Rules activate automatically** based on context and file patterns

### Verification

Check that rules are loaded:
- Open Cursor IDE
- Use `Cmd+Shift+P` → "Show Active Rules" (if available)
- Rules will appear in the context when relevant files are accessed

## 🛡️ Rule Descriptions

### Core Intelligence Rules

| Rule | Purpose | Key Features |
|------|---------|--------------|
| **memory-management.mdc** | Advanced memory management with intelligent context pruning | Context layers, smart pruning, pattern recognition, performance monitoring |
| **session-coordinator.mdc** | Session continuity and context coordination | State management, session recovery, context transfer, knowledge retention |
| **development-journal.mdc** | Development pattern tracking and workflow optimization | Decision logging, pattern learning, workflow optimization, metrics tracking |

### Workflow Optimization Rules

| Rule | Purpose | Key Features |
|------|---------|--------------|
| **ADR.mdc** | Intelligent Architectural Decision Record automation | Decision detection, template-based ADR creation, decision tracking |
| **debugging.mdc** | Highly efficient debugging with minimal tool calls | Tool call optimization, pattern-based debugging, duplication prevention |
| **efficiency.mdc** | Minimize premium tool calls while maintaining productivity | Command batching, file operation efficiency, resource conservation |
| **commonsense.mdc** | Common sense development practices and mistake prevention | Best practice enforcement, mistake prevention, quality guidelines |
| **terminal.mdc** | Terminal operation optimization for AI agents | Command chaining, output optimization, state verification |
| **audit.mdc** | Comprehensive code quality assurance with surgical precision | Recursive audit loop, thinking protocols, surgical intervention |

### Language-Specific Rules

| Rule | Purpose | Key Features |
|------|---------|--------------|
| **javascript.mdc** | JavaScript ES2022+ best practices and modern patterns | Modern syntax, async patterns, performance optimization, functional programming |
| **typescript.mdc** | TypeScript patterns and type system mastery | Type safety, advanced types, strict mode, architecture patterns |

## 📖 Understanding .mdc Files

`.mdc` files are Cursor's **MDC (Markdown with metadata)** project rules format:

```yaml
---
description: Brief description of what this rule does
globs: ["**/*", "specific/path/**/*"]  # File patterns this rule applies to
alwaysApply: true  # or false for conditional application
---

# Rule content in Markdown format
Your rule instructions for the AI agent...
```

## 🎛️ Customization

### Modify for Your Project
- **Adjust glob patterns** to match your project structure
- **Customize rule content** for your development style
- **Enable/disable specific features** within each rule
- **Add project-specific patterns** and preferences

### Example Customization
```yaml
---
description: Memory management optimized for React projects  
globs: ["src/**/*.tsx", "src/**/*.ts", "components/**/*"]
alwaysApply: true
---

# React-specific optimizations...
```

## 🔬 Advanced Features

### Intelligent Memory Management
- **Context Layers**: Critical → Important → Historical → Archive
- **Smart Pruning**: Relevance-based context optimization
- **Pattern Recognition**: Code smell and architecture drift detection
- **Performance Monitoring**: Regression detection and optimization

### Session Coordination
- **State Persistence**: Maintain context across sessions
- **Intelligent Recovery**: Resume development workflows seamlessly
- **Knowledge Transfer**: Share insights between team members
- **Context Prediction**: Preload relevant information

### Development Intelligence
- **Pattern Learning**: Automatically discover and optimize workflows
- **Decision Tracking**: Log and learn from development decisions
- **Workflow Optimization**: Continuous improvement of development processes
- **Metrics Collection**: Track and analyze development patterns

## 📚 Documentation

- **[Complete Usage Guide](examples/use_cases/cursor-mdc-rules-guide.md)**: Comprehensive documentation for using these rules
- **[Quick Reference Guide](docs/quick-reference.md)**: Fast commands and patterns with performance metrics
- **[Language-Specific Rules Guide](docs/language-specific-rules.md)**: JavaScript and TypeScript rules documentation
- **[Integration Guide](docs/integration-guide.md)**: How to combine rules for maximum efficiency
- **[Troubleshooting Guide](docs/troubleshooting.md)**: Common issues and diagnostic procedures
- **[Metrics Dashboard](tools/metrics-dashboard/index.html)**: Track your productivity improvements
- **[Cursor Official Documentation](https://docs.cursor.com/context/rules)**: Official Cursor rules documentation

## 🔧 Quality Assurance

This repository is kept simple for easy use:

- **Just copy rules from `.cursor/rules/` to your project**
- **No Node.js, npm, or extra tooling required**
- **All validation is handled by GitHub Actions before merging**

All changes are automatically validated through GitHub Actions before merging.

## 🤝 Contributing

1. **Test thoroughly** in real projects before submitting
2. **Document your changes** and use cases clearly
3. **Follow the existing rule format** and conventions
4. **Provide examples** of how the rules improve workflows

## 🏷️ Use Cases

Perfect for:
- **Large codebases** requiring intelligent context management
- **Team projects** needing consistent AI behavior
- **Long development sessions** requiring memory optimization
- **Complex debugging scenarios** demanding efficiency
- **Quality-focused development** preventing common mistakes

## 📄 License

This repository is public domain. Feel free to use, modify, and distribute these rules for any purpose.

## 🔗 Related Resources

- [Cursor IDE](https://cursor.com/) - AI-powered code editor
- [Cursor Documentation](https://docs.cursor.com/) - Official documentation
- [Cursor Community Forum](https://forum.cursor.com/) - Community discussions

---

*These rules represent advanced Cursor usage patterns developed through extensive real-world usage. They're designed to work together as an integrated system for optimal AI-assisted development.* 