pipeline {
	agent {
        any
    }
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
						
						TEST_RESULT = bat (
							script: 'echo 0',
							returnStdout: true
						).trim()
						
						if(TEST_RESULT != TEST_SUCCESS)
						{
							error("Some UnitTests failed")
						}						
					}
                }
            }
        }
    }
}