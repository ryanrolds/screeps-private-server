# Screeps Private Server

## Setup

1. Fill out the the Steam API key in `.screepsrc`
2. `docker-compose up -d`
3. Wait a while for the server to start
4. Import the map into MongoDB
  * `docker-compose exec pserver npx screeps cli`
  * `system.resetAllData()`
  * `system.setTickDuration(500)`
5. Access server from Screeps client and create account
6. Setup API authentication if you want to use Grunt
  * `setPassword('Username', 'YourDesiredPassword')`

## Adding bots via CLI

> Make sure to update the room and coordinates

```
docker-compose exec pserver npx screeps cli
bots.spawn("overmind", "W1N8", {x: 21, y: 16})
```

## Docker & K8s

This repo builds a Docker image for use on a K8s server. 

## Notes

`/usr/bin/env: ‘node\r’: Permission denied` is an LF vs CRLF issue. Edit the file and fix the line endings.