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
        stage('Test') {
            steps {
                bat "flutter test --coverage"
            }
            post {
                always {
                    bat "python3 lcov_cobertura.py coverage/lcov.info --output coverage/coverage.xml"
                    step([$class: 'CoberturaPublisher', coberturaReportFile: 'coverage/coverage.xml'])
                }
            }
        }
        stage('Run Analyzer') {
            steps {
                bat "dartanalyzer --options analysis_options.yaml ."
            }
        }
    }
}