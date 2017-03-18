#!/bin/bash

local_folder='/home/pi/photos'
server='rephus@192.168.2.100'
server_folder='/tmp'

# This file will automatically backup photos when a wifi connection is available,
# Then it removes the phtoso to free space
rsync --ignore-existing "$local_folder/*" "$server":"$server_folder"
rm "$local_folder/*"
