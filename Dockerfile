FROM ubuntu

RUN apt update
RUN apt install youtube-dl aws-cli ffmpeg nfs-common -y

COPY download.sh .
RUN chmod +x download.sh

ENV VIDEO_URL=
ENV STORAGE_CLASS=
#Storage class needs to be passed in fully (--storage class GLACIER)

ENTRYPOINT ["./download.sh"]