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
						TEST_SUCCESS = sh (
							script: 'echo 1',
							returnStdout: true
						).trim()
						
						TEST_RESULT = sh (
							script: 'grep "All tests passed!" result.txt | wc -l',
							returnStdout: true
						).trim()
						
						echo "$TEST_RESULT"
						echo TEST_RESULT
						
						if(TEST_RESULT != TEST_SUCCESS)
						{
							error("Some UnitTests failed")
						}						
					}
            }
        }
    }
}