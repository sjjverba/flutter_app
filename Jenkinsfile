pipeline {
    agent any
	environment
	{
		PATH="C:\Windows\System32"
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
        stage('Test') {
            steps {
                sh "flutter test --coverage"
            }
            post {
                always {
                    sh "python3 lcov_cobertura.py coverage/lcov.info --output coverage/coverage.xml"
                    step([$class: 'CoberturaPublisher', coberturaReportFile: 'coverage/coverage.xml'])
                }
            }
        }
        stage('Run Analyzer') {
            steps {
                sh "dartanalyzer --options analysis_options.yaml ."
            }
        }
    }
}