#!/bin/bash

# Installing docker 
sudo apt update -y

sudo apt install docker.io docker-compose-v2 -y

sudo usermod -aG docker ubuntu && newgrp docker

if [[ "$?" == "0" ]];
then

# Cloning code
git clone -b DevOps https://github.com/DevMadhup/Springboot-BankApp.git

if [[ "$?" == "0" ]];
then
    echo "Code cloned.."
fi

# Building Code using docker
cd Springboot-BankApp
docker build -t madhupdevops/springboot-bankapp .

# Creating docker network
docker network create bankapp

# Running containers (MYSQL and BANKAPP)
docker run -itd --name mysql -e MYSQL_ROOT_PASSWORD=Test@123 -e MYSQL_DATABASE=BankDB --network=bankapp mysql

if [[ "$?" == "0" ]];
then
        echo "MySQL container depoyed" >> /home/ubuntu/mysql.log
fi

sleep 3;

docker run -itd --name BankApp -e SPRING_DATASOURCE_USERNAME="root" -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/BankDB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" -e SPRING_DATASOURCE_PASSWORD="Test@123" --network=bankapp -p 8080:8080 madhupdevops/springboot-bankapp

if [[ "$?" == "0" ]];
then
        echo "BankAPP container depoyed" /home/ubuntu/bankapp.log
fi

sleep 5;

if [[ "$?" == "0" ]];
then
        echo "BANKAPP container is healthy" >> /home/ubuntu/healthy.log
fi

fi