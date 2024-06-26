#!/bin/sh

# add postgresql apt repository.
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# @ this command will update the package index files and upgrade the OS.
# @ this command will install the packages needed to install and run geoserver
#   + PACKAGES:
#     * default-jdk default-jre => Java Development Kit and Java Runtime Environment needed to run the server.
#     * postgresql postgis => PostgreSQL for the database and PostGIS allows PostgreSQL to store, index, and query geospatial data.
#     * unzip => Used for extracting the downloaded binary which is initially zipped.
sudo apt update && sudo apt upgrade
sudo apt install default-jdk default-jre postgresql postgis unzip

# creation of a new directory and put GEOSERVER in it and make the user the owner of the folder.
sudo mkdir /usr/share/geoserver
sudo chown -R "$(whoami)":"$(whoami)" /usr/share/geoserver

# download the geoserver-main-latest-bin.zip and unzip it.
wget https://build.geoserver.org/geoserver/main/geoserver-main-latest-bin.zip -P /usr/share/geoserver
unzip /usr/share/geoserver/geoserver-main-latest-bin.zip -d /usr/share/geoserver

# setup a variable to make the GEOSERVER  workable
echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.profile
. ~/.profile

# make the GEOSERVER ready for usage by uncommenting specific lines of code.
sed -i "141d" /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml
sed -i "161d" /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml
sed -i "191d" /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml
sed -i "195d" /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml

# finally starting the GEOSERVER for the first time.
sh /usr/share/geoserver/bin/startup.sh
