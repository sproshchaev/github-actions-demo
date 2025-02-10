# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the target directory
COPY target/github-actions-demo-1.0.jar /app/github-actions-demo.jar

# Command to run the application
CMD ["java", "-jar", "github-actions-demo.jar"]