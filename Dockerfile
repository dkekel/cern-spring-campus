FROM alpine as pull

ADD https://github.com/dkekel/cern-spring-campus/archive/master.zip /home/demo/spring-campus-demo.zip

WORKDIR /home/demo

RUN ["unzip","spring-campus-demo.zip"]

FROM gradle:jdk11 as builder

COPY --chown=gradle:gradle --from=pull /home/demo/cern-spring-campus-master /home/gradle/spring-campus-demo

WORKDIR /home/gradle/spring-campus-demo

RUN ["gradle", "build"]

FROM openjdk:11-jre-slim

COPY --from=builder /home/gradle/spring-campus-demo/build/libs /app

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java","-jar","spring-campus-0.0.1-SNAPSHOT.jar"]
