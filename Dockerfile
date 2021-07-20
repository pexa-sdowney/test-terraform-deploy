FROM alpine

RUN apk update
RUN apk add youtube-dl aws-cli

COPY download.sh .
RUN chmod +x download.sh


ENTRYPOINT ["./download.sh"]