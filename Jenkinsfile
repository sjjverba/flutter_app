pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                checkout scm
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

		build job: 'Docs_LoadTest'
		stage('Results') {
		publishHTML([allowMissing: false,
		 alwaysLinkToLastBuild: true,
		 keepAll: true,
		 reportFiles: 'index.html',
		 reportName: 'Docs Loadtest Dashboard'
		 ])
		}
		
    }
}