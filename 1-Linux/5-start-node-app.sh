#!/bin/bash
# 1 - Install NodeJS and NPM and print out which versions were installed
sudo apt-get install nodejs npm
nodejs --version
echo "NodeJS successfully installed"
# 2 - Download an artifact file and unzip it
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz
echo "Artefact downloaded"
tar --extract --file bootcamp-node-envvars-project-1.0.0.tgz
echo "Artefact archived"
# 3 - Set the following needed environment variables
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
echo "Local Environment configured"
# 4 - Run the NodeJS application in the background
cd package
npm install
# I used forever because it's easier to kill compare to nohup
sudo forever start node server.js
echo "The Node Server is up & running in the backgroud."
echo "To stop the Server, type: sudo forever stop server.js"
