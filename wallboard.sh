#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox -y
sudo apt-get install --no-install-recommends chromium-browser
