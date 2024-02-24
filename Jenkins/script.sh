#!/bin/bash
echo "Starting update of server"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Update is done, installing java"
usdo apt-get install fontconfig openjdk-17-jre -y
java --version

echo "Java is install now time oto jenkins"
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get install jenkins -y