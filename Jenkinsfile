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
                  sh 'ssh ec2-user@13.232.39.10 'sudo mkdir -p /app; sudo chown -R ec2-user. /app''
                  sh 'rsync -avz ./ ec2-user@13.232.39.10:/app/'
                   }
          }
}
}

