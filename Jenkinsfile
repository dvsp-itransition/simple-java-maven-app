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

        stage('Unit Tests') { 
            steps {
                sh 'mvn test' 
            }
        }
    }  
}