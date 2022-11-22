#!/bin/bash


npm install


# 192.168.33.11 and 192.168.33.12 are our two NodeJS backends

ssh ec2-user@13.232.39.10 'sudo mkdir -p /app; sudo chown -R ec2-user. /app'
rsync -avz ./ ec2-user@13.232.39.10:/app/
ssh ec2-user@13.232.39.10 "sudo systemctl restart mynode"


