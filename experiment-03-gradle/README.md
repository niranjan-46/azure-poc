# Experiment 03: Gradle - Employee & Order Management System

## Aim
Build an Employee Management & E-commerce Order System using Gradle and Spring Boot with Swagger UI.

## Real-World Scenario
A company needs to manage employee records and an e-commerce platform needs order management. Two different use cases to demonstrate Gradle flexibility.

## Features
- ✅ Employee CRUD Operations
- ✅ Order Management
- ✅ Department-based filtering
- ✅ Search functionality
- ✅ Swagger UI Documentation
- ✅ REST API

## Files
- `build.gradle` — Gradle configuration
- `src/main/java/com/devops/gradle/GradleDemoApplication.java` — Main Spring Boot app
- `src/main/java/com/devops/gradle/model/Employee.java` — Employee model
- `src/main/java/com/devops/gradle/controller/EmployeeController.java` — Employee API
- `src/main/java/com/devops/gradle/controller/OrderController.java` — Order API

## Build & Run
```bash
cd experiment-03-gradle
chmod +x gradlew
./gradlew clean build
java -jar build/libs/gradle-demo-app-1.0.0.jar
```

## API Endpoints

### Employee Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/employees` | Get all employees |
| GET | `/api/employees/{id}` | Get employee by ID |
| POST | `/api/employees` | Create new employee |
| PUT | `/api/employees/{id}` | Update employee |
| DELETE | `/api/employees/{id}` | Delete employee |
| GET | `/api/employees/department/{dept}` | Get by department |
| GET | `/api/employees/search?query=name` | Search employees |

### Order Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/orders` | Get all orders |
| GET | `/api/orders/{id}` | Get order by ID |
| POST | `/api/orders` | Create new order |
| PUT | `/api/orders/{id}/status?status=Shipped` | Update status |
| GET | `/api/orders/status/{status}` | Get by status |

## Sample Data

### Employees
- Alice Johnson - Engineering - Senior Developer - $75,000
- Bob Williams - Marketing - Marketing Manager - $55,000
- Carol Davis - HR - HR Manager - $65,000
- Daniel Brown - Finance - Financial Analyst - $80,000

### Orders
- Emma Wilson - Laptop (2) - $1999.98 - Delivered
- Frank Miller - Smartphone (1) - $699.99 - Shipped
- Grace Lee - Headphones (3) - $149.97 - Processing

## Test with curl
```bash
# Get all employees
curl http://localhost:8080/api/employees

# Get employee by ID
curl http://localhost:8080/api/employees/1

# Create employee
curl -X POST http://localhost:8080/api/employees \
  -H "Content-Type: application/json" \
  -d '{"name":"New Employee","email":"new@company.com","department":"IT","salary":60000,"designation":"Developer"}'

# Get employees by department
curl http://localhost:8080/api/employees/department/Engineering

# Get all orders
curl http://localhost:8080/api/orders

# Update order status
curl -X PUT "http://localhost:8080/api/orders/1/status?status=Delivered"
```

## Access
- Swagger UI: http://localhost:8080/swagger-ui.html
- API Docs: http://localhost:8080/api-docs
- Health: http://localhost:8080/actuator/health

## Gradle vs Maven Comparison

| Feature | Maven | Gradle |
|---------|-------|--------|
| Config File | pom.xml | build.gradle |
| Language | XML | Groovy DSL |
| Build Speed | Slower | Faster (cache) |
| This Project | Student/Product System | Employee/Order System |
