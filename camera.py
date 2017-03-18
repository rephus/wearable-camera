# https://www.raspberrypi.org/learning/getting-started-with-picamera/worksheet/

from picamera import PiCamera
from time import sleep, time
import datetime

FREQUENCY = 30 # timelapse frequency, in seconds
FOLDER = "/home/pi/photos" # Folder to store photos

camera = PiCamera()
# Suggested settings
camera.resolution = (3032, 2008) # 6mpx
camera.resolution = (2560, 1920) #5mpx
camera.framerate = 15

camera.start_preview()
sleep(2)  # Sleep 2 additional seconds to give time to start

while True:
    # Sample: A picture will be saved in $FOLDER/picture17-03-18_17:34.jpg
    timestamp = datetime.datetime.now().strftime('%y-%m-%d_%H:%M:%S')
    picture = '{}/picture{}.jpg'.format(FOLDER,timestamp)
    print("Take picture {}".format(picture))
    camera.capture(picture)
    sleep(FREQUENCY)

camera.stop_preview()
