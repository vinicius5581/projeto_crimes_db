docker pull mysql

docker run --name mysql-fun -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -d mysql:latest

docker ps

docker exec -it mysql-fun bash

mysql -h 127.0.0.1 -P 3306 -u root -p
