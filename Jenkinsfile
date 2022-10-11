pipeline {
    agent    any
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