#!/bin/bash

set -xe 

# https://ricard.dev/improving-mastodons-disk-usage/

PATH=/opt/mastodon/bin/:$PATH

date

echo "instance version"
tootctl --version

echo "Prune remote accounts that never interacted with a local user"
RAILS_ENV=production tootctl accounts prune;

echo "Remove remote statuses that local users never interacted with older than 4 days"
RAILS_ENV=production tootctl statuses remove --days 4;

echo "Remove media attachments older than 4 days"
RAILS_ENV=production tootctl media remove --days 4;

# echo "Remove all headers (including people I follow)"
# RAILS_ENV=production tootctl media remove --remove-headers --include-follows --days 0;

echo "Remove link previews older than 4 days"
RAILS_ENV=production tootctl preview_cards remove --days 4;

echo "Remove files not linked to any post"
RAILS_ENV=production tootctl media remove-orphans;

echo "Clean up done"
date
