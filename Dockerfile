FROM alpine

RUN apk update
RUN apk add youtube-dl aws-cli

COPY download.sh .
RUN chmod +x download.sh

ENV VIDEO_URL=

ENTRYPOINT ["./download.sh"]