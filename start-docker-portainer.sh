#!/bin/bash
docker stop portainer
docker rm portainer
docker volume create portainer_data
docker run -d \
-p 8000:8000 \
-p 9000:9000 \
--name=portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
--label "traefik.frontend.rule=Host('portainer.raspbuntu.me')" \
--label "traefik.port=9000" \
--label "traefik.backend=portainer" \
--label "traefik.frontend.entryPoints=http,https" \
portainer/portainer-ce
