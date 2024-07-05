pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
        DOCKER_IMAGE = 'your-docker-repo/version-app:latest'
        KUBECONFIG_CREDENTIALS_ID = 'kubeconfig-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                withCredentials([file(credentialsId: KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f kubernetes/'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
