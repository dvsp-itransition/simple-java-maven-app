def registry 
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
                    def javappimage = docker.build("dvsp-javapp:${env.BUILD_ID}")                 
                }                
            }
        }

        stage('Scan Image'){
            steps{

                echo "Image name - dvsp-javapp:${env.BUILD_ID}"

                sh 'trivy image dvsp-javapp:${env.BUILD_ID}'
            }
        }

    }  
}