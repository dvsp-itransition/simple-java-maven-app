pipeline {
    agent {
        node {
            label 'build'
        }
    }

    tools{
        maven 'maven3'
    }

    stages {
        stage('Building jar') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }

    stage('Unit Tests') { 
        steps {
            sh 'mvn test' 
        }
        post {
            always {
                junit 'target/surefire-reports/*.xml' 
            }
        }
    }
}