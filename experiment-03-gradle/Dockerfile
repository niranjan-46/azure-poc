FROM openjdk:17-jdk-slim
LABEL maintainer="DevOps Workshop"

WORKDIR /app

COPY experiment-03-gradle/build/libs/*.jar app.jar

EXPOSE 8080

ENV JAVA_OPTS="-Xmx512m -Xms256m"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
