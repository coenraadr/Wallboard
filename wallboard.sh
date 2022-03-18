#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox xdotool -y
#Install Chromium Browser
sudo apt-get install --no-install-recommends chromium-browser -y
#Create bash_profile
echo '[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx -- -nocursor' > .bash_profile
#Append autostart
echo '#!/bin/bash 
xset s noblank
xset s off
xset -dpms
unclutter -idle 0.5 -root &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://www.quotationspage.com/random.php &
while true; do
   xdotool keydown ctrl+F5; xdotool keyup ctrl+F5;
   sleep 10
done
' >> /etc/xdg/openbox/autostart
#Reboot
sudo reboot
