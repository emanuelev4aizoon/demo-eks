pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub-emanuelev4aizoon')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/emanuelev4aizoon/demo-eks.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t emanuelev4aizoon/nodeapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push emanuelev4aizoon/nodeapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
