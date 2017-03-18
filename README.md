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

You can also compress photos periodically to save some space,
specially if you are planning to make a lot of photos without running the backup script (eg: when travelling).

    #Run backup every hour (at 0 minute)
    0 * * * * /home/pi/compress.sh

# Run script on startup

Add these lines to /etc/rc.local

    mkdir -p /tmp/photos
    chmod 777 /tmp/photos
    python /home/pi/camera.py &

# Power efficient tips

## Disable HDMI (save 25mA)
    /usr/bin/tvservice -o

## Disable leds (5mA)

    echo none | tee /sys/class/leds/led0/trigger
    echo 1 | tee /sys/class/leds/led0/brightness
