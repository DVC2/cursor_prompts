# Cursor Rules Integration Guide

*How to combine language-specific rules with core rules for maximum development efficiency*

## 📋 Quick Navigation
- [Rule Stack Combinations](#rule-stack-combinations)
- [Project-Specific Setups](#project-specific-setups)
- [Performance Optimization](#performance-optimization)
- [Team Configurations](#team-configurations)
- [Migration Strategies](#migration-strategies)

---

## Rule Stack Combinations

### 🚀 JavaScript + Core Stack
**Perfect for**: Modern web development, React projects, Node.js applications

```bash
# Essential JavaScript Stack (7 rules)
.cursor/rules/
├── javascript.mdc          # JavaScript ES2022+ patterns
├── efficiency.mdc          # Tool call optimization
├── debugging.mdc           # Systematic debugging
├── terminal.mdc            # Terminal optimization
├── audit.mdc               # Code quality assurance
├── commonsense.mdc         # Best practices
└── ADR.mdc                 # Decision tracking (optional)
```

**Synergy Benefits**:
- `javascript.mdc` + `efficiency.mdc` = Modern patterns with minimal tool calls
- `javascript.mdc` + `debugging.mdc` = Type-aware debugging with async patterns
- `javascript.mdc` + `audit.mdc` = Comprehensive code quality with modern standards

### 🔷 TypeScript + Core Stack
**Perfect for**: Enterprise applications, large codebases, team projects

```bash
# Essential TypeScript Stack (8 rules)
.cursor/rules/
├── typescript.mdc          # TypeScript mastery
├── javascript.mdc          # JavaScript fundamentals
├── efficiency.mdc          # Tool call optimization
├── debugging.mdc           # Systematic debugging
├── terminal.mdc            # Terminal optimization
├── audit.mdc               # Code quality assurance
├── commonsense.mdc         # Best practices
└── memory-management.mdc   # Context management for large projects
```

**Synergy Benefits**:
- `typescript.mdc` + `javascript.mdc` = Complete language coverage
- `typescript.mdc` + `memory-management.mdc` = Smart context for complex types
- `typescript.mdc` + `audit.mdc` = Type-safe code quality assurance

### 🌐 Full-Stack Development Stack
**Perfect for**: Full-stack applications, microservices, complex architectures

```bash
# Complete Full-Stack Stack (11 rules)
.cursor/rules/
├── typescript.mdc          # TypeScript mastery
├── javascript.mdc          # JavaScript fundamentals
├── efficiency.mdc          # Tool call optimization
├── debugging.mdc           # Systematic debugging
├── terminal.mdc            # Terminal optimization
├── audit.mdc               # Code quality assurance
├── commonsense.mdc         # Best practices
├── memory-management.mdc   # Context management
├── session-coordinator.mdc # Session continuity
├── development-journal.mdc # Learning patterns
└── ADR.mdc                 # Architectural decisions
```

**Synergy Benefits**:
- Complete language coverage with all optimization rules
- Session continuity for complex development workflows
- Pattern learning across different technologies

---

## Project-Specific Setups

### 🔧 React + TypeScript Project
```bash
# React TypeScript Optimal Setup
.cursor/rules/
├── typescript.mdc          # Component typing, hooks, props
├── javascript.mdc          # Modern React patterns
├── efficiency.mdc          # Bundle operations
├── debugging.mdc           # Component debugging
├── audit.mdc               # Component quality
└── commonsense.mdc         # React best practices
```

**Project Commands**:
```bash
# Single command project setup
"Create React TypeScript project with components, hooks, and tests"

# Component generation
"Create UserProfile component with TypeScript props and state"

# Testing setup
"Add React Testing Library with TypeScript configuration"
```

### 🛠️ Node.js + TypeScript API
```bash
# Node.js API Optimal Setup
.cursor/rules/
├── typescript.mdc          # API typing, interfaces
├── javascript.mdc          # Async patterns
├── efficiency.mdc          # API optimization
├── debugging.mdc           # Server debugging
├── terminal.mdc            # Server operations
├── audit.mdc               # API quality
└── ADR.mdc                 # Architecture decisions
```

**API Commands**:
```bash
# API scaffolding
"Create Express TypeScript API with authentication and validation"

# Route generation
"Create RESTful routes for User resource with proper typing"

# Database integration
"Add Prisma with TypeScript models and migrations"
```

### 📱 React Native Project
```bash
# React Native Optimal Setup
.cursor/rules/
├── typescript.mdc          # Mobile component typing
├── javascript.mdc          # Mobile patterns
├── efficiency.mdc          # Mobile optimization
├── debugging.mdc           # Mobile debugging
├── audit.mdc               # Mobile quality
└── commonsense.mdc         # Mobile best practices
```

**Mobile Commands**:
```bash
# Mobile setup
"Create React Native TypeScript project with navigation"

# Component creation
"Create native components with platform-specific styling"

# State management
"Add Redux Toolkit with TypeScript for state management"
```

---

## Performance Optimization

### 🚀 Rule Load Performance

#### Selective Loading Strategy
```yaml
# Load rules based on project type
# Check package.json for project type detection
```

#### Conditional Rule Application
```yaml
# In typescript.mdc
---
description: TypeScript patterns when tsconfig.json exists
globs: ["**/*.ts", "**/*.tsx"]
alwaysApply: false
---

# In javascript.mdc  
---
description: JavaScript patterns for specific project types
globs: ["src/**/*.js", "src/**/*.jsx", "components/**/*.js"]
alwaysApply: false
---
```

### 📊 Performance Monitoring

```bash
# Monitor rule effectiveness
echo "=== Rule Performance Analysis ===" && \
echo "Active rules: $(ls .cursor/rules/*.mdc | wc -l)" && \
echo "JavaScript files: $(find . -name "*.js" -o -name "*.jsx" | wc -l)" && \
echo "TypeScript files: $(find . -name "*.ts" -o -name "*.tsx" | wc -l)" && \
echo "Rule file sizes: $(du -sh .cursor/rules/*.mdc | sort -hr | head -3)"
```

---

## Team Configurations

### 👥 Small Team (2-5 developers)
```bash
# Collaborative Setup
.cursor/rules/
├── typescript.mdc          # Type consistency
├── javascript.mdc          # Code consistency
├── efficiency.mdc          # Team efficiency
├── debugging.mdc           # Shared debugging
├── audit.mdc               # Code quality
├── commonsense.mdc         # Shared practices
└── ADR.mdc                 # Decision tracking
```

**Team Benefits**:
- Consistent code patterns across team members
- Shared debugging and quality standards
- Architectural decision tracking

### 🏢 Large Team (10+ developers)
```bash
# Enterprise Setup
.cursor/rules/
├── typescript.mdc          # Enterprise typing
├── javascript.mdc          # Standard patterns
├── efficiency.mdc          # Scale optimization
├── debugging.mdc           # Systematic debugging
├── terminal.mdc            # Operation efficiency
├── audit.mdc               # Quality gates
├── commonsense.mdc         # Enterprise practices
├── memory-management.mdc   # Context optimization
├── session-coordinator.mdc # Team handoffs
├── development-journal.mdc # Knowledge sharing
└── ADR.mdc                 # Architecture governance
```

**Enterprise Benefits**:
- Scalable development patterns
- Knowledge preservation and sharing
- Governance and quality gates

---

## Migration Strategies

### 🔄 From JavaScript to TypeScript

#### Phase 1: Preparation
```bash
# Setup dual rules
.cursor/rules/
├── javascript.mdc          # Current codebase
├── typescript.mdc          # Target patterns
├── efficiency.mdc          # Migration efficiency
└── audit.mdc               # Migration quality
```

#### Phase 2: Gradual Migration
```bash
# Migration commands
"Convert this JavaScript file to TypeScript with proper typing"
"Add TypeScript types to existing JavaScript functions"
"Create TypeScript interfaces for data structures"
```

#### Phase 3: Full TypeScript
```bash
# Final setup
.cursor/rules/
├── typescript.mdc          # Primary language
├── javascript.mdc          # Legacy support
├── efficiency.mdc          # Optimized workflow
├── debugging.mdc           # Type-aware debugging
└── audit.mdc               # Type safety assurance
```

### 🔧 Legacy Project Integration

#### Assessment Phase
```bash
# Analyze existing codebase
"Audit this codebase for modernization opportunities"
"Identify areas that would benefit from TypeScript"
"Analyze current JavaScript patterns and suggest improvements"
```

#### Gradual Rule Introduction
```bash
# Week 1: Core efficiency
.cursor/rules/
├── efficiency.mdc
├── debugging.mdc
└── commonsense.mdc

# Week 2: Add language awareness
.cursor/rules/
├── javascript.mdc          # Modern patterns
├── efficiency.mdc
├── debugging.mdc
└── commonsense.mdc

# Week 3: Add quality assurance
.cursor/rules/
├── javascript.mdc
├── audit.mdc               # Quality gates
├── efficiency.mdc
├── debugging.mdc
└── commonsense.mdc
```

---

## Command Integration Examples

### 🚀 Workflow Commands with Multiple Rules

#### Development Workflow
```bash
# Morning startup (efficiency + terminal + language)
"Check project status, update dependencies, and run tests"

# Feature development (language + efficiency + debugging)
"Create user authentication feature with TypeScript and tests"

# Code review (audit + language + commonsense)
"Review this pull request for code quality and best practices"

# Deployment (terminal + efficiency + debugging)
"Build, test, and deploy to staging environment"
```

#### Advanced Integrations
```bash
# Full-stack feature (all rules working together)
"Create a complete user management system with:
- TypeScript backend API
- React frontend with TypeScript
- Database models and migrations
- Comprehensive tests
- Documentation"

# Performance optimization (efficiency + audit + language)
"Optimize this application for performance and maintainability"

# Architecture decision (ADR + language + commonsense)
"Evaluate options for state management and create ADR"
```

---

## Troubleshooting Integration Issues

### 🚨 Common Problems

#### Rule Conflicts
```bash
# Check for conflicting patterns
grep -r "alwaysApply: true" .cursor/rules/
grep -r "globs:" .cursor/rules/ | grep -E "(javascript|typescript)"
```

#### Performance Issues
```bash
# Monitor rule performance
time echo "Test command with all rules active"
ps aux | grep -i cursor
du -sh .cursor/rules/
```

#### Missing Synergies
```bash
# Verify rule loading order
ls -la .cursor/rules/
# Check rule dependencies
grep -r "depends\|requires" .cursor/rules/
```

### 🔧 Solutions

#### Optimize Rule Loading
```yaml
# Conditional loading based on project type
---
description: Load TypeScript rules only for TS projects
globs: ["**/*.ts", "**/*.tsx"]
alwaysApply: false
---
```

#### Balance Rule Coverage
```bash
# Start with essential rules
Essential: efficiency.mdc, debugging.mdc, commonsense.mdc

# Add language-specific
+ javascript.mdc OR typescript.mdc

# Add quality assurance
+ audit.mdc

# Add team features
+ ADR.mdc, session-coordinator.mdc
```

---

## Best Practices Summary

### ✅ Do's
- Start with essential rules (efficiency, debugging, commonsense)
- Add language-specific rules based on project needs
- Monitor performance impact of rule combinations
- Use conditional loading for large projects
- Document team rule configurations

### ❌ Don'ts
- Don't load all rules for every project
- Don't ignore performance monitoring
- Don't forget to update rules documentation
- Don't skip testing rule combinations
- Don't use conflicting rule patterns

---

## Quick Reference

### 📋 Rule Selection Matrix

| Project Type | Essential | Language | Quality | Team | Performance |
|-------------|-----------|----------|---------|------|-------------|
| **Small JS** | ✅ | js.mdc | audit.mdc | - | ✅ |
| **Large JS** | ✅ | js.mdc | audit.mdc | ADR.mdc | ✅ |
| **Small TS** | ✅ | ts.mdc + js.mdc | audit.mdc | - | ✅ |
| **Large TS** | ✅ | ts.mdc + js.mdc | audit.mdc | ADR.mdc + memory.mdc | ✅ |
| **React** | ✅ | ts.mdc + js.mdc | audit.mdc | - | ✅ |
| **Node.js** | ✅ | ts.mdc + js.mdc | audit.mdc | ADR.mdc | ✅ |
| **Full-Stack** | ✅ | ts.mdc + js.mdc | audit.mdc | All team rules | ✅ |

### 🔄 Commands by Stack

```bash
# JavaScript Stack
"Create modern JavaScript application with best practices"

# TypeScript Stack  
"Create TypeScript application with strict typing"

# Full-Stack
"Create full-stack application with TypeScript and modern patterns"

# Enterprise
"Create enterprise application with all quality gates"
```

---

*Maximize your development efficiency with intelligent rule combinations!* 🚀

---

*Last updated: December 2024* 