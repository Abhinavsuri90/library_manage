# Library Management System

A comprehensive Spring Boot 3.1.0 application built with **Java 21 LTS** for managing books and authors in a library environment.

## Student Information

- **Name:** Abhinav Suri
- **Roll Number:** 2024EB02532
- **Repository:** https://github.com/Abhinavsuri90/library_manage

## Features

✅ **Complete CRUD Operations**
- Create, Read, Update, Delete books and authors
- Full relationship management between books and authors

✅ **Entity Relationship Design**
- One-to-Many relationship between Author and Book
- Proper cascade operations and orphan removal

✅ **Java 21 LTS Compatibility**
- Latest LTS Java version
- Modern Spring Boot framework
- Jakarta EE integration

✅ **Search Functionality**
- Search books by title
- Find available books by author
- Full-text search capabilities

✅ **Clean Architecture**
- Controller-Service-Repository pattern
- Separation of concerns
- Proper exception handling

## Technology Stack

| Component | Version |
|-----------|---------|
| Java | 21 LTS |
| Spring Boot | 3.1.0 |
| Maven | 3.9.12 |
| MySQL Connector | 8.2.0 |
| Lombok | 1.18.30 |
| Jakarta EE | 9.0+ |

## Project Structure

```
src/main/
├── java/com/library/
│   ├── controller/      # REST controllers
│   ├── service/         # Business logic
│   ├── repository/      # Data access layer
│   ├── entity/          # JPA entities
│   └── exception/       # Custom exceptions
├── resources/
│   ├── application.properties
│   ├── schema.sql
│   └── data.sql
└── webapp/
    └── WEB-INF/jsp/    # JSP views
```

## Getting Started

### Prerequisites
- Java 21 LTS
- Maven 3.9.12+
- MySQL 8.0+

### Build

```bash
mvn clean compile
```

### Run Tests

```bash
mvn clean test
```

### Full Verification

```bash
mvn clean verify
```

## Build Status

✅ **Compilation:** Successful  
✅ **Tests:** All Passing (100% Pass Rate)  
✅ **Java 21 LTS:** Fully Compatible  
✅ **Build Verification:** Passed  

## Documentation

Complete project documentation available in `DOCUMENTATION.md` including:
- Entity Relationship Design
- Implementation Details
- Challenges and Solutions
- Code Examples and Screenshots
- Performance Optimizations

## Key Achievements

1. **Successful Java 21 Upgrade** - From Java 17 to Java 21 LTS
2. **Full CRUD Implementation** - Complete book and author management
3. **Proper ORM Mapping** - Hibernate with JPA annotations
4. **Clean Code** - Follows Spring Best Practices
5. **Comprehensive Testing** - 100% test pass rate
6. **Production Ready** - All requirements met

## Database Schema

### Authors Table
- `id` (PK, Auto-increment)
- `name` (VARCHAR 100, NOT NULL)
- `email` (VARCHAR 100, UNIQUE, NOT NULL)
- `country` (VARCHAR 50)
- `birth_year` (INT)

### Books Table
- `id` (PK, Auto-increment)
- `title` (VARCHAR 255, NOT NULL)
- `isbn` (VARCHAR 20, UNIQUE, NOT NULL)
- `publication_date` (DATE)
- `availability` (BOOLEAN)
- `author_id` (FK to Authors)

## License

This project is created as an academic assignment.

## Author

Abhinav Suri (2024EB02532)  
May 2026
