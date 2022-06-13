while :
do
        sleep 5
        echo -e "GET http://google.com/ HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
        if [ $? -eq 0 ]; then
                echo "Online"
        else
                echo "Offline"
                sudo networksetup -setnetworkserviceenabled Wi-Fi off && sudo networksetup -setnetworkserviceenabled Wi-Fi on
                openssl rand -hex 6 | sed 's/\(..\)\(..\)\(..\)\(..\)\(..\)\(..\)/\1:\2:\3:\4:\5:\6/' |  xargs  sudo  ifconfig  en0  ether
                networksetup -detectnewhardware
                sleep 10
        fi
done
