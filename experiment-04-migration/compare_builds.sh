#!/bin/bash
# compare_builds.sh — compare Maven vs Gradle build times

echo '=== Maven Build Time ==='
time mvn clean package -q

echo ''
echo '=== Gradle Build Time (cold) ==='
time ./gradlew clean build -q

echo ''
echo '=== Gradle Build Time (incremental - no change) ==='
time ./gradlew build -q
