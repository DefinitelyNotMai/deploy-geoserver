#!bin/sh


#this command will install the update and upgrade of the OS
sudo apt update && sudo apt upgrade

#this command will install the following JAVA-8 "java developlment kit" and "java runtime environment" needed to run the server
sudo apt install default-jre default-jdk

#installation of Postgres "database"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt install postgis postgresql-13-postgis-3

#creation of a new directory and put GEOSERVER in it and make the user the owner of the folder.
sudo mkdir /usr/share/geoserver
sudo chown -R $(whoami):$(whoami) /usr/share/geoserver
cd /usr/share/geoserver

#download the geoserver-main-lates-bin.zip and unzipping it.
wget https://build.geoserver.org/geoserver/main/geoserver-main-latest-bin.zip
unzip geoserver-main-latest-bin.zip

#setup a variable to make the GEOSERVER  workable
echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.profile
. ~/.profile

#make the GEOSERVER ready for usage
#by uncommenting the below line of codes
cd /usr/share/geoserver/webapps/geoserver/WEB-INF
sed -i "141d" web.xml && sed -i "161d" web.xml
sed -i "191d" web.xml && sed -i "195d" web.xml

#finally starting the GEOSERVER for the first time.
cd /usr/share/geoserver/bin
sh startup.sh
