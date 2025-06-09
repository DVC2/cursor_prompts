# Cursor Rules Troubleshooting Guide

*Comprehensive solutions for common Cursor MDC rule issues* 🛠️

## 📚 Table of Contents

- [🚫 Rules Not Applying](#-rules-not-applying)
- [⚔️ Conflicting Rules](#️-conflicting-rules)
- [🐌 Performance Issues](#-performance-issues)
- [🔧 Framework-Specific Issues](#-framework-specific-issues)
- [❌ Common Error Messages](#-common-error-messages)
- [🔍 Debug Mode & Diagnostics](#-debug-mode--diagnostics)
- [🆘 Emergency Fixes](#-emergency-fixes)

---

## 🚫 Rules Not Applying

### Symptoms
- AI doesn't follow rule patterns
- Expected behavior not happening
- Rules seem to be ignored

### Step-by-Step Diagnosis

#### 1. **Check Rule File Location** 📁
```bash
# Verify rules directory exists
ls -la .cursor/rules/

# Expected output: List of .mdc files
# ADR.mdc  commonsense.mdc  efficiency.mdc  etc.
```

**Fix if missing:**
```bash
# Create directory and install rules
mkdir -p .cursor/rules
./scripts/install.sh  # or .\scripts\install.ps1 on Windows
```

#### 2. **Validate Glob Patterns** 🎯
- Double-check your `.mdc` file's `globs` section matches the files you want to target
- No need to run any validation scripts—just copy rules and use in Cursor IDE

#### 3. **Check alwaysApply Setting** ⚡
```bash
# Find rules with alwaysApply
grep -A2 -B2 "alwaysApply" .cursor/rules/*.mdc
```

**alwaysApply Behavior:**
- `true`: Rule applies to all files regardless of globs
- `false`: Rule only applies to files matching globs
- `undefined`: Same as false

#### 4. **Restart Cursor IDE** 🔄
```bash
# Kill all Cursor processes (macOS/Linux)
pkill -f cursor

# Kill Cursor processes (Windows PowerShell)
Get-Process *cursor* | Stop-Process -Force

# Then restart Cursor IDE
```

#### 5. **Verify File Association** 📝
```bash
# Check if your file matches any rule patterns
echo "Current file: $(pwd)/src/component.tsx"

# Test against common patterns
echo "**/*.tsx" | grep -q "tsx" && echo "✅ Matches TypeScript React" || echo "❌ No match"
```

### Quick Fix Checklist

- [ ] Rules directory exists: `.cursor/rules/`
- [ ] Rule files are `.mdc` format
- [ ] Glob patterns match your file types
- [ ] Cursor IDE has been restarted
- [ ] File extension matches rule patterns
- [ ] No YAML syntax errors in frontmatter

---

## ⚔️ Conflicting Rules

### Symptoms
- Inconsistent AI behavior
- Rules seem to contradict each other
- Unexpected outputs or patterns

### Step-by-Step Resolution

#### 1. **Identify Active Rules** 🔍
```bash
# List all rules with their glob patterns
for file in .cursor/rules/*.mdc; do
    echo "=== $(basename "$file") ==="
    grep -A5 "globs:" "$file" | head -6
    echo
done
```

#### 2. **Check for Overlapping Patterns** 📊

**Find Conflicting Globs:**
```bash
# Extract all glob patterns
echo "=== Glob Pattern Analysis ===" > rule_analysis.txt
for file in .cursor/rules/*.mdc; do
    echo "File: $(basename "$file")" >> rule_analysis.txt
    grep -A10 "globs:" "$file" | grep -E "^\s*-" >> rule_analysis.txt
    echo "---" >> rule_analysis.txt
done

# Review overlaps
cat rule_analysis.txt
```

**Common Conflict Patterns:**

| Conflict Type | Rule A | Rule B | Issue |
|---------------|--------|--------|-------|
| **Scope Overlap** | `**/*.js` | `**/*.js` | Both apply to JS files |
| **Specificity** | `**/*` | `src/*.ts` | Broad vs specific |
| **Contradictory** | `alwaysApply: true` | `alwaysApply: false` | Different behaviors |

#### 3. **Analyze Rule Priority** 📋
```bash
# Check rule loading order (alphabetical by filename)
ls .cursor/rules/*.mdc | nl

# Rules loaded later may override earlier ones
```

#### 4. **Create Conflict Resolution Map** 🗺️
```bash
# Generate conflict report
cat > check_conflicts.sh << 'EOF'
#!/bin/bash
echo "=== Rule Conflict Analysis ==="
echo "File Type | Applicable Rules"
echo "----------|------------------"

# Check common file types
for ext in js ts tsx jsx py java go; do
    echo -n "$ext files  | "
    for rule in .cursor/rules/*.mdc; do
        if grep -q "\\*\\.$ext" "$rule" || grep -q "\\*\\*/" "$rule"; then
            echo -n "$(basename "$rule" .mdc) "
        fi
    done
    echo
done
EOF

chmod +x check_conflicts.sh && ./check_conflicts.sh
```

### Resolution Strategies

#### **Strategy 1: Specialize Glob Patterns** 🎯
```yaml
# Before (conflicting)
# efficiency.mdc
globs:
  - "**/*.js"

# debugging.mdc  
globs:
  - "**/*.js"

# After (specialized)
# efficiency.mdc
globs:
  - "src/**/*.js"
  - "lib/**/*.js"

# debugging.mdc
globs:
  - "tests/**/*.js"
  - "**/*.test.js"
```

#### **Strategy 2: Merge Compatible Rules** 🤝
```bash
# Combine similar rules into one file
# Example: Merge efficiency.mdc + terminal-optimization.mdc
# into development-efficiency.mdc
```

#### **Strategy 3: Use Conditional Application** 🔀
```yaml
# Use alwaysApply strategically
# Core rules: alwaysApply: true
# Specific rules: alwaysApply: false with narrow globs
```

---

## 🐌 Performance Issues

### Symptoms
- Cursor IDE running slowly
- High memory usage
- Delayed AI responses
- Frequent crashes

### Step-by-Step Optimization

#### 1. **Rule Count Analysis** 📊
```bash
# Count active rules
echo "Total rules: $(ls .cursor/rules/*.mdc | wc -l)"

# Check rule sizes
echo "=== Rule File Sizes ==="
du -sh .cursor/rules/*.mdc | sort -hr

# Large files (>500 lines) may cause issues
echo "=== Large Rules (>500 lines) ==="
for file in .cursor/rules/*.mdc; do
    lines=$(wc -l < "$file")
    if [ "$lines" -gt 500 ]; then
        echo "$(basename "$file"): $lines lines"
    fi
done
```

#### 2. **Memory Usage Monitoring** 🧠
```bash
# Monitor Cursor memory usage (macOS/Linux)
ps aux | grep -i cursor | awk '{print $2, $4, $11}' | head -5

# Monitor Cursor memory usage (Windows PowerShell)
Get-Process *cursor* | Select-Object ProcessName, WorkingSet, CPU | Format-Table
```

#### 3. **Identify Resource-Heavy Rules** ⚡
```bash
# Rules with complex patterns or large content
echo "=== Potentially Heavy Rules ==="
for file in .cursor/rules/*.mdc; do
    # Count regex patterns
    regex_count=$(grep -c "\\*\\*\\|\\[\\|\\{" "$file")
    
    # Count glob patterns  
    glob_count=$(grep -A20 "globs:" "$file" | grep -c "^\s*-")
    
    lines=$(wc -l < "$file")
    
    if [ "$regex_count" -gt 10 ] || [ "$glob_count" -gt 10 ] || [ "$lines" -gt 300 ]; then
        echo "$(basename "$file"): $lines lines, $glob_count globs, $regex_count patterns"
    fi
done
```

### Performance Optimization

#### **Optimization 1: Rule Subset Installation** 📦
```bash
# Install only essential rules
./scripts/install.sh
# Choose option 1 (Essential) instead of 3 (All)

# Or manually install specific rules
mkdir -p .cursor/rules
cp cursor_prompts/.cursor/rules/efficiency.mdc .cursor/rules/
cp cursor_prompts/.cursor/rules/debugging.mdc .cursor/rules/
cp cursor_prompts/.cursor/rules/commonsense.mdc .cursor/rules/
```

#### **Optimization 2: Simplify Glob Patterns** 🎯
```yaml
# Before (complex)
globs:
  - "src/**/*.{js,ts,jsx,tsx}"
  - "lib/**/*.{js,ts}"
  - "components/**/*.{jsx,tsx}"
  - "utils/**/*.{js,ts}"

# After (simplified)
globs:
  - "**/*.js"
  - "**/*.ts"
  - "**/*.jsx"
  - "**/*.tsx"
```

#### **Optimization 3: Rule Consolidation** 🔄
```bash
# Merge similar rules to reduce overhead
# Create consolidated-dev-rules.mdc combining:
# - efficiency.mdc
# - terminal-optimization.mdc
# - anti-duplication.mdc
```

---

## 🔧 Framework-Specific Issues

### React/Next.js Issues 🎭

#### **Problem**: Rules not applying to JSX/TSX files
```bash
# Diagnosis
echo "Checking React file patterns..."
find . -name "*.jsx" -o -name "*.tsx" | head -5

# Check if rules cover React files
grep -n "jsx\|tsx" .cursor/rules/*.mdc
```

**Solution:**
```yaml
# Add React patterns to rules
globs:
  - "**/*.jsx"
  - "**/*.tsx"
  - "components/**/*"
  - "pages/**/*"        # Next.js
  - "app/**/*"          # Next.js 13+
```

#### **Problem**: Next.js routing conflicts
```bash
# Check for page routing patterns
echo "Next.js routing files:"
find . -path "*/pages/*" -o -path "*/app/*" | grep -E "\.(js|ts|jsx|tsx)$"
```

**Solution:**
```yaml
# Specialized Next.js rule
globs:
  - "pages/**/*.{js,ts,jsx,tsx}"
  - "app/**/*.{js,ts,jsx,tsx}"
  - "components/**/*.{jsx,tsx}"
alwaysApply: false
```

### Python/Django Issues 🐍

#### **Problem**: Django templates not recognized
```bash
# Check Python project structure
echo "Python project files:"
find . -name "*.py" -o -name "*.html" -o -name "requirements.txt" | head -10
```

**Solution:**
```yaml
# Django-specific patterns
globs:
  - "**/*.py"
  - "templates/**/*.html"
  - "*/templates/**/*.html"
  - "manage.py"
  - "settings/*.py"
```

### Node.js/Express Issues 🚀

#### **Problem**: Server-side vs client-side confusion
```bash
# Identify project structure
echo "Node.js project structure:"
echo "Package.json exists: $([ -f package.json ] && echo "✅" || echo "❌")"
echo "Server files: $(find . -name "server.js" -o -name "app.js" -o -name "index.js" | wc -l)"
```

**Solution:**
```yaml
# Separate server and client rules
# server-rules.mdc
globs:
  - "server/**/*.js"
  - "routes/**/*.js"
  - "middleware/**/*.js"

# client-rules.mdc  
globs:
  - "public/**/*.js"
  - "client/**/*.js"
  - "frontend/**/*.js"
```

---

## ❌ Common Error Messages

### Error: "Cannot read property 'rules' of undefined"

**Diagnosis:**
```bash
# Check Cursor configuration
ls -la .cursor/
cat .cursor/settings.json 2>/dev/null || echo "No settings.json found"
```

**Solution:**
```bash
# Recreate Cursor configuration
mkdir -p .cursor/rules
./scripts/install.sh

# Reset Cursor settings
rm -f .cursor/settings.json
# Restart Cursor to regenerate
```

### Error: "YAML syntax error in rule file"

**Diagnosis:**
- No need to run validation scripts. All validation is handled by maintainers before merging.

**Solution:**
```bash
# Find and fix YAML errors
for file in .cursor/rules/*.mdc; do
    echo "Checking $file..."
    head -20 "$file" | grep -A10 "^---"
done

# Common fixes:
# 1. Missing quotes around strings with special characters
# 2. Incorrect indentation (use spaces, not tabs)
# 3. Missing colons after keys
```

### Error: "Rule file too large"

**Diagnosis:**
```bash
# Find large rule files
find .cursor/rules -name "*.mdc" -exec wc -l {} \; | sort -nr | head -5
```

**Solution:**
```bash
# Split large rules into smaller, focused rules
# Example: Split debugging.mdc into:
# - error-handling.mdc
# - performance-debugging.mdc  
# - network-debugging.mdc
```

### Error: "Conflicting glob patterns"

**Diagnosis:**
```bash
# Check for duplicate patterns
echo "=== Duplicate Glob Analysis ==="
grep -h "^\s*-" .cursor/rules/*.mdc | sort | uniq -d
```

**Solution:**
```bash
# Remove duplicate patterns or make them more specific
# Use the conflict resolution strategies above
```

---

## 🔍 Debug Mode & Diagnostics

### Enable Cursor Debug Mode 🔬

#### **Method 1: Command Palette**
1. Press `Cmd/Ctrl + Shift + P`
2. Type "Developer: Toggle Developer Tools"
3. Go to Console tab
4. Look for rule-related messages

#### **Method 2: Settings Configuration**
```json
// .cursor/settings.json
{
  "cursor.debug": true,
  "cursor.rules.verbose": true,
  "cursor.rules.logging": true
}
```

#### **Method 3: Environment Variables**
```bash
# Set debug environment (macOS/Linux)
export CURSOR_DEBUG=true
export CURSOR_RULES_DEBUG=true
cursor .

# Set debug environment (Windows)
$env:CURSOR_DEBUG="true"
$env:CURSOR_RULES_DEBUG="true"
cursor .
```

### Diagnostic Commands 🩺

#### **Complete System Diagnosis**
```bash
#!/bin/bash
echo "=== Cursor Rules Diagnostic Report ==="
echo "Generated: $(date)"
echo

echo "1. ENVIRONMENT"
echo "   OS: $(uname -s)"
echo "   Cursor version: $(cursor --version 2>/dev/null || echo 'Not in PATH')"
echo "   Node version: $(node --version 2>/dev/null || echo 'Not installed')"
echo

echo "2. RULES DIRECTORY"
echo "   Location: $(pwd)/.cursor/rules"
echo "   Exists: $([ -d .cursor/rules ] && echo "✅" || echo "❌")"
echo "   Rule count: $(ls .cursor/rules/*.mdc 2>/dev/null | wc -l)"
echo "   Total size: $(du -sh .cursor/rules 2>/dev/null | cut -f1 || echo 'N/A')"
echo

echo "3. RULE FILES"
for file in .cursor/rules/*.mdc; do
    if [ -f "$file" ]; then
        name=$(basename "$file")
        lines=$(wc -l < "$file")
        size=$(du -h "$file" | cut -f1)
        echo "   $name: $lines lines, $size"
    fi
done
echo

echo "4. PROJECT STRUCTURE"
echo "   Project root: $(pwd)"
echo "   Package.json: $([ -f package.json ] && echo "✅" || echo "❌")"
echo "   Git repo: $([ -d .git ] && echo "✅" || echo "❌")"
echo "   File types:"
find . -type f -name "*.*" | sed 's/.*\.//' | sort | uniq -c | sort -nr | head -10 | sed 's/^/      /'

echo
echo "5. VALIDATION RESULTS"
if command -v node >/dev/null 2>&1; then
    node tests/validate-rules.js 2>&1 | tail -10
else
    echo "   Node.js not available for validation"
fi
```

#### **Real-time Rule Monitoring**
```bash
# Monitor rule file changes
if command -v fswatch >/dev/null 2>&1; then
    echo "Monitoring .cursor/rules/ for changes..."
    fswatch -o .cursor/rules/ | while read f; do
        echo "$(date): Rules directory changed"
        npm run validate
    done
elif command -v inotifywait >/dev/null 2>&1; then
    echo "Monitoring .cursor/rules/ for changes..."
    inotifywait -m .cursor/rules/ -e modify,create,delete |
    while read path action file; do
        echo "$(date): $file $action"
        npm run validate
    done
else
    echo "Install fswatch (macOS) or inotify-tools (Linux) for real-time monitoring"
fi
```

#### **Performance Profiling**
```bash
# Profile Cursor startup time
echo "Profiling Cursor startup..."
time (cursor . && sleep 5 && pkill cursor)

# Profile rule loading
echo "Testing rule loading performance..."
for i in {1..5}; do
    echo "Test $i:"
    time cursor --version >/dev/null 2>&1
done
```

---

## 🆘 Emergency Fixes

### Complete Reset 🔄

```bash
# NUCLEAR OPTION: Complete rule reset
echo "⚠️  This will remove all custom rules and reset to defaults"
read -p "Continue? (y/N): " confirm

if [[ $confirm =~ ^[Yy]$ ]]; then
    # Backup existing rules
    [ -d .cursor/rules ] && cp -r .cursor/rules .cursor/rules_backup_$(date +%Y%m%d_%H%M%S)
    
    # Remove all rules
    rm -rf .cursor/rules
    
    # Reinstall essential rules
    ./scripts/install.sh
    
    # Restart Cursor
    pkill -f cursor
    echo "✅ Reset complete. Restart Cursor IDE."
fi
```

### Minimal Working Configuration 🏃

```bash
# Create minimal rule set for testing
mkdir -p .cursor/rules

cat > .cursor/rules/minimal-test.mdc << 'EOF'
---
description: Minimal test rule for troubleshooting
globs:
  - "**/*.js"
  - "**/*.ts"
alwaysApply: false
---

# Minimal Test Rule

## Core Principle
This is a minimal rule to test if Cursor is loading rules correctly.

## Quick Test
- If you see this rule taking effect, the system is working
- Try creating a JavaScript or TypeScript file
- The AI should acknowledge this rule's presence
EOF

echo "✅ Created minimal test rule"
echo "Restart Cursor and test with a .js or .ts file"
```

### Safe Mode Testing 🛡️

```bash
# Test with only one rule active
mkdir -p .cursor/rules_backup
mv .cursor/rules/*.mdc .cursor/rules_backup/ 2>/dev/null

# Copy only commonsense rule for testing
cp .cursor/rules_backup/commonsense.mdc .cursor/rules/

echo "✅ Safe mode active - only commonsense.mdc loaded"
echo "Test if this single rule works, then gradually add others"
```

---

## 📞 Getting Help

### Community Resources 🤝

1. **GitHub Issues**: [Report bugs](https://github.com/DVC2/cursor_prompts/issues)
2. **Discussions**: [Ask questions](https://github.com/DVC2/cursor_prompts/discussions)
3. **Documentation**: [Full guide](../README.md)

### Before Seeking Help 📋

Run the diagnostic script and include:
- Cursor version
- Operating system
- Rule validation results
- Specific error messages
- Steps to reproduce

### Quick Self-Help Checklist ✅

- [ ] Cursor IDE restarted
- [ ] Rules directory exists and has .mdc files
- [ ] YAML frontmatter is valid
- [ ] Glob patterns match your file types
- [ ] No conflicting rules
- [ ] File size under 500 lines per rule
- [ ] Validation script passes

---

*Remember: Most issues are resolved by restarting Cursor and validating rule syntax!* 🚀

---

*Last updated: December 2024* 