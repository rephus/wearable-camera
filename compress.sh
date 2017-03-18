#!/bin/bash

folder=$(date +%s)

cd '/home/pi/photos' # Place where photos are located

mkdir "$folder"
echo "Moving files into $folder"
mv *.jpg "$folder"
echo "Compressing $(ls -1 $folder | wc -l) files $(du -hs $folder | cut -d'1' -f1)"
7zr a t7z -mx=9  "$folder.7z" $folder
echo "Removing folder"
rm -r "$folder"
