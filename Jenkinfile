pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-nginx"
        CONTAINER_NAME = "nginx-container"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull code from GitHub (your repo must have Dockerfile + index.html)
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove old container if it exists
                    sh '''
                    docker ps -q --filter "name=$CONTAINER_NAME" | grep -q . && docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 8080:80 $IMAGE_NAME
                    '''
                }
            }
        }

        stage('Verify') {
            steps {
                script {
                    sh 'curl -I http://localhost:8080 || true'
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished!"
        }
    }
}

