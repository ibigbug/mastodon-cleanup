# mastodon-cleanup
A Docker image that cleans up Mastodon storage as a cron.

Source: https://ricard.dev/improving-mastodons-disk-usage/

## Usage

Part of docker-compose.yaml

```
  cron:
    image: ghcr.io/ibigbug/mastodon-cleanup@sha256:c0e22d0247ae66ae777d93918ea98a3a31ad27fc7b38dd7f1609625157fcd5fb
    env_file: .env.production
    command: cron -f
    depends_on:
      - db
      - redis
    networks:
      - YOUR_NETWORK
```
