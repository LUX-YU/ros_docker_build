# start ros1 core / ros1 launch
docker run --rm -it --privileged --net=host --ipc=host --gpus=all \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    -e ROS_IP=127.0.0.1 \
    --name orb_slam2 \
    orb_slam2_ros:melodic_cudagl \
    roslaunch orb_slam2_ros orb_slam2_r200_mono.launch

# start ros2 application
# ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py model:=burger_for_autorace
docker run --rm -it --privileged --net=host --ipc=host --gpus=all \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e ROS_IP=127.0.0.1 \
    --name turtkebot3 \
    nav2:foxy_cudagl \
    ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py

# start ros bridge
docker run --rm -it \
    --privileged \
    --net=host \
    --ipc=host \
    -e ROS_IP=127.0.0.1 \
    -e ROS_MASTER_URI=http://127.0.0.1:11311 \
    --name bridge \
    ros:foxy-ros1-bridge \
    ros2 run ros1_bridge dynamic_bridge

# In on container
# start ros1 core / ros1 launch
docker run --rm -it --privileged --net=host --ipc=host --gpus=all \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    -e ROS_IP=127.0.0.1 \
    --name orb_slam2 \
    orb_slam2_nav2:noetic_foxy_cudagl
