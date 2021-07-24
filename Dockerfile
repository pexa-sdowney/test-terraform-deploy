FROM alpine

RUN apk update
RUN apk add youtube-dl aws-cli ffmpeg

COPY download.sh .
RUN chmod +x download.sh

ENV VIDEO_URL=
ENV FOLDER=
ENV STORAGE_CLASS=
#Storage class needs to be passed in fully (--storage class GLACIER)
ENV QUALITY=
#Default to "best" or 137+140

ENTRYPOINT ["./download.sh"]