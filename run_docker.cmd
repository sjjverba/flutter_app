docker build -t scrumpoker .
docker run --name scrumpoker scrumpoker > result.txt
docker ps -aqf "name=^scrumpoker$" > container_id
docker images scrumpoker -q > image_id
set /p container_id=<container_id
set /p image_id=<image_id
del container_id
del image_id
docker container rm %container_id%
docker image rm %image_id%