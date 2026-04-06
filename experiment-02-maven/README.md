# Experiment 02: Working with Maven

## Aim
Create a Maven project from scratch, understand the POM file structure, manage dependencies, and use Maven plugins.

## Theory
Maven uses Project Object Model (pom.xml) to describe the project's build configuration. Maven lifecycle: validate → compile → test → package → verify → install → deploy.

## Files
- `pom.xml` — Maven configuration
- `src/main/java/com/devops/lab/App.java` — Main application
- `src/main/java/com/devops/lab/Calculator.java` — Calculator class
- `src/test/java/com/devops/lab/CalculatorTest.java` — JUnit tests
- `Dockerfile` — Docker image for Maven app

## Usage

### Build Project
```bash
mvn clean package
```

### Run Application
```bash
java -jar target/devops-maven-app-1.0-SNAPSHOT.jar
```

### Run Tests
```bash
mvn test
```

### Build Docker Image
```bash
docker build -t devops-maven-app:latest .
```

## Maven Commands
```bash
mvn clean          # Clean build artifacts
mvn compile        # Compile source code
mvn test           # Run unit tests
mvn package        # Create JAR
mvn install        # Install to local repo
mvn clean package  # Clean then build
```

## POM Structure
- `<groupId>` — Project group identifier
- `<artifactId>` — Project artifact name
- `<version>` — Project version
- `<dependencies>` — Required libraries
- `<build><plugins>` — Build plugins
