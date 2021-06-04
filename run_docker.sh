docker build -t scrumpoker .
docker run --name scrumpoker scrumpoker  > result.txt
CONTAINER_ID=$(docker ps -aqf "name=^scrumpoker$")
IMAGE_ID=$(docker images scrumpoker -q)
docker container rm $CONTAINER_ID
docker image rm $IMAGE_ID