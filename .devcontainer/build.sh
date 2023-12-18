DOCKER_BUILDKIT=1 docker build --network=host \
    --build-arg WORKSPACE=intention_ws \
    -t macnack/unitree_ros:humble .
