pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                checkout scm
				publishHTML (target : [allowMissing: false,
				 alwaysLinkToLastBuild: true,
				 keepAll: true,
				 reportDir: '',
				 reportFiles: 'index.html',
				 reportName: 'Code coverage',
				 reportTitles: 'Code coverage'])
            }
        }
		stage ("search text")
		{
		 publishers {
			findText {
			  textFinders {
				textFinder {
				  regexp 'html'
				  fileSet 'index.html'
				  changeCondition 'MATCH_FOUND'
				  alsoCheckConsoleOutput true
				  buildResult 'UNSTABLE'
				}
			  }
			}
		  }
		}
		stage ('Download lcov converter') {
            steps {
                bat "curl -O https://raw.githubusercontent.com/eriwen/lcov-to-cobertura-xml/master/lcov_cobertura/lcov_cobertura.py"
            }
        }
        stage ('Flutter Doctor') {
            steps {
				print "DEBUG: parameter foo ="
                bat "flutter doctor"
            }
        }
        stage('Test') {
            steps {
                bat "flutter test --coverage"
            }
            post {
                always {
                    bat "python lcov_cobertura.py coverage/lcov.info --output coverage/coverage.xml"
                    step([$class: 'CoberturaPublisher', coberturaReportFile: 'coverage/coverage.xml'])
                }
            }
        }		
    }
}