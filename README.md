# docker-deep-cuda-py3
docker container prefab which consists of Ubuntu 22.04 + cuda12.2

## build docker image

```
$ export DEEP_PROJECT_NAME=hoge
$ ./BUILD-DOCKER-IMAGE.sh
```
your docker image name will be `hoge_deep`


## run docker container

```
$ export ROS_PROJECT_NAME=hoge
$ ./RUN-DOCKER-CONTAINER.sh
```
your docker container name will be `hoge_deep_1`
