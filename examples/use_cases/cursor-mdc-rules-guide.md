# Cursor MDC Rules Guide

## Overview
This guide explains how to use the advanced `.mdc` (MDC = Markdown with metadata) rules included in this repository. These rules are designed to optimize AI agent behavior, memory management, and development workflows in Cursor IDE.

## What are .mdc Files?

MDC files are Cursor's project rules format that combines:
- **YAML frontmatter** with metadata (description, globs, alwaysApply)
- **Markdown content** with instructions for the AI agent

They live in `.cursor/rules/` and are automatically loaded by Cursor based on context.

## Rules in This Repository

### Core Intelligence Rules

#### `memory-management.mdc`
**Purpose**: Advanced memory management with intelligent context pruning and pattern recognition

**Key Features**:
- Intelligent context layers (critical → historical → archive)
- Smart pruning algorithms based on relevance scoring
- Adaptive context loading with prediction
- Pattern recognition engine for code smells and architecture drift
- Performance regression detection

**Best For**: Large projects, long development sessions, memory optimization

#### `session-coordinator.mdc`
**Purpose**: Maintains session continuity and coordinates context across development workflows

**Key Features**:
- Session state management and recovery
- Context transfer between sessions
- Intelligent session resumption
- Cross-session knowledge retention

**Best For**: Team projects, handoff scenarios, long-term development

#### `development-journal.mdc`
**Purpose**: Tracks development patterns, decisions, and workflow optimization

**Key Features**:
- Automatic decision logging
- Pattern recognition and learning
- Workflow optimization suggestions
- Development metrics tracking

**Best For**: Process improvement, pattern learning, decision tracking

### Workflow Optimization Rules

#### `debugging.mdc`
**Purpose**: Highly efficient debugging with minimal tool calls

**Key Features**:
- Tool call optimization strategies
- Pattern-based debugging approaches
- Duplication prevention
- Memory management for debugging sessions

**Best For**: Bug fixing, performance optimization, efficient troubleshooting

#### `efficiency.mdc`
**Purpose**: Minimize premium tool calls while maintaining productivity

**Key Features**:
- Command batching and optimization
- File operation efficiency
- Context management
- Resource conservation strategies

**Best For**: Cost optimization, performance improvement, efficient development

#### `commonsense.mdc`
**Purpose**: Common sense development practices and mistake prevention

**Key Features**:
- Best practice enforcement
- Common mistake prevention
- Code quality guidelines
- Sanity check protocols

**Best For**: Quality assurance, mistake prevention, best practices

## How to Use These Rules

### Installation
1. Copy the `.cursor/rules/` directory to your project root
2. Restart Cursor IDE to load the rules
3. Rules will automatically apply based on their `globs` patterns

### Rule Types in This Collection

#### Always Applied Rules
These rules are always active:
- `memory-management.mdc` (with `alwaysApply: true`)
- Core workflow rules

#### Context-Triggered Rules
These activate based on file patterns:
- Debugging rules when working with error logs
- Development journal when making architectural decisions
- Efficiency rules during intensive development sessions

### Customization

#### Modifying Glob Patterns
```yaml
# Original
globs: ["**/*", ".cursor/memory/**/*"]

# Customized for specific project structure
globs: ["src/**/*", "lib/**/*", "config/**/*"]
```

#### Adjusting Rule Behavior
You can modify the rule content to match your:
- Project architecture
- Team preferences  
- Technology stack
- Development processes

#### Creating Project-Specific Variants
```yaml
---
description: Custom memory management for React projects
globs: ["src/**/*.tsx", "src/**/*.ts", "components/**/*"]
alwaysApply: false
---

# React-specific memory management rules...
```

## Advanced Usage Patterns

### Rule Orchestration
The rules are designed to work together:
1. **Memory Management** provides the foundation
2. **Session Coordinator** maintains continuity
3. **Development Journal** learns and adapts
4. **Debugging/Efficiency** optimize specific workflows
5. **Common Sense** prevents mistakes

### Performance Optimization
- Rules include auto-optimization triggers
- Context pruning prevents memory bloat
- Smart loading reduces startup time
- Pattern recognition improves over time

### Team Collaboration
- Rules can be version controlled
- Shared patterns across team members
- Consistent AI behavior across projects
- Knowledge transfer between developers

## Troubleshooting

### Rules Not Loading
1. Verify files are in `.cursor/rules/` directory
2. Check YAML frontmatter syntax
3. Restart Cursor IDE
4. Verify glob patterns match your files

### Conflicts Between Rules
- Higher numbered rules take precedence
- Use specific glob patterns to scope rules
- Check for overlapping descriptions
- Review rule priority in Cursor settings

### Performance Issues
- Rules include auto-optimization
- Monitor memory usage in development
- Adjust pruning thresholds if needed
- Use selective rule application

## Best Practices

### Rule Management
- Keep rules focused and specific
- Document customizations
- Test rule effectiveness
- Monitor performance impact

### Development Workflow
- Let rules learn your patterns
- Provide feedback through usage
- Customize based on project needs
- Share successful patterns with team

### Maintenance
- Regularly review rule effectiveness
- Update patterns based on experience
- Clean up unused rules
- Optimize for current project needs

## Examples

### Basic Project Setup
```bash
# Copy rules to your project
cp -r .cursor/rules/ /your/project/.cursor/

# Start Cursor IDE
cursor /your/project/
```

### Custom Rule Creation
```yaml
---
description: API development rules for Express.js
globs: ["routes/**/*", "api/**/*", "middleware/**/*"]
alwaysApply: false
---

# Express.js specific development rules
- Use async/await for route handlers
- Implement proper error handling middleware
- Validate input data with Joi or similar
- Use proper HTTP status codes
```

### Rule Debugging
```bash
# Check which rules are loaded
# In Cursor: Cmd+Shift+P > "Show Active Rules"

# View rule application logs
# Available in Cursor developer tools
```

## Integration with Other Tools

### Version Control
- Rules are version controlled with your project
- Share rules across team members
- Track rule evolution over time

### CI/CD Integration
- Rules can influence automated processes
- Consistent behavior across environments
- Documentation generation from rules

### IDE Integration
- Works with Cursor's other features
- Integrates with codebase indexing
- Supports @ symbol references

---

*These rules represent advanced Cursor usage patterns. Start with basic rules and gradually adopt more complex ones as you understand their impact on your workflow.* 