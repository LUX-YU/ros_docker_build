# Based on https://github.com/osrf/docker_images
# FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
# FROM nvidia/cudagl:10.0-runtime-ubuntu18.04
FROM ros:foxy_cudagl

RUN apt update && apt install -q -y --no-install-recommends \
    ros-foxy-navigation2 \
    ros-foxy-nav2-bringup \
    ros-foxy-turtlebot3 \
    ros-foxy-turtlebot3-gazebo \
    ros-foxy-turtlebot3-msgs \
    ros-foxy-dynamixel-sdk && \
    rm -rf /var/lib/apt/lists/*

ENV TURTLEBOT3_MODEL buger

RUN echo "export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/foxy/share/turtlebot3_gazebo/models" >> /root/.bashrc

CMD ["bash"]