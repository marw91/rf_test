pipeline {
    agent    any
    stages {
        stage('Build') {
            steps {
                bash 'docker build -f ./Dockerfile -t robot .'
            }
        }
        stage('Test') {
            steps {
                bash 'docker compose up'
            }
        }
    }
}