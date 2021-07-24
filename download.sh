#!/bin/sh

# if [ -z  ${1} ]; then export URL=$1
# else
# export URL=$VIDEO_URL
# fi

youtube-dl -f ${QUALITY} "${VIDEO_URL}" -o "youtube-%(title)s-%(id)s.%(ext)s" --restrict-filenames

export NAME=$(ls youtube*)
# -e FOLDER eg: testfolder/ note trailing slash required
aws s3 cp *.mp4 s3://upload.samdowney.com/uploads/${FOLDER}/${NAME} ${STORAGE_CLASS}