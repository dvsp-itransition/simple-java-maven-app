def registry = 'https://753743851231.dkr.ecr.us-east-2.amazonaws.com'
def reponame = 'dvsp-javappimage'
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
                    imageTag = reponame +":" + env.BUILD_ID // prepares tag name for the image
                    javapp = docker.build(imageTag)                 
                }                
            }
        }

        // stage('Scan Image'){
        //     steps{                
        //         sh "trivy image dvsp-javapp:${env.BUILD_ID}"
        //     }
        // }

        stage('Push Image') {
            steps {
                script{
                    docker.withRegistry('https://753743851231.dkr.ecr.us-east-2.amazonaws.com', 'credentials-id') {
                        
                        javapp.push()                          
                    }
                                    
                }                
            }
        }
    }  
}