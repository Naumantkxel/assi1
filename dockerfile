FROM openjdk:17
COPY ./dockerfile
WORKDIR /dockerfile
ENTRYPOINT ["java","HelloWorld"]
