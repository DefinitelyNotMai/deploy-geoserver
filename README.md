# -- deploy-geoserver --
This is a shell script to easily install and run [GeoServer](https://geoserver.org) on Ubuntu-based Linux distributions.

#### What is GeoServer?
> GeoServer is an open-source Java server that facilitates the processing, sharing, and editing of geospatial data. It provides data using open standards from any major spatial data source, with the goal of ensuring interoperability. With time, GeoServer has developed into a simple way to link existing data to web-based maps like OpenLayers, Leaflet, Google Maps, and Bing Maps, as well as to virtual globes like Google Earth and NASA World Wind.

## Installation
```shell
git clone https://github.com/DefinitelyNotMai/deploy-geoserver.git
cd deploy-geoserver
chmod +x geo.sh
sh geo.sh
```
##### NOTE: you may be prompted to enter your password, this is because the script will make use of sudo to create the directory "/usr/share/geoserver" and set its owner to current user.

## Usage
1. In the terminal, run:
    * `sh /usr/share/geoserver/bin/startup.sh`
2. In your web browser, go to `http://localhost:8080`

## Tips
- You can create an alias to quickly and easily start running the server by adding the following to `~/.bashrc`:
```shell
alias geo="sh /usr/share/geoserver/bin/startup.sh"
```
