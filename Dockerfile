# Stage 1- Build the JAR (Java Application runtime)

FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . /app

# create JAR File

RUN mvn clean install -DskipTests=true

# Stage 2 - Execute JAR file from above stage

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expenseapp.jar


CMD ["java", "-jar","expenseapp.jar"]
