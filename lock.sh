#!/bin/bash

IMAGE=~/.config/i3/i3lock_temp/linux.png
IMAGE1=~/.config/i3/i3lock_temp/i3lock1.png
IMAGE2=~/.config/i3/i3lock_temp/i3lock2.png
IMAGE3=~/.config/i3/i3lock_temp/i3lock3.png

# Get the screenshot and add blur and lock screen with it
scrot $IMAGE1

# Set brightness and Contrast 
convert -brightness-contrast -40x-50 $IMAGE1 $IMAGE1

# Add Gaussian Blur and resize image
convert -filter Gaussian -resize 25% -resize 400% $IMAGE1 $IMAGE1

# Crop image to 2 parts. Monitor one and two
convert $IMAGE1 -crop 1920x1080+0+0 $IMAGE2
composite -gravity center $IMAGE $IMAGE2 $IMAGE2

convert $IMAGE1 -crop 1920x1080+1920+0 $IMAGE3
composite -gravity center $IMAGE $IMAGE3 $IMAGE3

convert $IMAGE2 $IMAGE3 +append $IMAGE1

i3lock -u -i $IMAGE1

rm $IMAGE1 $IMAGE2 $IMAGE3