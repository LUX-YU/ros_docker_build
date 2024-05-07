# Based on https://github.com/osrf/docker_images
# FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
# FROM nvidia/cudagl:10.0-runtime-ubuntu18.04
FROM ros:melodic_cudagl

ENV DEBIAN_FRONTEND noninteractive 
ENV ROS_PYTHON_VERSION 2
ENV ROS_DISTRO      melodic

WORKDIR /home/ws

RUN apt-get update && \
    apt-get install -y python-catkin-tools && \
    rm -rf /var/lib/apt/lists/*

# build
COPY thirdparty/orb_slam_2_ros /home/ws/src/orb_slam_2_ros
RUN rosdep install --from-paths src --ignore-src -r -y && \
    catkin config --extend /opt/ros/$ROS_DISTRO && \
    catkin build

COPY ./entrypoint_setup.sh /
ENTRYPOINT ["/entrypoint_setup.sh"] 