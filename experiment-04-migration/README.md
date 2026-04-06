# Experiment 04: Build & Run Java App — Maven to Gradle Migration

## Aim
Build and run a Java application using Maven, then migrate to Gradle and verify identical behaviour.

## Files
- `compare_builds.sh` — Compare Maven vs Gradle build times

## Usage

### Compare Build Times
```bash
chmod +x compare_builds.sh
./compare_builds.sh
```

### Migration Steps
```bash
# From Maven project
rm pom.xml

# Initialize Gradle
gradle wrapper --gradle-version 8.6

# Create build.gradle (use content from Experiment 3)
# Create settings.gradle
echo "rootProject.name = 'devops-maven-app'" > settings.gradle

# Build with Gradle
./gradlew clean build
```

## Comparison Results
- Maven: Standard build
- Gradle (cold): First build
- Gradle (incremental): Second build (faster due to cache)
