#!/bin/bash
# Install Java
sudo apt install default-jre
# Check the version
if java -version == *"openjdk version"*
  then
    echo "Java is successfully installed!"
  else
    echo "Java is not installed, please retry."
  fi
