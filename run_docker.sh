docker build -t scrumpoker .
docker run --name scrumpoker scrumpoker
CONTAINER_ID=$(docker ps -aqf "name=^scrumpoker$")
IMAGE_ID=$(docker images scrumpoker -q)
docker logs $CONTAINER_ID
docker container rm $CONTAINER_ID
docker image rm $IMAGE_ID