#!/bin/sh

# if [ -z  ${1} ]; then export URL=$1
# else
# export URL=$VIDEO_URL
# fi

youtube-dl -f best "${VIDEO_URL}" -o "youtube-%(title)s-%(id)s.%(ext)s" --restrict-filenames

export NAME=$(ls youtube*)

aws s3 cp *.mp4 s3://upload.samdowney.com/uploads/${NAME} ${STORAGE_CLASS}