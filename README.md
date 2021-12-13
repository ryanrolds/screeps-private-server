# Screeps Private Server

## Setup

1. Fill out the the Steam API key in `.screepsrc`
2. `docker-compose up`
3. Wait a while for the server to start
4. Import the map into MongoDB
  * `docker-compose exec pserver npx screeps cli`
  * `system.resetAllData()`
  * `setPassword('Username', 'YourDesiredPassword')`
  * `system.setTickDuration(500)`
5. Access server from Screeps client

## Adding bots via CLI

```
docker-compose exec pserver npx screeps cli
bots.spawn("overmind", "W1N8", {x: 21, y: 16})
```

## Docker & K8s

This repo builds a Docker image for use on a K8s server. 

## Notes

`/usr/bin/env: ‘node\r’: Permission denied` is an LF vs CRLF issue.