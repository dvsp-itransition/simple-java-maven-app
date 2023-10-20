pipeline {
    agent {
        node {
            label 'build'
        }
    }
    tools {
        maven 'maven3'
    }

    environment name: 'BUILDTYPE', value: 'CI'

    stages {
        stage('Building jar') { 
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