def secret = 'app'
def server = 'app@103.189.235.91'
def directory = 'literature-backend2'
def branch = 'main'



pipeline{
    agent any

   post {
    always {
   discordSend description: 'Jenkins Build', enableArtifactsList: true, footer: '', image: '', link: '', result: '', scmWebUrl: '', showChangeset: true, thumbnail: '', title: 'Jenkins Literature Backend', webhookURL: 'https://discord.com/api/webhooks/1050591484052766740/fX357kf9wiKUhoSlW2aVwa0WnQK0wmMQb4gP7Tulwi6EULxbmwpFzXazPdPRc4L49e4D'
    }
  }

    stages{
        stage ('delete docker & git pull'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose down
                    docker system prune -f
                    git pull origin ${branch}
                    exit
                    EOF"""
                }
            }
        }
        stage ('docker build'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose build
                    exit
                    EOF"""
                }
            }
        }
        stage ('docker up'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose up -d
                    exit
                    EOF"""
                }
            }
        }
    }
}