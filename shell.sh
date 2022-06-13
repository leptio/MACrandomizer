#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install wget
while :
do
		wget -q --tries=5 --timeout=1 --spider http://google.com
		if [[ $? -eq 0 ]]; then
				echo "Online"
		else
				sudo networksetup -setnetworkserviceenabled Wi-Fi off
				newmac = openssl rand -hex 6 | sed ‘s/(..)/\1:/g; s/.$//’
				sudo ifconfig en0 ether newmac
				networksetup -detectnewhardware
				sudo networksetup -setnetworkserviceenabled Wi-Fi on
				echo "Offline"
		fi
done
