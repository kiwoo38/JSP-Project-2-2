FROM maven:3.9.6-eclipse-temurin-17 as builder
WORKDIR /app
COPY . .
RUN mvn -B clean package

FROM tomcat:9.0-jdk17-temurin
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
