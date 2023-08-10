pipeline {
    agent {
        label 'jenkins-pod'
    }
    stages {
        // stage('Clone Git') {
        //     steps {
        //         git 'https://github.com/<your-repo>/<your-app>.git'
        //     }
        // }
        stage('Build') {
            steps {
                sh 'dotnet restore'
                sh 'dotnet build --configuration Release --no-restore'
            }
        }
        stage('Publish') {
            steps {
                sh 'dotnet publish --configuration Release --no-build --output ./publish'
            }
        }
        stage('LS'){
            steps{
                sh 'ls'
                sh 'ls -la'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t simpleapp:latest .'
            }
        }
    }
}
