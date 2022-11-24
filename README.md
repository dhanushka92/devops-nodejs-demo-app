This is created for demonstration of [automated nodejs deployment using jenkins](https://github.com/MansoorMajeed/devops-from-scratch/blob/master/episodes/27-create-real-life-end-to-end-jenkins-pipeline.md)
deployment made using sshagent plugin
1.Create ssh-keygen as ec2-user in deployment machine
2. Copy the public key generated to the authorized keys file
3. copy the private key to jenkins credentials in ssh username and pswd 
4. while generating script use sshagent with sshcreds
