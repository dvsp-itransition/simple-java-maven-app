pipeline {
    agent {
        node {
            label 'build'
        }
    }
    stages {
        stage('Building jar') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}