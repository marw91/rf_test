pipeline {
    agent    any
    stages {
        stage('Build') {
            steps {
                bat 'docker build -f ./Dockerfile -t robot .'
            }
        }
        stage('Test') {
            steps {
                bat 'docker compose up'
            }
        }
    }
}