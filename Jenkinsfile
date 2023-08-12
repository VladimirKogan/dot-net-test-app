podTemplate(containers: [
    containerTemplate(
        name: 'dotnet', 
        image: 'mcr.microsoft.com/dotnet/sdk:5.0', 
        ttyEnabled: true,
        command: 'cat',
        resourceRequestCpu: '250m',
        resourceLimitCpu: '500m',
        resourceRequestMemory: '1Gi',
        resourceLimitMemory: '2Gi'
    ),
    containerTemplate(
        name: 'docker', 
        image: 'docker:20.10.8', 
        command: 'sh -c "sleep infinity"',
        resourceRequestCpu: '250m',
        resourceLimitCpu: '500m',
        resourceRequestMemory: '1Gi',
        resourceLimitMemory: '2Gi',
    )
]) {
    node(POD_LABEL) {
        stage('Get a .NET Project') {
            container('dotnet') {
                stage('Build .NET Project') {
                    sh '''
                    dotnet restore
                    dotnet build -c Release
                    '''
                }
            }
        }

        container('docker') {
            stage('Publish Docker Image') {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh '''
                    docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD
                    docker build -t vladimirkogan/testingimage:latest .
                    docker push vladimirkogan/testingimage:latest
                    '''
                }
            }
        }
    }
}
