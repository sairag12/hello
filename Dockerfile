# Phase 1: Build the JAR file using Maven and OpenJDK 21
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
# Compile the package and skip test suites since GitHub Actions already verified them
RUN mvn clean package -DskipTests

# Phase 2: Lightweight runtime environment
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/hello-0.0.1-SNAPSHOT.jar app.jar

# Expose Render's standard web traffic distribution routing port
EXPOSE 10000

# Start the Spring Boot application, dynamically passing the active environment profile
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=${PORT:10000}", "--spring.profiles.active=${SPRING_PROFILES_ACTIVE:dev}"]
