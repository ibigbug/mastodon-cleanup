FROM tootsuite/mastodon

MAINTAINER "Yuwei B <contact@yba.dev>"

USER root

RUN apt-get update && apt-get -y install cron

COPY cron /etc/cron.d/cron

COPY cleanup.sh /cleanup.sh

RUN chmod +x /etc/cron.d/cron

RUN crontab /etc/cron.d/cron

RUN printenv > /etc/environment # fixes issue where environment variables are not available in the crontab

CMD ["cron", "-f"]
