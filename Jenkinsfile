pipeline {
    agent any
    environment {
        PATH = "${env.PATH}:/opt/homebrew/bin" 
    }
    stages {
        stage('Source Code Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Gokul07013/intern-p1'
            }
        }
        stage('Docker Build and Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockercred', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
 
                        // Check Docker connection
                        sh 'docker build -t gokul4/py-1 . '
                        sh 'docker push gokul4/py-1 ' 
 
                     
                    }
                }
            }
        }
    }
}
