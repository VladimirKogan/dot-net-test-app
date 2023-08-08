pipeline {
    agent none
    stages {
        // stage('Clone Git') {
        //     steps {
        //         git 'https://github.com/<your-repo>/<your-app>.git'
        //     }
        // }
        stage('Build') {
            agent { docker 'mcr.microsoft.com/dotnet/sdk:5.0' }
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
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
