#!/bin/bash

printenv > /etc/environment # fixes issue where environment variables are not available in the crontab

exec "$@"
