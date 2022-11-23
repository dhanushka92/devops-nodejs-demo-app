pipeline {
    agent any
      tools {nodejs "nodejs"}
      stages {
          stage('build') {
              steps {
                  echo 'building the software'
                  sh 'npm install'
              }
          }
          stage('test') {
              steps {
                  echo 'testing the software'
                  sh 'npm test'
              }
          }

          stage('deploy') {
              steps {
                
                  rsync -avz --exclude  '.git' --delete -e "ssh -v" ./ ec2-user@13.232.39.10:/app/
                   }
          }
}
}

