pipeline {
    agent any
    stages {
        stage('Testing Stage') {
            steps { 
                echo 'Hello World!'
                git 'https://github.com/shwetamummadi/practice.git' 
            }
        }
    }
    post {
                always {
                    junit '**/output.xml'
                    script {
                        envs.each {
                            step([$class: "RobotPublisher",
                                        disableArchiveOutput: false,
                                        otherFiles: "",
                                        outputFileName  : "**/output.xml",
                                        reportFileName  : '**/report.html',
                                        logFileName     : '**/log.html',
                                        passThreshold: 100,
                                        unstableThreshold: 0])
                        }
                    }
                }
            }
}
