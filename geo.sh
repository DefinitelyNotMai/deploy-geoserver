#!bin/sh

sudo apt update && sudo apt upgrade
sudo apt install default-jre default-jdk
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt install postgis postgresql-13-postgis-3

sudo mkdir /usr/share/geoserver
sudo chown -R $(whoami):$(whoami) /usr/share/geoserver
cd /usr/share/geoserver

wget https://build.geoserver.org/geoserver/main/geoserver-main-latest-bin.zip
unzip geoserver-main-latest-bin.zip
echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.profile
. ~/.profile

cd /usr/share/geoserver/webapps/geoserver/WEB-INF
sed -i "141d" web.xml && sed -i "161d" web.xml
sed -i "191d" web.xml && sed -i "195d" web.xml

cd /usr/share/geoserver/bin
sh startup.sh
