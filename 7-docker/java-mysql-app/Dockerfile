FROM openjdk:8-jre-alpine

EXPOSE 8080

ENV DB_USER=dev \
    DB_PWD=mentat \
    DB_SERVER=localhost \
    DB_NAME=java-app

RUN mkdir /opt/app

COPY build/libs/bootcamp-java-mysql-project-1.0-SNAPSHOT.jar /opt/app

WORKDIR /opt/app

CMD ["java", "-jar", "bootcamp-java-mysql-project-1.0-SNAPSHOT.jar"]
