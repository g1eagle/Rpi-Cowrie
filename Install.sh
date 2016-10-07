#Build Cowrie
docker build -t g1eagle/rpi-cowrie https://raw.githubusercontent.com/g1eagle/Rpi-Cowrie/master/Dockerfile

docker run --restart=always --name cowrie -d g1eagle/rpi-cowrie:latest

docker stop cowrie
wget https://raw.githubusercontent.com/g1eagle/Rpi-Cowrie/master/RPIStart.sh
chmod 777 RPIStart.sh
docker cp RPIStart.sh cowrie:/cowrie/RPIStart.sh
docker start cowrie