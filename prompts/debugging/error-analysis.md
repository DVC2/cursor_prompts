# Error Analysis and Debugging Prompt

## Overview
A systematic approach to diagnosing and resolving errors using AI assistance. This prompt helps identify root causes, understand error patterns, and implement effective solutions.

## Prompt Template

```
Please help me analyze and debug the following error. Follow this systematic approach:

## Error Information
**Error Message**: [Paste exact error message here]
**Error Type**: [Exception type, HTTP status code, etc.]
**Context**: [When does this error occur? What user action triggers it?]
**Environment**: [Development/Staging/Production, OS, browser, etc.]
**Frequency**: [Always/Sometimes/Rarely - include frequency details]

## Code Context
[Paste relevant code snippets - include the failing function and related code]

## Stack Trace
[Paste full stack trace if available]

## Recent Changes
[Describe any recent code changes that might be related]

## Analysis Request
Please provide:

### 1. Root Cause Analysis
- Identify the most likely cause of the error
- Explain why this error is occurring
- Identify any underlying issues or patterns

### 2. Error Classification
- Is this a logic error, runtime error, or configuration issue?
- Is it related to data, networking, permissions, or code structure?
- What's the impact severity (Critical/High/Medium/Low)?

### 3. Debugging Strategy
- What additional information should I gather?
- What logging or debugging techniques would help?
- Are there any diagnostic tools I should use?

### 4. Solution Recommendations
- Provide specific fix(es) for the immediate error
- Include code examples where applicable
- Suggest preventive measures to avoid similar errors

### 5. Testing Strategy
- How can I verify the fix works?
- What edge cases should I test?
- What regression tests should I add?

## Additional Context (if relevant)
- Related configuration files
- Database schema or data samples
- Network/API configurations
- Dependencies and versions
```

## Usage Instructions

1. Copy the prompt template above
2. Fill in all relevant sections with your specific error details
3. Paste into Cursor chat for analysis
4. Follow the AI's debugging recommendations
5. Implement suggested fixes and testing strategies

## Error-Specific Variations

### For Web Application Errors
```
**Additional Web Context**:
- Browser and version: [Chrome 120, Firefox 118, etc.]
- Network conditions: [WiFi, cellular, behind proxy, etc.]
- User session state: [Logged in/out, permissions, etc.]
- Request details: [HTTP method, headers, payload]
- Response details: [Status code, headers, body]

**Frontend Specific**:
- Console errors: [Paste browser console errors]
- Network tab issues: [Failed requests, CORS issues, etc.]
- Local storage/session state: [Relevant stored data]
```

### For API/Backend Errors
```
**Additional Backend Context**:
- Server logs: [Paste relevant log entries]
- Database queries: [Recent queries that might be related]
- Memory/CPU usage: [Resource utilization when error occurs]
- Concurrent operations: [Other processes running simultaneously]
- Configuration: [Environment variables, config files]

**Database Specific**:
- Query execution plans: [For slow query issues]
- Lock information: [For deadlock issues]
- Index usage: [For performance issues]
```

### For Build/Deployment Errors
```
**Additional Build Context**:
- Build environment: [Node version, Python version, etc.]
- Dependencies: [Package.json, requirements.txt, etc.]
- Build commands: [Exact commands that failed]
- Environment variables: [Build-time configurations]
- Previous successful build: [Last known working state]
```

## Debugging Workflow

### Step 1: Information Gathering
- [ ] Collect exact error message and stack trace
- [ ] Identify when and how the error occurs
- [ ] Gather relevant code context
- [ ] Check recent changes

### Step 2: Error Analysis
- [ ] Understand the error type and cause
- [ ] Identify affected components
- [ ] Assess impact and urgency
- [ ] Look for similar historical issues

### Step 3: Solution Development
- [ ] Develop hypothesis for the root cause
- [ ] Create targeted fix
- [ ] Consider alternative solutions
- [ ] Plan implementation approach

### Step 4: Testing and Validation
- [ ] Test the fix in isolated environment
- [ ] Verify edge cases are handled
- [ ] Check for unintended side effects
- [ ] Add automated tests to prevent regression

### Step 5: Documentation and Prevention
- [ ] Document the issue and solution
- [ ] Update error handling if needed
- [ ] Add monitoring/alerting if appropriate
- [ ] Share learnings with team

## Quick Debug Templates

### "It was working before" Issues
```
This code was working but now fails. Help me identify what changed:

**Last known working state**: [Date/time when it worked]
**Current failing state**: [Current error]
**Changes made since**: [List of changes - code, dependencies, config, environment]
**Error details**: [Paste error information]

Focus on identifying what change introduced this regression.
```

### Intermittent Issues
```
This error occurs sporadically. Help me identify patterns:

**Error frequency**: [X times out of Y attempts]
**Timing patterns**: [Time of day, load conditions, etc.]
**Environmental factors**: [Different on different machines/browsers?]
**Data patterns**: [Specific input data that triggers it?]
**Concurrent operations**: [What else is happening when it fails?]

Help me design a systematic approach to reproduce and debug this issue.
```

### Performance Issues
```
This code is running slower than expected. Help me optimize:

**Expected performance**: [Benchmarks or expectations]
**Actual performance**: [Current measurements]
**Performance testing**: [Load conditions, test data]
**Profiling data**: [CPU, memory, network usage]
**Bottleneck analysis**: [Where time is being spent]

Provide specific optimization recommendations.
``` 