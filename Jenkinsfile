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
				script{
				
				if(isUnix())
				{
					sh "sh run_docker.sh"
				}
				else
				{
					bat "run_docker.cmd"
				}
				}
            }
        }
        stage('Check test result') {
            steps {
			script
			{
				if(isUnix())
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
				
				else
				{
					
					TEST_SUCCESS = bat (
						script: 'echo 1',
						returnStdout: true
					).trim()
					
					TEST_RESULT = bat (
						script: 'find /C "@" < "result.txt"',
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