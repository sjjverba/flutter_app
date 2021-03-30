pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
		stage ('test-html') {
			steps {
                 publishHTML([
				  allowMissing: false,
				  alwaysLinkToLastBuild: false,
				  keepAll: true,
				  reportDir: 'coverage',
				  reportFiles: 'index.html',
				  reportName: 'Flutter Report'
				])
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