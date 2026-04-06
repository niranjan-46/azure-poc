# Experiment 03: Working with Gradle (Web Application)

## Aim
Create a Gradle Spring Boot web application with REST API and Swagger UI.

## Theory
Gradle with Spring Boot provides fast builds with automatic Swagger documentation.

## Files
- `build.gradle` — Gradle configuration with Spring Boot
- `src/main/java/com/devops/lab/DevOpsApplication.java` — Main Spring Boot App
- `src/main/java/com/devops/lab/CalculatorController.java` — REST Controller
- `src/main/resources/application.properties` — Configuration
- `Dockerfile` — Docker image
- `gradlew` — Gradle wrapper

## Usage

### Build Project
```bash
cd experiment-03-gradle
chmod +x gradlew
./gradlew clean build
```

### Run Application
```bash
./gradlew bootRun
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
docker build -t devops-gradle-app:latest .
```

### Run Docker Container
```bash
docker run -p 8080:8080 devops-gradle-app:latest
```

## Gradle Commands
```bash
./gradlew clean build      # Clean and build
./gradlew bootRun          # Run Spring Boot app
./gradlew test            # Run tests
./gradlew bootJar         # Create JAR
./gradlew bootDocker      # Build Docker image
```

## Swagger UI
Open http://localhost:8080/swagger-ui.html to see interactive API documentation.
