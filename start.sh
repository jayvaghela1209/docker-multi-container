#!/bin/sh

echo "Creating Docker Newtowrk.."

docker newtwork inspect app-network > /dev/null 2>&1

if [ $? -ne 0 ]; then
	docker network create app-network 
fi

echo "Starting PostgresSQL.."

docker run -d \
  --name postgres-db \
  --network app-network \
  -e POSTGRES_USER=admin \
  -e POSTGRES_PASSWORD=admin123 \
  -e POSTGRES_DB=mydatabase \
  -p 5432:5432 \
  postgres:16

echo "Starting Redis.."

docker run -d \
  --name redis-cache \
  --network app-network \
  -p 6379:6379 \
  redis:7 

echo "Starting Nginx.."

docker run -d --name nginx-server --network app-network \
-p 8081:80  -v $(pwd)/website:/usr/share/nginx/html:ro \
nginx:latest

echo ""
echo "Stack Started Successfully!"
echo ""
echo "Nginx    : http://localhost:8081"
echo "Redis    : localhost:6379"
echo "Postgres : localhost:5432"
