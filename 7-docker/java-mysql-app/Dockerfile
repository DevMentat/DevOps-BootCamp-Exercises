FROM openjdk:8-jre-alpine

ENV DB_USER=dev \
    DB_PWD=mentat \
    DB_SERVER=localhost \
    DB_NAME=java-app

COPY build/libs/bootcamp-java-mysql-project-*.*-SNAPSHOT.jar /java-app.jar

CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=test", "/java-app.jar"]
