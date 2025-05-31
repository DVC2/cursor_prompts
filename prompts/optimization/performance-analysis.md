# Performance Analysis and Optimization Prompt

## Overview
Comprehensive prompt for analyzing and optimizing code performance across different technology stacks. Focuses on identifying bottlenecks and implementing efficient solutions.

## Prompt Template

```
Please analyze the performance of the following code and provide optimization recommendations:

## Performance Context
**Current Performance Issues**: [Describe what's slow - page load, query execution, processing time, etc.]
**Performance Goals**: [Target metrics - response time, throughput, memory usage, etc.]
**Environment**: [Production/development, hardware specs, user load, etc.]
**Technology Stack**: [Languages, frameworks, databases, etc.]
**Constraints**: [Memory limits, budget constraints, compatibility requirements, etc.]

## Code to Analyze
[Paste your code here]

## Analysis Framework

### 1. Performance Profiling
- Identify computational bottlenecks
- Memory usage patterns and potential leaks
- I/O operations that could be optimized
- Database query efficiency
- Network request optimization opportunities

### 2. Algorithm Analysis
- Time complexity (Big O notation)
- Space complexity
- Algorithmic improvements possible
- Data structure optimization opportunities
- Caching potential

### 3. Technology-Specific Optimizations
- Framework-specific best practices
- Language-specific optimizations
- Platform-specific improvements
- Library and dependency optimizations

### 4. Architecture Review
- Code organization for performance
- Asynchronous operation opportunities
- Parallelization potential
- Resource pooling and reuse
- Load balancing considerations

## Optimization Recommendations

Please provide:

### Immediate Fixes (High Impact, Low Effort)
- Quick wins that can be implemented immediately
- Configuration changes
- Simple code modifications
- Caching implementations

### Medium-term Improvements (High Impact, Medium Effort)
- Refactoring opportunities
- Algorithm replacements
- Database optimizations
- Infrastructure changes

### Long-term Optimizations (High Impact, High Effort)
- Architectural changes
- Technology stack upgrades
- Complete rewrites of specific components
- Infrastructure scaling

### Code Examples
- Before/after code comparisons
- Specific implementation examples
- Performance measurement code
- Testing strategies for validating improvements

## Metrics and Monitoring
- Key performance indicators to track
- Monitoring tools recommendations
- Benchmarking strategies
- Performance regression prevention

## Implementation Plan
- Step-by-step optimization sequence
- Risk assessment for each change
- Rollback strategies
- Testing approach for each optimization
```

## Usage Instructions

1. Copy the prompt template above
2. Fill in the performance context with your specific situation
3. Paste your code after the template
4. Review the analysis and prioritize optimizations
5. Implement changes systematically with proper testing

## Specialized Performance Analysis

### Web Application Performance
```
Analyze this web application for performance issues:

**Focus Areas**:
- Frontend bundle size and loading times
- API response times
- Database query performance
- Asset optimization (images, CSS, JS)
- Caching strategies (browser, CDN, server-side)
- Core Web Vitals (LCP, FID, CLS)

**Current Metrics**:
- Page load time: [current time]
- Time to interactive: [current time]
- Bundle size: [current size]
- API response times: [current times]

Include specific recommendations for:
- Code splitting and lazy loading
- Asset compression and optimization
- CDN implementation
- Browser caching strategies
- Critical path optimization

[Paste web application code here]
```

### Database Performance
```
Analyze and optimize database performance:

**Database System**: [PostgreSQL, MySQL, MongoDB, etc.]
**Current Issues**: [Slow queries, high CPU, memory issues, etc.]
**Query Patterns**: [Describe typical query patterns]
**Data Volume**: [Number of records, growth rate, etc.]

**Focus Areas**:
- Query optimization and indexing
- Schema design efficiency
- Connection pooling
- Caching strategies
- Read replica usage
- Partitioning opportunities

Include:
- Execution plan analysis
- Index recommendations
- Query rewriting suggestions
- Schema optimization opportunities
- Monitoring and alerting setup

[Paste database queries/schema here]
```

