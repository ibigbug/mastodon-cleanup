FROM tootsuite/mastodon

MAINTAINER "Yuwei B <contact@yba.dev>"

USER root

RUN apt-get update && apt-get -y install cron

COPY cron /etc/cron.d/cron

COPY cleanup.sh /cleanup.sh

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /etc/cron.d/cron

RUN chmod +x /entrypoint.sh

RUN crontab /etc/cron.d/cron

ENTRYPOINT ["/entrypoint.sh"]

CMD ["cron", "-f"]
