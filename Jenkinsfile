pipeline{
    agent any
    environment {
        password = credentials('dockerhub-pwd')
    }
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Crear Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Manuel486/OperacionesAPI']])
                bat 'mvn clean install'
            }
        }
        stage('Crear imagen en docker'){
            steps{
                script{
                    bat 'docker build -t manuel486/operaciones:v1 .'
                }
            }
        }
        stage('Subiendo imagen a docker hub'){
            steps{
                bat "docker login -u manuel486 -p ${password}"
                bat 'docker push manuel486/operaciones:v1'
            }
        }
        stage('Levantando contenedor'){
            steps{
                bat "docker run --name operaciones-api -p 8085:8085 manuel486/operaciones:v1"
            }
        }
    }
}