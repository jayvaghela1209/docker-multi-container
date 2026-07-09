#!/bin/bash

echo "stopping container.."

docker stop nginx-server redis-cache postgress-db

echo "removing container.."

docker rm nginx-server redis-cache postgress-db

echo "removing network.."

docker network rm app-network

echo "Done!!"
