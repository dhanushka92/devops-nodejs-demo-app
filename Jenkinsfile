pipeline {
    agent any
      tools {nodejs "nodejs"}
      stages {
          stage('fetch'){
              steps{
                  git 'https://github.com/dhanushka92/devops-nodejs-demo-app.git'
              }
          }
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
                  sshagent(['test-host']) {
                  sh 'ssh -o StrictHostkeyChecking=no -l ec2-user 13.232.93.84 sudo mkdir -p /home/ec2-user/app'
                  sh 'ssh -o StrictHostkeyChecking=no -l ec2-user 13.232.93.84 sudo chown -R ec2-user:ec2-user /home/ec2-user/app'
                  sh 'rsync -avz ./ ec2-user@13.232.93.84:/home/ec2-user/app'
              }
          }
          }
          
}
}
