def registry = '753743851231.dkr.ecr.us-east-2.amazonaws.com/dvsp-repo'
def imageName 
def version

pipeline {
    agent {
        node {
            label 'build'
        }
    }
    tools {
        maven 'maven3'
    }

    stages {
        stage('Building warfile') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }

        // stage('Unit Tests') { 
        //     steps {
        //         sh 'mvn test' 
        //     }
        // }

        stage('Build Image') {
            steps {
                script{
                    javapp = docker.build(registry + "${env.BUILD_ID}")                 
                }                
            }
        }

        // stage('Scan Image'){
        //     steps{                
        //         sh "trivy image dvsp-javapp:${env.BUILD_ID}"
        //     }
        // }

        // stage('Push Image') {
        //     steps {
        //         script{
        //             docker.withRegistry(registry, 'credentials-id') {
                        
        //                 javapp.push()                          
        //             }
                                    
        //         }                
        //     }
        // }
    }  
}