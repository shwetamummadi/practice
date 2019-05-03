pipeline {
    agent any
    stages {
        stage('Testing Stage') {
            steps { 
                echo 'Hello World!'
                git 'https://github.com/shwetamummadi/practice.git' 
                bat 'CurisHealth'
            }
        }
    }
    post {
                always {
                    build 'GitCode'
                }
            }
}
