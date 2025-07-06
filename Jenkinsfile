pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'bhavyansh862/flask-app:latest'
  }

  stages {
    stage('Clone GitHub Repo') {
      steps {
        git 'https://github.com/bhavyansh862/devops_project1.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${DOCKER_IMAGE}")
        }
      }
    }

    stage('Push to DockerHub') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml'
        sh 'kubectl apply -f k8s/service.yaml'
      }
    }
  }
}
