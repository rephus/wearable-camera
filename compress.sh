#!/bin/bash

folder=$(date +%s)

cd '/home/pi/photos' # Place where photos are located

mv *.jpg "$folder"
tar czf "$folder.tar.gz" "$folder"
rm -r "$folder"