### API Performance
```
Optimize API performance and scalability:

**API Type**: [REST, GraphQL, gRPC, etc.]
**Current Performance**: [Response times, throughput, error rates]
**Load Characteristics**: [Request patterns, peak loads, etc.]

**Optimization Areas**:
- Response time reduction
- Throughput improvement
- Resource utilization optimization
- Caching implementation
- Rate limiting strategies
- Error handling efficiency

**Infrastructure**:
- Server configuration
- Load balancing
- Auto-scaling policies
- Database connection management
- Third-party service integration

[Paste API code here]
```

### Mobile Application Performance
```
Analyze mobile application performance:

**Platform**: [iOS, Android, React Native, Flutter, etc.]
**Performance Issues**: [App startup time, UI lag, battery drain, etc.]
**Device Targets**: [Minimum supported devices, target performance, etc.]

**Focus Areas**:
- App startup time optimization
- Memory usage reduction
- Battery life improvement
- UI rendering performance
- Network usage optimization
- Storage efficiency

**Specific Optimizations**:
- Image and asset optimization
- Background task management
- Offline capability implementation
- Cache management strategies
- Network request batching

[Paste mobile application code here]
```

## Performance Testing Strategies

### Benchmarking Setup
```
Create a comprehensive performance testing strategy:

**Testing Types Needed**:
- Load testing (normal traffic simulation)
- Stress testing (peak traffic simulation)
- Spike testing (sudden traffic increase)
- Volume testing (large data sets)
- Endurance testing (extended periods)

**Metrics to Track**:
- Response times (average, 95th percentile, 99th percentile)
- Throughput (requests per second)
- Error rates
- Resource utilization (CPU, memory, disk, network)
- User experience metrics

**Tools and Implementation**:
- Performance testing tools setup
- Monitoring and alerting configuration
- Automated performance regression testing
- Performance budgets and gates

Include specific test scenarios and acceptance criteria.
```

### Profiling and Monitoring
```
Set up performance profiling and monitoring:

**Profiling Strategy**:
- Application performance monitoring (APM)
- Code-level profiling
- Database performance monitoring
- Infrastructure monitoring
- User experience monitoring

**Key Metrics Dashboard**:
- System resource utilization
- Application performance metrics
- Business KPIs affected by performance
- Error rates and types
- User satisfaction scores

**Alerting Strategy**:
- Performance threshold alerts
- Anomaly detection
- Escalation procedures
- Performance regression alerts

Include specific tool recommendations and configuration examples.
```

## Framework-Specific Optimizations

### React Performance
```
Optimize React application performance:

**Common Issues**:
- Unnecessary re-renders
- Large bundle sizes
- Inefficient state management
- Poor component structure
- Missing optimizations

**Optimization Techniques**:
- React.memo and useMemo usage
- Code splitting with React.lazy
- Virtual scrolling for large lists
- State management optimization
- Bundle analysis and optimization

[Paste React components here]
```

### Node.js Performance
```
Optimize Node.js server performance:

**Focus Areas**:
- Event loop optimization
- Memory leak prevention
- CPU-intensive task handling
- Database connection pooling
- Middleware optimization
- Error handling efficiency

**Specific Optimizations**:
- Async/await vs promises vs callbacks
- Stream processing for large data
- Worker threads for CPU-intensive tasks
- Clustering for multi-core usage
- Memory management best practices

[Paste Node.js server code here]
```

### Python Performance
```
Optimize Python application performance:

**Performance Areas**:
- Algorithm optimization
- Memory usage reduction
- I/O operation efficiency
- CPU-bound task optimization
- Library and dependency optimization

**Optimization Techniques**:
- Profiling with cProfile and line_profiler
- NumPy vectorization for numerical computing
- Async programming with asyncio
- Caching with functools.lru_cache
- Compilation with Cython for critical paths

[Paste Python code here]
```

## Performance Checklist

### Pre-Optimization
- [ ] Establish baseline performance metrics
- [ ] Identify performance bottlenecks through profiling
- [ ] Set specific, measurable performance goals
- [ ] Create performance testing environment
- [ ] Document current architecture and constraints

### During Optimization
- [ ] Implement changes incrementally
- [ ] Measure impact of each optimization
- [ ] Maintain functionality while improving performance
- [ ] Document all changes and their rationale
- [ ] Test across different environments and load conditions

### Post-Optimization
- [ ] Verify performance goals are met
- [ ] Implement monitoring for regression detection
- [ ] Document optimization techniques used
- [ ] Share learnings with team
- [ ] Plan for ongoing performance maintenance 