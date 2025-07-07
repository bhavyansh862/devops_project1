pipeline {
    agent any

    environment {
    DOCKER_IMAGE = "bhavyansh0881/flask-app:latest"
    DOCKER_CREDENTIALS_ID = "dockerhub"  
        KUBECONFIG = '/var/lib/jenkins/.kube/config'       
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/bhavyansh862/devops_project1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                }
            }
        }
    }
}
