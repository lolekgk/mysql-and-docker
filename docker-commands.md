# Commands

<br/>

### create docker network

```
docker network create mysql-network
```

<br/>

### start mysql server

```
docker run -dp 3306:3306 \
-e MYSQL_ROOT_PASSWORD=secret \
-e MYSQL_USER=test_user \
-e MYSQL_PASSWORD=secret \
-e MYSQL_DATABASE=test_db \
-v mysql-data:/var/lib/mysql \
--net mysql-network \
--name mysql_db \
--restart=always \
mysql:latest
```

<br/>

### start adminer

```
docker run -dp 8080:8080 \
--name adminer \
--net mysql-network \
--link mysql_db:db \
--restart=always \
adminer:latest
```
