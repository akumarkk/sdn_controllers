#!/bin/bash
# FloodLight
sudo apt-get update
sudo apt-get install build-essential default-jdk ant python-dev eclipse
git clone git://github.com/floodlight/floodlight.git
cd floodlight
sudo mkdir /var/lib/floodlight
sudo chmod 777 /var/lib/floodlight
sudo ant

