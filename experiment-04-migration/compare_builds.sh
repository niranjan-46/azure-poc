#!/bin/bash
# compare_builds.sh — compare Maven vs Gradle build times

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

echo '=== Maven Build Time ==='
cd "$PARENT_DIR/experiment-02-maven"
time mvn clean package -q

echo ''
echo '=== Gradle Build Time (cold) ==='
cd "$PARENT_DIR/experiment-03-gradle"
chmod +x gradlew
time ./gradlew clean build -q

echo ''
echo '=== Gradle Build Time (incremental - no change) ==='
cd "$PARENT_DIR/experiment-03-gradle"
time ./gradlew build -q
