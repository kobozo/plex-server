#!/bin/bash

DOCKER_PLEX_HOME=/home/yannick/kobozo/plex-server

cd $DOCKER_PLEX_HOME

echo "Restarting rclone-mount-shows"
systemctl restart rclone-mount-shows
echo "Restarting rclone-mount-movies"
systemctl restart rclone-mount-movies

sleep 5

docker compose pull
docker compose up -d --force-recreate

sleep 60

docker compose restart plex_debrid
