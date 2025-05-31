# React TypeScript Project Setup

## Overview
Complete setup guide and prompts for optimizing Cursor with React TypeScript projects.

## .cursorrules Template

Create a `.cursorrules/react-typescript.mdc` file in your project:

```mdc
# React TypeScript Development Rules

You are an expert React TypeScript developer. Follow these guidelines:

## Code Standards
- Use TypeScript with strict mode enabled
- Prefer functional components with hooks over class components
- Use proper TypeScript interfaces and types for all props and state
- Follow React best practices for performance and maintainability

## Component Structure
- Use consistent file naming: PascalCase for components
- Place components in dedicated folders with index.ts exports
- Separate concerns: presentation components vs. container components
- Use proper prop destructuring and default values

## Type Safety
- Define proper interfaces for all props, state, and API responses
- Use generic types where appropriate
- Avoid `any` type - use `unknown` or proper typing instead
- Leverage TypeScript utility types (Partial, Pick, Omit, etc.)

## Performance Optimization
- Use React.memo for expensive renders
- Implement proper useMemo and useCallback usage
- Avoid inline object/function creation in render
- Use lazy loading for route-based code splitting

## State Management
- Prefer built-in React state for local component state
- Use Context API for shared application state
- Consider Redux Toolkit for complex state management
- Implement proper error boundaries

## Testing Preferences
- Write tests using React Testing Library
- Focus on user behavior rather than implementation details
- Use MSW (Mock Service Worker) for API mocking
- Implement proper TypeScript types for test data

## File Organization
```
src/
├── components/
│   ├── ui/           # Reusable UI components
│   ├── forms/        # Form components
│   └── layout/       # Layout components
├── pages/            # Route components
├── hooks/            # Custom hooks
├── services/         # API and external services
├── types/            # TypeScript type definitions
├── utils/            # Utility functions
└── __tests__/        # Test files
```

## Import Organization
- Group imports: React, third-party, local
- Use absolute imports with path mapping
- Prefer named exports over default exports for utilities
- Use barrel exports (index.ts) for cleaner imports
```

## Development Prompts

### Component Creation
```
Create a new React TypeScript component with the following requirements:

**Component Name**: [ComponentName]
**Description**: [What this component does]
**Props Interface**: [Define the props structure]
**Styling**: [CSS Modules/Styled Components/Tailwind]
**Accessibility**: [Any specific a11y requirements]

Requirements:
- Use TypeScript with proper interfaces
- Include proper JSDoc comments
- Implement error boundaries if needed
- Add proper prop validation
- Include basic unit tests
- Follow React best practices for performance

[Additional specific requirements]
```

### Hook Creation
```
Create a custom React hook with the following specifications:

**Hook Name**: [useSomething]
**Purpose**: [What functionality this hook provides]
**Parameters**: [Input parameters and their types]
**Return Value**: [What the hook returns]
**Dependencies**: [External dependencies needed]

Requirements:
- Use TypeScript with proper typing
- Include proper error handling
- Add cleanup logic if needed
- Include unit tests
- Document usage examples
- Follow React hooks rules
```

### API Integration
```
Create an API service integration for React with:

**API Endpoint**: [URL and method]
**Data Structure**: [Request/response types]
**Error Handling**: [How to handle different error scenarios]
**Caching Strategy**: [If applicable]
**Loading States**: [How to handle loading/error states]

Requirements:
- Use TypeScript interfaces for all data
- Implement proper error boundaries
- Add loading and error states
- Include retry logic if appropriate
- Use React Query or SWR for data fetching
- Add proper TypeScript generics
```

## Performance Optimization Prompts

### Component Optimization
```
Analyze this React component for performance issues and optimize:

Focus areas:
- Unnecessary re-renders
- Heavy computations in render
- Improper use of hooks
- Memory leaks
- Bundle size impact

Provide specific optimizations with before/after examples.

[Paste component code here]
```

### Bundle Analysis
```
Analyze and optimize the bundle size for this React application:

- Identify large dependencies
- Suggest code splitting opportunities
- Find duplicate dependencies
- Recommend tree-shaking improvements
- Suggest lazy loading implementations

Include specific webpack/Vite configuration recommendations.
```

## Testing Prompts

### Component Testing
```
Create comprehensive tests for this React component:

Testing requirements:
- Unit tests for all component functionality
- Integration tests for user interactions
- Accessibility testing
- Error boundary testing
- Performance testing if applicable

Use React Testing Library and TypeScript.

[Paste component code here]
```

### Custom Hook Testing
```
Create tests for this custom React hook:

Focus on:
- All hook functionality paths
- Error scenarios
- Cleanup and memory leaks
- Dependencies and side effects
- TypeScript type validation

[Paste hook code here]
```

## Common Project Patterns

### State Management Setup
```
Set up state management for a React TypeScript application using:

**State Management Library**: [Redux Toolkit/Zustand/Context API]
**Data Structure**: [Define the application state shape]
**Actions**: [List of actions needed]
**Selectors**: [Define what data components need]

Include:
- Proper TypeScript typing for all state
- Middleware setup (if applicable)
- DevTools integration
- Testing utilities
```

### Route Setup
```
Set up React Router for a TypeScript application with:

**Routes**: [List of application routes]
**Authentication**: [Protected route requirements]
**Code Splitting**: [Which routes should be lazy loaded]
**SEO Requirements**: [Meta tags, titles, etc.]

Include:
- Proper TypeScript types for route parameters
- Error boundaries for route errors
- Loading states for lazy-loaded routes
- Route-based code splitting
```

## Build and Deployment

### Vite Configuration
```
Optimize Vite configuration for React TypeScript:

Requirements:
- TypeScript path mapping
- Environment variable handling
- Build optimization
- Development server setup
- Testing configuration

Include production build optimizations and deployment considerations.
```

### Docker Setup
```
Create Docker configuration for React TypeScript application:

Include:
- Multi-stage build for optimization
- Proper Node.js version
- Static file serving
- Environment variable handling
- Security best practices
``` 