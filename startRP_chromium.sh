#!/bin/bash

echo "allowing access to x server with xhost +local:root"
xhost +local:root
echo "checking if chromium installed"
sudo docker apt-get install -qq -y chromium-browser
echo "starting reprophylo container"
sudo docker run --name rpnotebook -d -p 8888:8888 -e "PASSWORD=password" -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v $1:/notebooks -e DISPLAY=$DISPLAY szitenberg/reprophylo
echo "starting chromium. Click proceed if asked."
chromium-browser https://localhost:8888
