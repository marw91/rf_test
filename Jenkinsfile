pipeline {
    agent    any
    stages {
        stage('Build') {
            steps {
                bat 'docker build -f ./Dockerfile -t robot .'
            }
        }
        stage('Run test') {
            steps {
                bat 'docker compose up'
                // jenkins robot framework plugin "publish robotframework test results"
                // doe wat met test uitslag
            }
        }
        stage('Verify test succeeded') {
            steps {
                bat "robot outputPath: '/reports, logFileName: 'log.html', outputFileName: 'output.xml', reportFileName: 'report.hml', passThreshold: 100, unstableThreshold: 75.0'"
            }
        }
    }
}