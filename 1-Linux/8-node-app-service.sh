#!/bin/bash
# Execute this script with sudo
#Define Variable
NEW_USER="npmserver"
echo "###################"
# Ask where to save the log
read -p "Where do you to store the log? Enter the absolute path of the folder: " log_directory

# Check if the folder exist
if [ ! -d "$log_directory" ]; then
  echo "$log_directory does not exist."
  mkdir $log_directory
  echo "Log folder created created"
fi

# Prepare the env
apt update

# Install the tools needed
apt install -y nodejs npm wget net-tools
sleep 10

# Check NodeJS
nodejsv=$(nodejs -v)
echo "Node.JS is installed with the version $nodejsv"
sleep 5

# Check NPM
npmv=$(npm -v)
echo "NPM is installed with the version $npmv"
sleep 5

# --- Now we start to work on the service user ---
echo "###################"
# Create the Service User
useradd $NEW_USER -m
chown -R  $NEW_USER $log_directory

# Download Artefact
runuser -l $NEW_USER -c "wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
echo "Artefact downloaded"
sleep 5

# Extract Artefact
runuser -l $NEW_USER -c "tar --extract --file bootcamp-node-envvars-project-1.0.0.tgz"
echo "Artefact archived"
sleep 5

# Setup env var
runuser -l $NEW_USER -c "
  export APP_ENV=dev &&
  export DB_USER=myuser &&
  export DB_PWD=mysecret &&
  export LOG_DIR=$log_directory &&
  cd package &&
  npm install &&
  node server.js &"

sleep 5
echo "The Node Server is running in the background."
echo "###################"
sleep 5
# Show the process
nodeid=$(pgrep node)
echo "Node.js Server process ID: $nodeid"

#Show the port used
netstat -ltnp | grep :3000