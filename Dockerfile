FROM tootsuite/mastodon

MAINTAINER "Yuwei B <contact@yba.dev>"

RUN sudo apt-get update && apt-get -y install cron

COPY cron /etc/cron.d/cron

COPY cleanup.sh /cleanup.sh

RUN chmod +x /etc/cron.d/cron

RUN crontab /etc/cron.d/cron

CMD ["cron", "-f"]
