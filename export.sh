echo "display value: "
echo $DISPLAY
xhost local:second
echo "DISPLAY=<value of display>"
su - second
