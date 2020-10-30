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
                  ssh-keyscan 192.168.33.11 >> /var/lib/jenkins/.ssh/known_hosts
                  ssh-keyscan 192.168.33.12 >> /var/lib/jenkins/.ssh/known_hosts

                  rsync -avz -e "ssh -i $sshkey" ./ vagrant@192.168.33.11:/app/
                  rsync -avz -e "ssh -i $sshkey" ./ vagrant@192.168.33.12:/app/

                  ssh vagrant@192.168.33.11 "sudo pkill node; cd /app; node index.js > output.log 2>&1 &"
                  ssh vagrant@192.168.33.12 "sudo pkill node; cd /app; node index.js > output.log 2>&1 &"

                  '''
              }
          }
      }
    }
}

