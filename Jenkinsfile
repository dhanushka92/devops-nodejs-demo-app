pipeline {
    agent any

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
                withCredentials([sshUserPrivateKey(credentialsId: "jenkins-ssh", keyFileVariable: 'sshkey')]){
                  echo 'deploying the software'
                  sh '''#!/bin/bash
                  echo "Creating .ssh"
                  mkdir -p /var/lib/jenkins/.ssh
                  ssh-keyscan 13.232.39.10 >> /var/lib/jenkins/.ssh/known_hosts
                 
                  rsync -avz --exclude  '.git' --delete -e "ssh -i $sshkey" ./ ec2-user@13.232.39.10:/app/
                  

                  ssh -i $sshkey ec2-user@13.232.39.10 "sudo systemctl restart mynode"
      
                  '''
              }
          }
      }
    }
}

