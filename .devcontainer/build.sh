DOCKER_BUILDKIT=1 docker build --network=host \
    --build-arg WORKSPACE=inttention_ws \
    -t macnack/unitree_ros:humble .
