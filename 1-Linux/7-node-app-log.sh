#!/bin/bash

# Prepare the env
sudo apt-get update

# Install the tools needed
sudo apt-get install -y nodejs npm wget net-tools
sleep 10

# Check NodeJS
nodejsv=$(nodejs -v)
echo "Node.JS is installed with the version $nodejsv"
sleep 5

# Check NPM
npmv=$(npm -v)
echo "NPM is installed with the version $npmv"
sleep 5

# Download Artefact
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz
echo "Artefact downloaded"
sleep 5

# Extract Artefact
tar --extract --file bootcamp-node-envvars-project-1.0.0.tgz
echo "Artefact archived"
sleep 5

# Setup env var
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# Ask where to save the log
read -p "Where do you to store the log? Enter the absolute path of the folder: " log_directory

# Check if the folder exist
if [ ! -d "$log_directory" ]; then
  echo "$log_directory does not exist."
  mkdir $log_directory
  echo "Log folder created created"
fi

# Setup DB folder env
export LOG_DIR=$log_directory

echo "Local Environment configured"
sleep 5

# Run the Server in background
cd package

npm install

node server.js &
sleep 5
echo "The Node Server is running in the background."

# Show the process
nodeid=$(pgrep node)
echo "Node.js Server process ID: $nodeid"

#Show the port used
sudo netstat -ltnp | grep :3000