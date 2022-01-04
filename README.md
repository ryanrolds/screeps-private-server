# Screeps Private Server

## Setup

1. Fill out the the Steam API key in `.screepsrc`
2. `docker-compose build pserver`
3. `docker-compose up -d`
4. Wait a while for the server to start
5. Import the map into MongoDB
  * `docker-compose exec pserver npx screeps cli`
  * `system.resetAllData()`
6. Restart the server with `docker-compose restart pserver`
7. Access server from Screeps client and create an account
8. Using the CLI tool, setup API authentication if you want to use Grunt
  * `docker-compose exec pserver npx screeps cli`
  * `setPassword('Username', 'YourDesiredPassword')`
9. Set tickrate to `500ms`
  * `docker-compose exec pserver npx screeps cli`
  * `system.setTickDuration(500)`

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