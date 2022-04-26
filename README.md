# Screeps Private Server

## Setup

1. Fill out the the Steam API key in `.screepsrc`
2. `docker-compose build pserver`
3. `docker-compose up -d`
4. Wait a while for the server to start
5. Import the map into MongoDB and pause
  * `docker-compose exec pserver npx screeps cli`
  * `system.resetAllData()`
6. Restart the server with `docker-compose restart pserver`
7. Connect and pause simulation
  * `docker-compose exec pserver npx screeps cli`
  * `system.pauseSimulation()`
8. Access server from Screeps client and create an account
9. Using the CLI tool, setup API authentication if you want to use Grunt
  * `setPassword('Username', 'YourDesiredPassword')`
10. Set tickrate to `500ms`
  * `system.setTickDuration(500)`
11. Add terminals
  * `storage.db['rooms.objects'].insert({ type: 'terminal', room: 'W0N0', x: 0, y:0 })`
  * `storage.db['rooms.objects'].insert({ type: 'terminal', room: 'W10N0', x: 0, y:0 })`
  * `storage.db['rooms.objects'].insert({ type: 'terminal', room: 'W10N10', x: 0, y:0 })`
  * `storage.db['rooms.objects'].insert({ type: 'terminal', room: 'W0N10', x: 0, y:0 })`
  * `storage.db['market.orders'].clear()`
12. Add bots
  * `bots.spawn("overmind", "W1N4", {x: 11, y: 17})`
  * `bots.spawn("tooangel", "W6N9", {x: 35, y: 22})`
  * `bots.spawn("tooangel", "W4N1", {x: 41, y: 11})`
13. Increase allow CPU (must be done after adding bots/self)
  * `storage.db['users'].update({}, {$set: {cpu: 500}})`
14. Resume simulation
  * `system.resumeSimulation()`

## Adding bots via CLI

> Make sure to update the room and coordinates

```
docker-compose exec pserver npx screeps cli

```

## Docker & K8s

This repo builds a Docker image for use on a K8s server. 

## Notes

`/usr/bin/env: ‘node\r’: Permission denied` is an LF vs CRLF issue. Edit the file and fix the line endings.