FROM openjdk:17-slim
EXPOSE 8085
ADD target/OperacionesAPI-0.0.1-SNAPSHOT.jar operaciones.jar
ENTRYPOINT ["java","-jar","/operaciones.jar"]