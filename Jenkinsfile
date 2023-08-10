pipeline {
    agent any
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
        stage('Before Deploy to Kubernetes') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get pods -n devops'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
