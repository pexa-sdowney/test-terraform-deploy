FROM ubuntu

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install youtube-dl awscli ffmpeg nfs-common -y

COPY download.sh .
RUN chmod +x download.sh

ENV VIDEO_URL=
ENV STORAGE_CLASS=
#Storage class needs to be passed in fully (--storage class GLACIER)

ENTRYPOINT ["./download.sh"]