# Experiment 02: Working with Maven (Web Application)

## Aim
Create a Maven Spring Boot web application with REST API and Swagger UI.

## Theory
Spring Boot provides REST APIs with automatic documentation via Swagger UI.

## Files
- `pom.xml` — Maven configuration with Spring Boot
- `src/main/java/com/devops/lab/DevOpsApplication.java` — Main Spring Boot App
- `src/main/java/com/devops/lab/CalculatorController.java` — REST Controller
- `src/main/resources/application.properties` — Configuration
- `Dockerfile` — Docker image

## Usage

### Build Project
```bash
cd experiment-02-maven
mvn clean package
```

### Run Application
```bash
java -jar target/devops-maven-app-1.0-SNAPSHOT.jar
```

### Access Application
- **Base URL:** http://your-server-ip:8080
- **Swagger UI:** http://your-server-ip:8080/swagger-ui.html
- **API Docs:** http://your-server-ip:8080/api-docs
- **Health Check:** http://your-server-ip:8080/actuator/health

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/calculator/add?a=5&b=3` | Add two numbers |
| GET | `/api/calculator/subtract?a=10&b=4` | Subtract two numbers |
| GET | `/api/calculator/multiply?a=6&b=7` | Multiply two numbers |
| GET | `/api/calculator/divide?a=15&b=3` | Divide two numbers |

## Example API Calls

```bash
# Add
curl http://localhost:8080/api/calculator/add?a=5&b=3
# Response: {"operation":"add","a":5,"b":3,"result":8}

# Subtract
curl http://localhost:8080/api/calculator/subtract?a=10&b=4
# Response: {"operation":"subtract","a":10,"b":4,"result":6}

# Multiply
curl http://localhost:8080/api/calculator/multiply?a=6&b=7
# Response: {"operation":"multiply","a":6,"b":7,"result":42}

# Divide
curl http://localhost:8080/api/calculator/divide?a=15&b=3
# Response: {"operation":"divide","a":15,"b":3,"result":5.0}
```

## Docker

### Build Docker Image
```bash
docker build -t devops-maven-app:latest .
```

### Run Docker Container
```bash
docker run -p 8080:8080 devops-maven-app:latest
```

## Swagger UI
Open http://localhost:8080/swagger-ui.html to see interactive API documentation.
