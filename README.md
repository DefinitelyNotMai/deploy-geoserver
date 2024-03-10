#	-- deploy-geoserver --


What is GEOSERVER?
	~ GeoServer is an open-source Java server that facilitates the processing, sharing, and editing of geospatial data. It provides data using open standards from any major spatial data source, with the goal of ensuring interoperability. With time, GeoServer has developed into a simple way to link existing data to web-based maps like OpenLayers, Leaflet, Google Maps, and Bing Maps, as well as to virtual globes like Google Earth and NASA World Wind.



#This repository has a shell script that anyone can run to easily install GEOSERVER.

#Note that this can be done only in Linux OS.


# Follow the following steps to install geoserver using the shell script found in this repository:
	~ open your browser.
	~ go to "https://github.com/DefinitelyNotMai/deploy-geoserver?fbclid=IwAR2js7CMd-GdwXWqhkqzwT1yj9qnSrlFdgBsdIIfuKLvW4Q5ZVzanlm0ORiM"
	~ click on the drop down "Code"
	~ copy the repository's url
	~ open your terminal.
	~ navigate to the directory you want to clone your repository.
	~ enter "git clone {paste your copied url here.}"
	~ enter "sh geo.sh" and enter your password to run the script to install the GEOSERVER.

#to run the geoserver;
	~ open your terminal,
	~ enter "cd ~/usr/share/geoserver/bin"
	~ enter sh startup.sh
