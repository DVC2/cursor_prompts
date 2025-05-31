# API Documentation Generation Prompt

## Overview
Generate comprehensive, user-friendly API documentation from code. This prompt ensures consistent, complete, and practical documentation that developers can easily understand and use.

## Prompt Template

```
Please generate comprehensive API documentation for the following code. Include:

## API Overview
- **Purpose**: What this API does and its main use cases
- **Base URL**: [If applicable]
- **Authentication**: Required authentication method(s)
- **Rate Limiting**: [If applicable]
- **API Version**: Current version and versioning strategy

## Endpoint Documentation

For each endpoint, provide:

### Endpoint Details
- **HTTP Method**: GET/POST/PUT/DELETE/PATCH
- **URL**: Full endpoint path with parameters
- **Description**: What this endpoint does
- **Authentication Required**: Yes/No and type

### Parameters
#### Path Parameters
- **name** (type): Description, constraints, example value

#### Query Parameters
- **name** (type, required/optional): Description, default value, constraints, example

#### Request Body
- **Content-Type**: application/json, multipart/form-data, etc.
- **Schema**: Complete request body structure
- **Example**: Realistic request example

### Responses
#### Success Responses
- **Status Code**: 200, 201, etc.
- **Content-Type**: application/json, etc.
- **Schema**: Response body structure
- **Example**: Complete response example

#### Error Responses
- **Status Code**: 400, 401, 404, 500, etc.
- **Description**: When this error occurs
- **Schema**: Error response structure
- **Example**: Error response example

### Code Examples
Provide working examples in:
- cURL
- JavaScript (fetch/axios)
- Python (requests)
- [Other relevant languages for your audience]

## Data Models
Document all data structures used:
- **Model Name**: Description
- **Properties**: Field name, type, required/optional, description, constraints
- **Example**: Complete model example

## Error Handling
- **Error Format**: Standard error response structure
- **Error Codes**: List of possible error codes and meanings
- **Troubleshooting**: Common issues and solutions

## SDK/Client Libraries
- Available client libraries
- Installation instructions
- Basic usage examples

## Testing
- **Postman Collection**: [If available]
- **OpenAPI/Swagger**: [If available]
- **Testing Environment**: Test endpoints or sandbox

[Paste your API code here]
```

## Usage Instructions

1. Copy the prompt template above
2. Paste your API code (routes, controllers, models) after the template
3. Specify any particular focus areas or requirements
4. Review and customize the generated documentation
5. Add any project-specific information

## Specialized Documentation Types

### OpenAPI/Swagger Generation
```
Generate OpenAPI 3.0 specification for this API code:

Requirements:
- Complete OpenAPI 3.0 YAML format
- Include all endpoints, parameters, and responses
- Add examples for all request/response bodies
- Include proper schema definitions
- Add security definitions
- Include server information

[Paste API code here]
```

### GraphQL API Documentation
```
Generate comprehensive GraphQL API documentation:

Include:
- Schema definition
- Query examples
- Mutation examples
- Subscription examples (if applicable)
- Input types and enums
- Resolver descriptions
- Error handling patterns
- Authentication/authorization

[Paste GraphQL schema and resolvers here]
```

### REST API Quick Reference
```
Generate a quick reference guide for this REST API:

Format as a concise table with:
- Endpoint | Method | Description | Auth Required
- Include only the most essential information
- Focus on practical usage
- Group related endpoints together

[Paste API routes here]
```

## Documentation Quality Checklist

### Completeness
- [ ] All endpoints documented
- [ ] All parameters explained
- [ ] All response codes covered
- [ ] Error scenarios included
- [ ] Authentication details provided

### Clarity
- [ ] Clear, jargon-free descriptions
- [ ] Practical examples provided
- [ ] Consistent terminology used
- [ ] Logical organization/grouping
- [ ] Easy navigation structure

### Accuracy
- [ ] Examples actually work
- [ ] Parameter types are correct
- [ ] Required/optional fields marked correctly
- [ ] Response schemas match actual responses
- [ ] Error codes are accurate

### Usability
- [ ] Getting started guide included
- [ ] Common use cases covered
- [ ] Code examples in multiple languages
- [ ] Testing information provided
- [ ] Troubleshooting section included

## Framework-Specific Templates

### Express.js API
```
Document this Express.js API with focus on:
- Route definitions and middleware
- Request validation schemas
- Error handling middleware
- Authentication middleware usage
- File upload handling (if applicable)

[Paste Express routes and middleware here]
```

### FastAPI Documentation
```
Generate documentation for this FastAPI application:
- Leverage FastAPI's automatic OpenAPI generation
- Include Pydantic model details
- Document dependency injection
- Cover async endpoint specifics
- Include WebSocket endpoints (if applicable)

[Paste FastAPI code here]
```

### Django REST Framework
```
Document this Django REST Framework API:
- ViewSets and serializers
- Permission classes
- Filter and pagination options
- Custom actions
- Authentication backends

[Paste DRF views and serializers here]
```

## Interactive Documentation Examples

### Postman Collection Format
```
Generate a Postman collection for this API including:
- Environment variables for base URL and auth tokens
- Pre-request scripts for authentication
- Tests for response validation
- Organized folder structure
- Request examples with realistic data

[Paste API code here]
```

### README API Section
```
Generate a README section for this API that includes:
- Quick start guide
- Installation instructions
- Basic usage examples
- Link to full documentation
- Contributing guidelines for API changes

[Paste API code here]
```

## Advanced Documentation Features

### API Versioning Documentation
```
Document the versioning strategy for this API:
- How versions are specified (header, URL, etc.)
- Current supported versions
- Deprecation timeline
- Migration guides between versions
- Breaking change policies

[Paste versioned API code here]
```

### Performance Documentation
```
Include performance characteristics in the documentation:
- Expected response times
- Rate limiting details
- Pagination recommendations
- Bulk operation guidelines
- Caching behavior

[Paste API code here]
``` 