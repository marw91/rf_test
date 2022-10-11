pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f ./Dockerfile -t robot .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker compose up'
            }
        }
    }
}