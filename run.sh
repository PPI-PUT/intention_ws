rocker --network host --privileged --nvidia --x11 --user --name unitree \
    --env "USER" \
    --env "RMW_IMPLEMENTATION=rmw_fastrtps_cpp" \
    --env "ROS_DOMAIN_ID=0" \
    --volume "${PWD}:${HOME}/${PWD##*/}" \
    --volume "${PWD}/../intention_policy:${HOME}/${PWD##*/}/../intention_policy" \
    --volume /dev/:/dev/ \
    -- macnack/unitree_ros:humble 
