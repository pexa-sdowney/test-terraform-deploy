FROM alpine

RUN apk update
RUN apk add youtube-dl aws-cli ffmpeg

COPY download.sh .
RUN chmod +x download.sh

ENV VIDEO_URL=
ENV STORAGE_CLASS=

ENTRYPOINT ["./download.sh"]