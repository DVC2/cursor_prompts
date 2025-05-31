# Code Review Prompt

## Overview
A comprehensive prompt for conducting thorough code reviews with AI assistance. This prompt ensures consistent, high-quality code reviews that catch issues early and promote best practices.

## Prompt Template

```
Please conduct a comprehensive code review of the following code. Focus on:

## Core Quality Checks
- **Code correctness**: Logic errors, edge cases, potential bugs
- **Performance**: Inefficient algorithms, memory leaks, unnecessary computations
- **Security**: Vulnerabilities, input validation, authentication/authorization
- **Maintainability**: Code clarity, naming conventions, complexity

## Architecture & Design
- **SOLID principles**: Single responsibility, open/closed, Liskov substitution, interface segregation, dependency inversion
- **Design patterns**: Appropriate use of patterns, avoiding anti-patterns
- **Separation of concerns**: Clear boundaries between different responsibilities
- **Dependency management**: Proper abstractions and loose coupling

## Code Style & Standards
- **Consistent formatting**: Indentation, spacing, line breaks
- **Naming conventions**: Variables, functions, classes, files
- **Documentation**: Comments, docstrings, inline explanations
- **Error handling**: Proper exception handling and error messages

## Testing Considerations
- **Testability**: Code structure that enables easy testing
- **Test coverage**: Areas that need unit tests, integration tests
- **Mocking potential**: Dependencies that should be mockable
- **Edge case testing**: Boundary conditions and error scenarios

## Specific Review Areas
- [ ] Check for potential null/undefined reference errors
- [ ] Verify input validation and sanitization
- [ ] Review error handling and recovery mechanisms
- [ ] Assess performance implications of the implementation
- [ ] Evaluate security implications
- [ ] Check for code duplication and refactoring opportunities
- [ ] Verify adherence to project coding standards
- [ ] Review documentation completeness and accuracy

## Output Format
For each issue found, provide:
1. **Severity**: Critical/High/Medium/Low
2. **Location**: File and line number
3. **Issue**: Clear description of the problem
4. **Recommendation**: Specific solution or improvement
5. **Example**: Code snippet showing the fix (when applicable)

## Positive Feedback
Also highlight:
- Well-implemented patterns
- Good error handling
- Clear and maintainable code
- Efficient solutions
- Good test coverage

[Paste your code here]
```

## Usage Instructions

1. Copy the prompt template above
2. Paste it into your Cursor chat
3. Replace `[Paste your code here]` with the actual code to review
4. Review the AI's feedback and implement suggested improvements

## Customization Options

### For Specific Languages
Add language-specific checks:
- **JavaScript/TypeScript**: Type safety, async/await usage, promise handling
- **Python**: PEP 8 compliance, type hints, context managers
- **Java**: Exception handling, resource management, concurrency
- **Go**: Error handling, goroutine safety, interface usage

### For Specific Frameworks
Include framework-specific considerations:
- **React**: Component lifecycle, hooks usage, state management
- **Express**: Middleware usage, route organization, error handling
- **Django**: Model design, view structure, template usage
- **Spring**: Bean management, aspect-oriented programming, security

### For Different Review Depths
Adjust focus based on needs:
- **Quick review**: Focus on obvious bugs and security issues
- **Detailed review**: Include style, performance, and architecture
- **Architecture review**: Focus on design patterns and system structure

## Examples

### Quick Security Review
```
Focus specifically on security aspects of this code:
- Input validation and sanitization
- Authentication and authorization
- SQL injection prevention
- XSS prevention
- CSRF protection
- Sensitive data handling

[Your code here]
```

### Performance Review
```
Review this code for performance issues:
- Algorithm efficiency
- Memory usage patterns
- Database query optimization
- Caching opportunities
- Async operation handling
- Resource cleanup

[Your code here]
``` 