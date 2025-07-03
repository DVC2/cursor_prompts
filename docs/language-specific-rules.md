# Language-Specific Cursor Rules Guide

*Master JavaScript ES2022+ and TypeScript patterns with AI-powered development assistance*

## 📋 Table of Contents
- [Overview](#overview)
- [JavaScript Rules (javascript.mdc)](#javascript-rules)
- [TypeScript Rules (typescript.mdc)](#typescript-rules)
- [Integration with Other Rules](#integration-with-other-rules)
- [Best Practices](#best-practices)
- [Common Patterns](#common-patterns)
- [Troubleshooting](#troubleshooting)

---

## Overview

The language-specific rules enhance your Cursor AI experience by providing deep expertise in modern JavaScript and TypeScript development patterns. These rules work in conjunction with the core efficiency rules to provide language-aware optimizations.

### When These Rules Activate

| Rule | File Patterns | Triggers |
|------|---------------|----------|
| **javascript.mdc** | `**/*.js`, `**/*.jsx`, `**/*.mjs` | JavaScript syntax, modern patterns |
| **typescript.mdc** | `**/*.ts`, `**/*.tsx`, `**/*.d.ts` | TypeScript syntax, type definitions |

---

## JavaScript Rules (javascript.mdc)

### 🎯 Core Focus Areas

#### 1. Modern JavaScript Syntax (ES2022+)
```javascript
// ✅ Recommended patterns the rule enforces
const config = {
  timeout: 5000,
  retries: 3,
  // Object method shorthand
  async fetchData() {
    return await this.request();
  }
};

// ✅ Destructuring with defaults
const { data = [], meta: { total = 0 } = {} } = response;

// ✅ Template literals with expressions
const message = `Processed ${items.length} items in ${duration}ms`;
```

#### 2. Asynchronous Programming
```javascript
// ✅ Modern async patterns
async function fetchAllData(urls) {
  // Parallel execution
  const results = await Promise.all(urls.map(url => fetch(url)));
  
  // Handle partial failures
  const settledResults = await Promise.allSettled(urls.map(url => fetch(url)));
  
  // First successful result
  const firstSuccess = await Promise.any(backupUrls.map(url => fetch(url)));
}

// ✅ Async iteration
async function* processDataStream(stream) {
  for await (const chunk of stream) {
    yield transform(chunk);
  }
}
```

#### 3. Functional Programming Patterns
```javascript
// ✅ Immutable operations
const doubled = numbers.map(n => n * 2);
const filtered = users.filter(u => u.active);
const sum = numbers.reduce((acc, n) => acc + n, 0);

// ✅ Composition patterns
const pipe = (...fns) => x => fns.reduce((acc, fn) => fn(acc), x);
const compose = (...fns) => x => fns.reduceRight((acc, fn) => fn(acc), x);

// ✅ Currying and partial application
const curry = (fn) => {
  return function curried(...args) {
    return args.length >= fn.length
      ? fn.apply(this, args)
      : (...nextArgs) => curried(...args, ...nextArgs);
  };
};
```

#### 4. Performance Optimization
```javascript
// ✅ Memoization pattern
function memoize(fn, keyFn = JSON.stringify) {
  const cache = new Map();
  return function memoized(...args) {
    const key = keyFn(args);
    if (cache.has(key)) return cache.get(key);
    const result = fn.apply(this, args);
    cache.set(key, result);
    return result;
  };
}

// ✅ Lazy evaluation
const lazyValue = () => {
  let computed = false;
  let value;
  return () => {
    if (!computed) {
      value = expensiveComputation();
      computed = true;
    }
    return value;
  };
};
```

### 🚀 AI Enhancement Examples

#### Before (Without Rules)
```javascript
// AI might suggest basic patterns
function getData(url) {
  return fetch(url).then(r => r.json());
}
```

#### After (With javascript.mdc)
```javascript
// AI suggests modern patterns with error handling
async function fetchData(url, { 
  timeout = 5000, 
  retries = 3,
  headers = {} 
} = {}) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);
  
  try {
    const response = await fetch(url, { 
      headers, 
      signal: controller.signal 
    });
    
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }
    
    return await response.json();
  } catch (error) {
    if (error.name === 'AbortError') {
      throw new Error(`Request timeout after ${timeout}ms`);
    }
    throw error;
  } finally {
    clearTimeout(timeoutId);
  }
}
```

---

## TypeScript Rules (typescript.mdc)

### 🎯 Core Focus Areas

#### 1. Type Safety & Inference
```typescript
// ✅ Let TypeScript infer when obvious
const numbers = [1, 2, 3]; // number[]
const config = { host: 'localhost', port: 3000 }; // inferred

// ✅ Explicit when needed
const processValue = <T extends { id: string }>(value: T): T & { processed: true } => {
  return { ...value, processed: true };
};

// ✅ Use satisfies for type checking without widening
const routes = {
  home: '/',
  users: '/users',
  profile: '/users/:id'
} satisfies Record<string, string>;
```

#### 2. Advanced Type Patterns
```typescript
// ✅ Discriminated unions
type AsyncState<T> = 
  | { status: 'idle' }
  | { status: 'loading' }
  | { status: 'success'; data: T }
  | { status: 'error'; error: Error };

// ✅ Conditional types
type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;
type IsArray<T> = T extends readonly any[] ? true : false;

// ✅ Mapped types
type DeepReadonly<T> = {
  readonly [P in keyof T]: T[P] extends object ? DeepReadonly<T[P]> : T[P];
};

// ✅ Template literal types
type HTTPMethod = 'GET' | 'POST' | 'PUT' | 'DELETE';
type APIEndpoint<M extends HTTPMethod> = `/api/${Lowercase<M>}/${string}`;
```

#### 3. Strict Mode Compliance
```typescript
// ✅ Null safety
interface User {
  id: string;
  name: string;
  email?: string;
  metadata: Record<string, unknown> | null;
}

// ✅ Type guards over assertions
function isUser(value: unknown): value is User {
  return (
    typeof value === 'object' &&
    value !== null &&
    'id' in value &&
    'name' in value &&
    typeof value.id === 'string' &&
    typeof value.name === 'string'
  );
}

// ✅ Optional chaining and nullish coalescing
const getDisplayName = (user: User) => {
  return user.name ?? user.email ?? 'Anonymous';
};
```

#### 4. Architecture Patterns
```typescript
// ✅ Dependency injection
const TOKENS = {
  Logger: Symbol('Logger'),
  Database: Symbol('Database'),
} as const;

interface Logger {
  log(message: string): void;
}

interface Container {
  get<T>(token: symbol): T;
  bind<T>(token: symbol, factory: () => T): void;
}

// ✅ Repository pattern
interface Repository<T, ID = string> {
  findById(id: ID): Promise<T | null>;
  findAll(filter?: Partial<T>): Promise<T[]>;
  create(entity: Omit<T, 'id'>): Promise<T>;
  update(id: ID, updates: Partial<T>): Promise<T>;
  delete(id: ID): Promise<void>;
}

// ✅ Generic service layer
abstract class BaseService<T, ID = string> {
  constructor(protected repository: Repository<T, ID>) {}
  
  async findById(id: ID): Promise<T | null> {
    return this.repository.findById(id);
  }
  
  abstract validate(entity: T): Promise<void>;
}
```

### 🚀 AI Enhancement Examples

#### Before (Without Rules)
```typescript
// AI might suggest basic types
function processData(data: any) {
  return data.map((item: any) => item.name);
}
```

#### After (With typescript.mdc)
```typescript
// AI suggests proper typing with constraints
interface ProcessableItem {
  id: string;
  name: string;
  metadata?: Record<string, unknown>;
}

function processData<T extends ProcessableItem>(
  data: T[]
): Array<{ id: string; name: string; item: T }> {
  return data.map(item => ({
    id: item.id,
    name: item.name,
    item
  }));
}

// Usage with proper inference
const users = [{ id: '1', name: 'John', email: 'john@example.com' }];
const processed = processData(users); // Fully typed result
```

---

## Integration with Other Rules

### 🔄 Rule Synergy

#### With `efficiency.mdc`
```typescript
// Single call creates complete typed service
"Create a UserService with CRUD operations and validation"

// Result: Full service with types, interfaces, and implementation
interface User { id: string; name: string; email: string; }
interface UserRepository extends Repository<User> {}
class UserService extends BaseService<User> {
  async validate(user: User): Promise<void> { /* validation */ }
}
```

#### With `debugging.mdc`
```typescript
// Enhanced debugging with type information
"Debug why this function returns undefined"

// Result: Type-aware debugging with inference analysis
function getUserEmail(user: User | null): string | undefined {
  // TypeScript rule provides type flow analysis
  if (!user) return undefined; // null check
  return user.email ?? undefined; // optional property handling
}
```

#### With `audit.mdc`
```typescript
// Comprehensive code quality with type safety
"Audit this codebase for type safety issues"

// Result: Detailed analysis including:
// - `any` type usage
// - Missing type annotations
// - Unsafe type assertions
// - Incomplete type guards
```

### 🎯 Workflow Integration

#### Full-Stack Development
```bash
# 1. Setup with type safety
"Create Next.js app with TypeScript and strict mode"

# 2. API development
"Create typed API routes with validation"

# 3. Frontend components
"Create React components with proper prop types"

# 4. Testing
"Write tests with proper typing for all components"
```

---

## Best Practices

### 🏆 JavaScript Best Practices

#### 1. Modern Syntax Usage
```javascript
// ✅ Always use const/let, never var
const immutableData = Object.freeze({ config: 'value' });
let mutableCounter = 0;

// ✅ Use arrow functions for callbacks
const filtered = items.filter(item => item.active);

// ✅ Destructuring with meaningful names
const { 
  data: users, 
  meta: { pagination } 
} = response;
```

#### 2. Async Programming
```javascript
// ✅ Always handle promise rejections
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  console.error('Operation failed:', error);
  throw new Error('Failed to process data');
}

// ✅ Use Promise.allSettled for batch operations
const results = await Promise.allSettled(operations);
const successes = results.filter(r => r.status === 'fulfilled');
```

#### 3. Error Handling
```javascript
// ✅ Create custom error classes
class ValidationError extends Error {
  constructor(field, value) {
    super(`Invalid ${field}: ${value}`);
    this.name = 'ValidationError';
    this.field = field;
    this.value = value;
  }
}

// ✅ Use early returns to avoid nesting
function processUser(user) {
  if (!user) return { error: 'User required' };
  if (!user.email) return { error: 'Email required' };
  
  return { success: true, data: user };
}
```

### 🏆 TypeScript Best Practices

#### 1. Type Definitions
```typescript
// ✅ Use interfaces for object shapes
interface UserConfig {
  readonly id: string;
  name: string;
  permissions: ReadonlyArray<string>;
}

// ✅ Use type aliases for unions and primitives
type Status = 'active' | 'inactive' | 'pending';
type UserId = string & { __brand: 'UserId' };
```

#### 2. Generic Constraints
```typescript
// ✅ Use constraints to limit generic types
function merge<T extends Record<string, any>>(
  target: T, 
  source: Partial<T>
): T {
  return { ...target, ...source };
}

// ✅ Use keyof for type-safe property access
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}
```

#### 3. Utility Types
```typescript
// ✅ Use built-in utility types
type PartialUser = Partial<User>;
type RequiredUser = Required<User>;
type UserEmail = Pick<User, 'email'>;
type UserWithoutId = Omit<User, 'id'>;

// ✅ Create custom utility types
type DeepPartial<T> = {
  [P in keyof T]?: T[P] extends object ? DeepPartial<T[P]> : T[P];
};
```

---

## Common Patterns

### 🔄 React Integration

#### JavaScript + React
```javascript
// ✅ Modern React patterns
const UserProfile = ({ userId }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let cancelled = false;
    
    fetchUser(userId)
      .then(userData => {
        if (!cancelled) {
          setUser(userData);
          setLoading(false);
        }
      })
      .catch(err => {
        if (!cancelled) {
          setError(err);
          setLoading(false);
        }
      });

    return () => { cancelled = true; };
  }, [userId]);

  if (loading) return <LoadingSpinner />;
  if (error) return <ErrorMessage error={error} />;
  if (!user) return <NotFound />;

  return <UserCard user={user} />;
};
```

#### TypeScript + React
```typescript
// ✅ Fully typed React components
interface UserProfileProps {
  userId: string;
  onUserLoad?: (user: User) => void;
}

const UserProfile: React.FC<UserProfileProps> = ({ userId, onUserLoad }) => {
  const [state, setState] = useState<AsyncState<User>>({ status: 'idle' });

  useEffect(() => {
    setState({ status: 'loading' });
    
    fetchUser(userId)
      .then(user => {
        setState({ status: 'success', data: user });
        onUserLoad?.(user);
      })
      .catch(error => {
        setState({ status: 'error', error });
      });
  }, [userId, onUserLoad]);

  switch (state.status) {
    case 'loading':
      return <LoadingSpinner />;
    case 'error':
      return <ErrorMessage error={state.error} />;
    case 'success':
      return <UserCard user={state.data} />;
    default:
      return null;
  }
};
```

### 🔄 API Integration

#### JavaScript API Client
```javascript
// ✅ Modern API client with error handling
class APIClient {
  constructor(baseURL, defaultOptions = {}) {
    this.baseURL = baseURL;
    this.defaultOptions = {
      headers: { 'Content-Type': 'application/json' },
      ...defaultOptions
    };
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = { ...this.defaultOptions, ...options };
    
    try {
      const response = await fetch(url, config);
      
      if (!response.ok) {
        const error = await response.json().catch(() => ({}));
        throw new APIError(response.status, error.message || response.statusText);
      }
      
      return await response.json();
    } catch (error) {
      if (error instanceof APIError) throw error;
      throw new APIError(0, 'Network error');
    }
  }
}
```

#### TypeScript API Client
```typescript
// ✅ Type-safe API client
interface APIResponse<T> {
  data: T;
  meta?: {
    total?: number;
    page?: number;
    limit?: number;
  };
}

interface APIError {
  code: string;
  message: string;
  details?: Record<string, any>;
}

class TypedAPIClient {
  constructor(
    private baseURL: string,
    private defaultOptions: RequestInit = {}
  ) {}

  async get<T>(endpoint: string): Promise<APIResponse<T>> {
    return this.request<T>('GET', endpoint);
  }

  async post<T, U = any>(endpoint: string, data: U): Promise<APIResponse<T>> {
    return this.request<T>('POST', endpoint, { body: JSON.stringify(data) });
  }

  private async request<T>(
    method: string,
    endpoint: string,
    options: RequestInit = {}
  ): Promise<APIResponse<T>> {
    const url = `${this.baseURL}${endpoint}`;
    const config: RequestInit = {
      method,
      headers: { 'Content-Type': 'application/json' },
      ...this.defaultOptions,
      ...options
    };

    const response = await fetch(url, config);
    
    if (!response.ok) {
      const error: APIError = await response.json().catch(() => ({
        code: 'UNKNOWN',
        message: response.statusText
      }));
      throw new Error(`API Error ${response.status}: ${error.message}`);
    }

    return response.json() as Promise<APIResponse<T>>;
  }
}
```

---

## Troubleshooting

### 🚨 Common Issues

#### JavaScript Rules Not Applying
```bash
# Check file patterns
grep -n "globs:" .cursor/rules/javascript.mdc

# Verify file extensions
find . -name "*.js" -o -name "*.jsx" -o -name "*.mjs" | head -5

# Test rule activation
echo "const test = 'hello';" > test.js
# Open test.js in Cursor and check if modern patterns are suggested
```

#### TypeScript Rules Not Applying
```bash
# Check TypeScript configuration
[ -f tsconfig.json ] && echo "✓ tsconfig.json found" || echo "✗ tsconfig.json missing"

# Verify TypeScript files
find . -name "*.ts" -o -name "*.tsx" -o -name "*.d.ts" | head -5

# Check rule patterns
grep -n "globs:" .cursor/rules/typescript.mdc
```

### 🔧 Performance Issues

#### Large Codebases
```bash
# Check rule file sizes
du -sh .cursor/rules/javascript.mdc .cursor/rules/typescript.mdc

# Monitor memory usage
echo "Cursor processes: $(ps aux | grep -i cursor | wc -l)"

# Clean up if needed
find . -name "*.log" -mtime +7 -delete
```

#### Rule Conflicts
```bash
# Check for conflicting patterns
grep -n "alwaysApply" .cursor/rules/*.mdc

# Verify rule priority
ls -la .cursor/rules/ | grep -E "(javascript|typescript)"
```

### 🎯 Optimization Tips

#### 1. Selective Rule Application
```yaml
# In javascript.mdc - optimize for specific patterns
---
description: JavaScript best practices for React projects
globs: ["src/**/*.js", "src/**/*.jsx", "components/**/*.js"]
alwaysApply: false
---
```

#### 2. Context-Aware Activation
```yaml
# In typescript.mdc - only for TypeScript projects
---
description: TypeScript patterns when tsconfig.json exists
globs: ["**/*.ts", "**/*.tsx"]
alwaysApply: false
---
```

#### 3. Performance Monitoring
```bash
# Monitor rule effectiveness
echo "=== Rule Performance Check ===" && \
echo "JS files processed: $(find . -name "*.js" | wc -l)" && \
echo "TS files processed: $(find . -name "*.ts" | wc -l)" && \
echo "Rule files loaded: $(ls .cursor/rules/*.mdc | wc -l)"
```

---

## 🎓 Learning Resources

### JavaScript ES2022+ Features
- **Optional Chaining**: `obj?.prop?.method?.()`
- **Nullish Coalescing**: `value ?? default`
- **Private Class Fields**: `#privateField`
- **Top-level await**: `await import('./module.js')`
- **Logical Assignment**: `a ||= b`, `a &&= b`, `a ??= b`

### TypeScript Advanced Patterns
- **Conditional Types**: `T extends U ? X : Y`
- **Mapped Types**: `{ [P in keyof T]: T[P] }`
- **Template Literal Types**: `type Route = \`/api/\${string}\``
- **Utility Types**: `Partial<T>`, `Required<T>`, `Pick<T, K>`

### Integration Examples
- **React + TypeScript**: Component props, hooks, context
- **Node.js + TypeScript**: API routes, middleware, services
- **Testing**: Jest, React Testing Library with TypeScript
- **Build Tools**: Vite, Webpack, esbuild configuration

---

*Master modern JavaScript and TypeScript development with AI-powered assistance!* 🚀

---

*Last updated: December 2024* 