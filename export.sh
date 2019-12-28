## Log into another user to run gtk apps
echo "display value: "
echo $DISPLAY
xhost local:second
echo "DISPLAY=<value of display>"
su - second
