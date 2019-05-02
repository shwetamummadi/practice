pipeline {
    agent any
    stages {
        stage('Testing Stage') {
            steps { 
                echo 'Hello World!'
                git 'https://github.com/shwetamummadi/practice.git' 
            }
        }
        stage('Post Build Actions') {
            steps {
        [outputPath       : 'portfolio-app\\target\\robot-output\\' + type,
        passThreshold    : 100,
        unstableThreshold: 100,
        otherFiles       : '',
        reportFileName   : '*\\report*.html',
        logFileName      : '*\\log*.html',
        outputFileName   : '*\\output*.xml']
            }
        }
    }
}
