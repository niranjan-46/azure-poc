# Experiment 02: Maven - Student Management System

## Aim
Build a Student Management System REST API using Maven and Spring Boot with Swagger UI.

## Real-World Scenario
A college needs a web application to manage student records. Students can be added, updated, deleted, and searched.

## Features
- ✅ Student CRUD Operations
- ✅ Product Management
- ✅ Search functionality
- ✅ Swagger UI Documentation
- ✅ REST API

## Files
- `pom.xml` — Maven configuration
- `src/main/java/com/devops/maven/MavenDemoApplication.java` — Main Spring Boot app
- `src/main/java/com/devops/maven/model/Student.java` — Student model
- `src/main/java/com/devops/maven/controller/StudentController.java` — REST API
- `src/main/java/com/devops/maven/controller/ProductController.java` — Product API

## Build & Run
```bash
cd experiment-02-maven
mvn clean package
java -jar target/maven-demo-app-1.0.0.jar
```

## API Endpoints

### Student Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/students` | Get all students |
| GET | `/api/students/{id}` | Get student by ID |
| POST | `/api/students` | Create new student |
| PUT | `/api/students/{id}` | Update student |
| DELETE | `/api/students/{id}` | Delete student |
| GET | `/api/students/search?query=name` | Search students |

### Product Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/products` | Get all products |
| GET | `/api/products/{id}` | Get product by ID |
| POST | `/api/products` | Add new product |
| PUT | `/api/products/{id}/stock?quantity=10` | Update stock |
| GET | `/api/products/category/{category}` | Get by category |

## Sample Data

### Students
- John Smith - Computer Science (Grade: A)
- Maria Garcia - Information Technology (Grade: A+)
- David Chen - Software Engineering (Grade: B+)

### Products
- Laptop - Electronics - $999.99 (50 in stock)
- Smartphone - Electronics - $699.99 (100 in stock)
- Textbook - Books - $49.99 (25 in stock)

## Test with curl
```bash
# Get all students
curl http://localhost:8080/api/students

# Get student by ID
curl http://localhost:8080/api/students/1

# Create student
curl -X POST http://localhost:8080/api/students \
  -H "Content-Type: application/json" \
  -d '{"name":"New Student","email":"new@email.com","course":"AI","age":20,"grade":"A"}'

# Search students
curl http://localhost:8080/api/students/search?query=John
```

## Access
- Swagger UI: http://localhost:8080/swagger-ui.html
- API Docs: http://localhost:8080/api-docs
- Health: http://localhost:8080/actuator/health
