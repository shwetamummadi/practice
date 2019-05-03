pipeline {
    agent any
    stages {
        stage('Testing Stage') {
            steps { 
                echo 'Hello World!'
                bat 'dir'
            }
        }
    }
    post {
                always {
                    build 'GitCode'
                }
            }
}
