FROM amazonlinux

RUN yum update -y
RUN yum install amazon-efs-utils -y

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && chmod +x /usr/local/bin/youtube-dl

COPY download.sh .
RUN chmod +x download.sh

ENV VIDEO_URL=
ENV STORAGE_CLASS=
#Storage class needs to be passed in fully (--storage class GLACIER)

ENTRYPOINT ["./download.sh"]