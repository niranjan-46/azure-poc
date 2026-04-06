FROM openjdk:17-jdk-slim
LABEL maintainer="DevOps Workshop"

WORKDIR /app

COPY target/devops-maven-app-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

ENV JAVA_OPTS="-Xmx512m -Xms256m"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
