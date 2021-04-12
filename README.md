# playfun-docker
Run Playfun nodes in Docker

## docker-compose

Because Playfun runs best in so-called "MARIONET" mode, multiple playfun instances should be managed in some kind of container orchestration tool. I use docker-compose. I have provided an [example docker-compose config](docker-compose.yml).

dockerhost is necessary because otherwise Playfun would need to be provided a list of hostnames along with ports, which is not currently supported.

## config

The simplest way to configure Playfun is to include all files in a folder that is mounted to `/playfun/config`. Inside `config.txt`, both the game and movie values should be prefixed with `config/`. Here's an example:

```
game config/game
movie config/game.fm2
```

This will ensure Playfun uses your mounted config directory for all the files it reads and writes.