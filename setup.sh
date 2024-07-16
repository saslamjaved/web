#!/bin/bash
sudo apt update
sudo apt install -y python3-pip python3-dev nginx
sudo pip3 install virtualenv
mkdir ~/project
cd ~/project
virtualenv env
source env/bin/activate
git clone https://github.com/robosulthan/iks.git
cd dev
virtualenv env
source env/bin/activate

