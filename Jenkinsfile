pipeline {
	agent any
    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Run Docker') {
            steps {
                sh "sh run_docker.sh"
            }
        }
        stage('Check test result') {
            steps {
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