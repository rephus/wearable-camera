# Wearable camera

This is a collection of scripts to run on a raspberry pi zero with a camera module
to make timelapse.

Default folders:

* /home/pi : Location of all these scripts (aka extract files there)
* /home/pi/photos: Location of photos

# Automatic backups (optional)

You can also enable a script (using cronjob) to automatically make backup of your
photos to your computer.

    #Run backup every hour (at 0 minute)
    0 * * * * /home/pi/backup.sh

# Compress pictures (optional)

Requires 7zip `sudo apt-get install p7zip` (http://askubuntu.com/questions/491223/7z-ultra-settings-for-zip-format)

p7zip offers better compression ration than normal `tar` files,
but you can use it if you prefer (you have to modify the compress.sh script)

You can also compress photos periodically to save some space( but not a lot),
specially if you are planning to make a lot of photos without running the backup script (eg: when travelling).

    #Run backup every hour (at 0 minute)
    0 * * * * /home/pi/compress.sh

```
Note:
On a 32Gb SDcard, on a 5MP resolution (aprox 2.5mb per picture) on a frequency of 30 seconds
it will take 73 hours (3 days) to fill the space on the SDcard.
```

# Run script on startup

Add these lines to /etc/rc.local

    mkdir -p /tmp/photos
    chmod 777 /tmp/photos
    python /home/pi/camera.py &

# WIFI setup

/etc/network/interfaces
```
allow-hotplug wlan0
iface wlan0 inet manual
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

 /etc/wpa_supplicant/wpa_supplicant.conf
```
network={
        ssid="<your wifi ssid>"
        psk="<your wifi password>"
        key_mgmt=WPA-PSK
}
```

# Power efficient tips

First and most important, disable the GUI on the pi preferences menu (raspi-config)

Add the following scripts to /etc/rc.local too
## Disable HDMI (save 25mA)
    /usr/bin/tvservice -o

## Disable leds (5mA)

    echo none | tee /sys/class/leds/led0/trigger
    echo 1 | tee /sys/class/leds/led0/brightness
