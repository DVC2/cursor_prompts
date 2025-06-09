# Contributing to Cursor Rules Collection

Welcome! 🎉 We're excited you want to contribute to making AI-assisted development more efficient and intelligent. This repository contains advanced Cursor project rules that optimize AI agent behavior, and your contributions help the entire community.

## 🎯 What We're Looking For

We welcome contributions that:
- **Optimize AI agent efficiency** (reduce tool calls, improve accuracy)
- **Solve real development problems** (based on actual usage patterns)
- **Integrate well** with existing rules (no conflicts or redundancy)
- **Are well-documented** with clear use cases and examples

## 🚀 How to Contribute

- **Edit or add `.mdc` files in `.cursor/rules/`**
- **Test your rule in a real project for at least 1 week**
- **Submit a Pull Request (PR) with a clear description and examples**
- **No Node.js, npm, or extra tooling required**

## 🚀 How to Contribute New Rules

### 1. Identify a Need
Before creating a new rule, ensure it addresses a real problem:

```yaml
# ✅ GOOD: Specific problem
Problem: "AI agents make 5+ tool calls for simple React component creation"
Solution: "React component generator with single-call templates"

# ❌ AVOID: Generic or duplicate
Problem: "Need better code quality"
Solution: "Generic linting rules" (already covered by commonsense.mdc)
```

### 2. Rule Categories

**Core Intelligence** (memory, sessions, learning):
- Memory management optimizations
- Session coordination
- Pattern recognition

**Workflow Optimization** (efficiency, debugging, practices):
- Tool call reduction
- Framework-specific optimizations
- Development workflow improvements

### 3. Rule Size Guidelines
- **Keep rules under 500 lines** - larger rules should be split
- **Focus on specific domains** - don't try to solve everything
- **Reuse existing patterns** - build on established rules

### 4. Concrete Example

Here's how to create a new rule for React development:

```markdown
# Before (inefficient):
AI makes 4 tool calls:
1. Create component file
2. Add imports
3. Add component code
4. Export component

# After (with rule):
AI makes 1 tool call with batched operations:
mkdir -p src/components/Button && cat << 'EOF' > src/components/Button/index.tsx
import React from 'react';
// ... complete component in one call
```

## 📋 MDC File Format

### Structure
```yaml
---
description: Concise description of what this rule does (one sentence)
globs: 
  - "**/*.tsx"      # File patterns this rule applies to
  - "**/*.ts"       # Be specific to avoid conflicts
  - "components/**/*"
alwaysApply: false  # true for universal rules, false for conditional
---

# Rule Title

## 🎯 Core Principle
Brief explanation of the rule's main purpose

## 📋 Patterns

### Pattern Name
```language
// ✅ GOOD: Example of what to do
const example = goodPattern();

// ❌ BAD: Example of what to avoid  
const example = badPattern();
```

### Implementation Templates
```bash
# Template for common operations
command1 && command2 && echo "✓ Success"
```

## 🔧 Quick Reference
- Key points for quick lookup
- Common commands or patterns
- Troubleshooting tips
```

### Required Sections
1. **Core Principle** - Why this rule exists
2. **Patterns** - Specific examples with ✅/❌
3. **Quick Reference** - Fast lookup information

### Optional Sections
- **Anti-patterns** - Common mistakes to avoid
- **Integration** - How it works with other rules
- **Troubleshooting** - Common issues and solutions

## 🧪 Testing Requirements

### Before Submitting
1. **Real-world testing** - Use in actual projects for at least 1 week
2. **Performance measurement** - Document improvements quantitatively
3. **Integration testing** - Ensure compatibility with existing rules
4. **Edge case testing** - Test with different project structures

### Testing Checklist
```bash
# Test with different project types
✓ Small project (< 100 files)
✓ Medium project (100-1000 files) 
✓ Large project (1000+ files)

# Test rule activation
✓ Rule activates with correct file patterns
✓ Rule doesn't activate outside intended scope
✓ No conflicts with existing rules

# Test performance
✓ Measure tool call reduction
✓ Measure time savings
✓ Measure accuracy improvements
```

