# Docker Multi-Container Stack

This project runs three Docker containers connected through a custom Docker network.

## Containers

| Container | Image | Port |
|------------|--------|------|
| Nginx | nginx:latest | 8081 |
| Redis | redis:7 | 6379 |
| PostgreSQL | postgres:16 | 5432 |

---

## Network

All containers are connected to the custom bridge network:

app-network

Containers can communicate using container names:

- nginx-web
- redis-cache
- postgres-db

Example:

ping postgres-db

or

redis-cli -h redis-cache

---

## PostgreSQL Credentials

Username:

admin

Password:

admin123

Database:

mydatabase

---

## Folder Structure

```
docker-multi-container/
│
├── website/
│   └── index.html
├── start.sh
├── stop.sh
└── README.md
```

---

## Start Stack

```bash
./start.sh
```

---

## Stop Stack

```bash
./stop.sh
```

---

## Access

Nginx

```
http://localhost:8081
```

Redis

```
localhost:6379
```

PostgreSQL

```
localhost:5432
```

---

## Verify Containers

```bash
docker ps
```

---

## Verify Network

```bash
docker network inspect app-network
```

---

## Test PostgreSQL

```bash
docker exec -it postgres-db psql -U admin -d mydatabase
```

---

## Test Redis

```bash
docker exec -it redis-cache redis-cli
```

Then run:

```bash
PING
```

Output:

```
PONG
```
