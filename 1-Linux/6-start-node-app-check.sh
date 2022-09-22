#!/bin/bash
# 1 - Install NodeJS and NPM and print out which versions were installed
sudo apt-get install -y nodejs npm wget net-tools
nodejs --version
echo "NodeJS sucessfuly installed"
sleep 15
# 2 - Download an artifact file and unzip it
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz
echo "Artefact downloaded"
tar --extract --file bootcamp-node-envvars-project-1.0.0.tgz
echo "Artefact unarchived"
# 3 - Set the following needed environment variables
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
echo "Local Environment configured"
sleep 15
# 4 - Run the NodeJS application in the background
cd package
npm install
nohup node server.js &
echo "The Node Server is up & running in the backgroud."
nodeid=$(pgrep node)
echo "Node.js Server process ID: $nodeid"
echo "The Server run on port 3000:"
sudo netstat -ltnp | grep :3000