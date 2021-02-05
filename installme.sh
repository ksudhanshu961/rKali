#!/bin/bash

#Always run as root

if [ "$EUID" -ne 0 ]
  then echo "You must run with root privileges."
  exit

else
gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys 7D8D0BF6
gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6
gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -

mkdir -p /root/.rkali/bkp && cp /etc/apt/sources.list /root/.rkali/bkp/

chmod +x bin/kali
mv bin/kali /usr/bin/

echo -e "\e[32m\e[1m[+] Installation Finished :)"
printf "\n"
echo -e "[+] To enable type kali -e"
echo -e "[+] To disable type kali -d\e[0m"
fi
exit
