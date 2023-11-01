echo -----------------------------------
echo "Creating docker network..."
echo -----------------------------------
docker network create testnet

echo -----------------------------------
echo "Creating target servers..."
echo -----------------------------------
docker run -dit --rm --name ser1 --network testnet --user root target
docker run -dit --rm --name ser2 --network testnet --user root target
docker run -dit --rm --name ser3 --network testnet --user root target

echo ----------------------------------------------------------
echo "Starting ssh and ftp services on target servers..."
echo ----------------------------------------------------------
temp=$(docker exec -it ser1 rc-service sshd start)
temp=$(docker exec -it ser1 rc-service vsftpd start)
temp=$(docker exec -it ser2 rc-service sshd start)
temp=$(docker exec -it ser3 rc-service vsftpd start)
temp=$(docker exec -it ser1 rc-service crond start)
temp=$(docker exec -it ser2 rc-service crond start)
temp=$(docker exec -it ser3 rc-service crond start)

echo ----------------------------------
echo "Creating web server..."
echo ----------------------------------
docker run -dit --rm --name web --network testnet --user root -p 8000:8000 web

echo ----------------------------------
echo "Creating attack machine..."
echo ----------------------------------
docker run -it --rm --name attacker --network testnet --user root attacker
