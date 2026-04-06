# Experiment 03: Working with Gradle

## Aim
Set up a Gradle project, understand Groovy DSL build scripts, manage dependencies and automate tasks.

## Theory
Gradle is a modern build system using Groovy/Kotlin DSL. It has incremental build with build cache, making it faster than Maven.

## Files
- `build.gradle` — Gradle configuration (Groovy DSL)
- `settings.gradle` — Project settings
- `gradlew` — Gradle wrapper (Linux)
- `gradlew.bat` — Gradle wrapper (Windows)
- `gradle/wrapper/gradle-wrapper.properties` — Wrapper config
- `src/main/java/com/devops/lab/App.java` — Main application
- `src/main/java/com/devops/lab/Calculator.java` — Calculator class
- `src/test/java/com/devops/lab/CalculatorTest.java` — JUnit tests
- `Dockerfile` — Docker image for Gradle app

## Usage

### Build Project
```bash
chmod +x gradlew
./gradlew clean build
```

### Run Application
```bash
./gradlew run
```

### Run Tests
```bash
./gradlew test
```

### Custom Tasks
```bash
./gradlew hello        # Custom hello task
./gradlew projectInfo  # Display project info
./gradlew tasks       # List all tasks
```

### Build Docker Image
```bash
docker build -t devops-gradle-app:latest .
```

## Gradle Commands
```bash
./gradlew clean       # Clean build artifacts
./gradlew build       # Full build (compile+test+jar)
./gradlew test        # Run tests
./gradlew run         # Run application
./gradlew clean build # Clean then build
```

## Custom Tasks
```groovy
tasks.register('hello') {
    doLast { println 'Hello from Gradle!' }
}
```
