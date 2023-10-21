def registry = '753743851231.dkr.ecr.us-east-2.amazonaws.com'
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

    parameters { string(name: 'DEPLOY_TO', defaultValue: 'staging', description: '') }

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
                    image = reponame + ":" + env.BUILD_ID // prepares tag name for the image
                    javapp = docker.build(image)                 
                }                
            }
            post {
                always {
                    sh "docker rmi ${reponame}:${env.BUILD_ID}"
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
                    docker.withRegistry('https://' + registry, 'ecr:us-east-2:awscred') {                                             
                        javapp.push()                          
                    }                                    
                }                
            }
        }

        stage('Deploy Image') {
            steps {
                script{
                    docker.withRegistry('https://' + registry, 'ecr:us-east-2:awscred') {
                                                
                        javapp.pull()  
                        sh 'docker stop javapp-staging || true && docker rm javapp-staging || true'                      
                        sh "docker run --name javapp-staging -P -d ${registry}/${reponame}:${env.BUILD_ID}"                                          
                    }                                    
                }                
            }
        }
    }  
}

// environment
// Execute the stage when the specified environment variable is set to the given value, for example: when { environment name: 'DEPLOY_TO', value: 'production' }.

// pipeline {
//     agent any
//     stages {
//         stage('Example Build') {
//             steps {
//                 echo 'Hello World'
//             }
//         }
//         stage('Example Deploy') {
//             when {
//                 branch 'production'
//                 environment name: 'DEPLOY_TO', value: 'production'
//             }
//             steps {
//                 echo 'Deploying'
//             }
//         }
//     }
// }