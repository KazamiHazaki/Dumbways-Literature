def credential = 'kel2'
def userdock = 'kazamisei98'
def server = 'app@103.189.235.91'
def directory = 'literature-backend2'
def url = 'https://github.com/KazamiHazaki/Dumbways-Literature'
def branch = 'main'
def image = 'literature-be:1.3'



pipeline {
    agent any

    stages {
        stage('Pull from BE repo') {
            steps {
               sshagent([credential]) {
                    sh """ssh -o StrictHostkeyChecking=no ${server} << EOF
                    cd ${directory}
                    git remote add origin ${url} || git remote set-url origin ${url}
                    git pull ${url} ${branch}
                    exit
                    EOF"""
            }
        }
    }
        stage('Docker Build') {
            steps {
                 sh """ssh -o StrictHostkeyChecking=no ${server} << EOF
                cd ${directory}
                docker-compose build
                exit
                EOF"""
            }
        }
        stage('Docker Compose') {
            steps {
                sh """ssh -o StrictHostkeyChecking=no ${server} << EOF
                cd ${directory}
                docker-compose up -d
                exit
                EOF"""
            }
        }
    }
}
