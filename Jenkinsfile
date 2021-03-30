pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Flutter Doctor') {
            steps {
                bat "flutter doctor"
            }
        }
        stage('Tests') {
            steps {
                bat "flutter test >> result.txt"
            }
            post {
                always {
					script
					{
						TEST_SUCCESS = bat (
							script: 'echo 1',
							returnStdout: true
						).trim()
						if(TEST_SUCCESS != '1')
						{
							error("Build failed because of this and that..")
						}
					}
                }
            }
        }
    }
}