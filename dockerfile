FROM openjdk-8-alpine
COPY ./dockerfile
WORKDIR /dockerfile
ENTRYPOINT ["java","HelloWorld"]
