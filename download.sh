#!/bin/sh

youtube-dl $1 -o "youtube-%(title)s-%(id)s.%(ext)s" --restrict-filenames

export NAME=$(ls youtube*)

aws s3 cp *.mp4 s3://upload.samdowney.com/uploads/${NAME}