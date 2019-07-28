#!/bin/sh

# Kill any other gstreamer proccesses
pkill -f gst

# Make sure module is no loaded already
sudo modprobe -r v4l2loopback

sleep 1

# Load module with 2 camera sources
sudo modprobe v4l2loopback devices=2

# Launch our fake video feeds
gst-launch-1.0 videotestsrc pattern=ball ! v4l2sink device=/dev/video0 &
gst-launch-1.0 videotestsrc ! v4l2sink device=/dev/video1 &
