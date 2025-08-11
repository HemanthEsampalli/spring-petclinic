FROM 3.9.11-eclipse-temurin-17-alpine as build
RUN git clone https://github.com/HemanthEsampalli/spring-petclinic.git  && \ cd spring-petclinic && \ mvn package

FROM openjdk:25-ea-17-jdk as RUN
RUN adduser -D -h /usr/share/demo -s /bin/bash user1
USER user1
WORKDIR /usr/share/demo
COPY --FROM= build /target/*.jar .
EXPOSE 8080/tcp
CMD ["java", "-jar", "*.jar"]