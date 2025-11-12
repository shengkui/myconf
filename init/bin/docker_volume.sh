#!/bin/bash

printf "%-64s | %-10s | %s\n" "VOLUME_NAME" "SIZE" "CONTAINER"
echo "-----------------------------------------------------------------|------------|------------"
docker volume ls -q | while read vol; do
    size=$(docker volume inspect $vol --format '{{.Mountpoint}}' | xargs du -sh 2>/dev/null | cut -f1)
    containers=$(docker ps -a --filter volume=$vol --format '{{.Names}}' | tr '\n' ',' | sed 's/,$//')
    [ -z "$containers" ] && containers="<unused>"
    printf "%-64s | %-10s | %s\n" "$vol" "$size" "$containers"
done

