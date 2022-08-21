# the first stage of our build will use a maven 3.6.1 parent image
FROM maven:3.6.3-jdk-8-alpine AS MAVEN_BUILD

FROM anapsix/alpine-java

# copy the pom and src code to the container
COPY . ~/Dcouments/assignment1/testfile.java
# package our application code
RUN mvn clean package

# the second stage of our build will use open jdk 8 on alpine 3.9
FROM openjdk:8-jre-alpine3.9

LABEL maintainer="muhammad.nauman@tkxel.io"

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD /docker-multi-stage-build-demo/target/demo-0.0.1-SNAPSHOT.jar /demo.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/demo.jar"]
<div class="open_grepper_editor" title="Edit & Save To Grepper"></div>