### Performance Testing Example
```javascript
// Before rule implementation
const testResults = {
  toolCalls: 8,
  timeToComplete: 45000, // ms
  accuracy: 85,
  userSatisfaction: 7
};

// After rule implementation  
const improvedResults = {
  toolCalls: 3,           // 62% reduction
  timeToComplete: 18000,  // 60% faster
  accuracy: 95,           // 10% improvement
  userSatisfaction: 9     // 28% improvement
};
```

## 📊 Documenting Performance Improvements

### Metrics to Track
1. **Tool Call Reduction** - Primary efficiency metric
2. **Time Savings** - Real-world time impact
3. **Accuracy Improvement** - Better first-attempt success rate
4. **User Experience** - Subjective satisfaction improvements

### Documentation Format
```markdown
## Performance Impact

### Before Rule
- Tool calls: X per operation
- Time to complete: X seconds
- Success rate: X%

### After Rule  
- Tool calls: X per operation (Y% reduction)
- Time to complete: X seconds (Y% faster)
- Success rate: X% (Y% improvement)

### Test Environment
- Project size: X files
- Testing period: X days
- Test scenarios: [list key scenarios]
```

## 🔄 Pull Request Process

### 1. Preparation
- [ ] Fork the repository
- [ ] Create a feature branch: `git checkout -b rule/your-rule-name`
- [ ] Follow the MDC format exactly
- [ ] Test thoroughly in real projects

### 2. PR Submission
- [ ] **Clear title**: "Add [rule-name] rule for [specific use case]"
- [ ] **Detailed description** with problem/solution
- [ ] **Performance metrics** with before/after data
- [ ] **Testing evidence** (screenshots, logs, examples)

### 3. PR Template
```markdown
## Rule Description
Brief description of what this rule does

## Problem Solved
Specific problem this rule addresses

## Performance Impact
- Tool calls: X → Y (Z% reduction)
- Time: X → Y (Z% improvement)
- Accuracy: X → Y (Z% improvement)

## Testing
- [ ] Tested on small projects
- [ ] Tested on medium projects  
- [ ] Tested on large projects
- [ ] No conflicts with existing rules
- [ ] Performance measurements documented

## Integration
How this rule works with existing rules
```

### 4. Review Process
1. **Automated checks** - Format validation, basic testing
2. **Maintainer review** - Quality, integration, performance
3. **Community feedback** - Real-world usage validation
4. **Approval & merge** - After all checks pass

## 🤝 Code of Conduct

### Our Standards
- **Be respectful** - Constructive feedback, no personal attacks
- **Be inclusive** - Welcome contributors of all backgrounds
- **Be collaborative** - Help others improve their contributions
- **Be quality-focused** - Maintain high standards for user benefit

### Contribution Guidelines
- **Test thoroughly** before submitting
- **Document clearly** with examples and use cases
- **Respond to feedback** constructively and promptly
- **Help others** review and improve their contributions

### Enforcement
- First issue: Friendly guidance and education
- Repeated issues: Temporary restriction from contributing
- Serious violations: Permanent ban from the project

## 🎓 Learning Resources

### Understanding Cursor Rules
- [Cursor Documentation](https://docs.cursor.com/context/rules)
- [Existing rules](/.cursor/rules/) - Study patterns and approaches
- [Usage examples](/examples/) - See rules in action

### AI Agent Optimization
- Tool call efficiency patterns
- Memory management strategies
- Context optimization techniques

## 🆘 Getting Help

### Before Asking
1. Check existing issues and discussions
2. Review documentation and examples
3. Test your rule thoroughly

### How to Ask
- **Be specific** - Include exact error messages, file contents
- **Provide context** - Project size, use case, expected behavior
- **Show your work** - What you've tried, what didn't work

### Where to Ask
- **GitHub Issues** - Bug reports, feature requests
- **GitHub Discussions** - Questions, ideas, general help
- **Pull Request Comments** - Specific feedback on contributions

---

## 🏁 Quick Start Checklist

Ready to contribute? Follow this checklist:

1. [ ] **Identify a specific problem** with current AI agent behavior
2. [ ] **Research existing rules** to avoid duplication
3. [ ] **Create and test** your rule in real projects
4. [ ] **Document performance improvements** with metrics
5. [ ] **Submit a PR** with clear description and evidence
6. [ ] **Respond to feedback** and iterate as needed

Thank you for helping make AI-assisted development more efficient! 🚀 