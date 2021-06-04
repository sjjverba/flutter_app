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
				if(isUnix())
				{
					sh "sh run_docker.sh"
				}
				else
				{
					sh "call run_docker.cmd"
				}
            }
        }
        stage('Check test result') {
            steps {
				if(isUnix())
				{
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
				else
				{
					script
					{
						TEST_SUCCESS = bat (
							script: 'echo 1',
							returnStdout: true
						).trim()
						
						TEST_RESULT = bat (
							script: 'grep "All tests passed!" result.txt | wc -l',
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