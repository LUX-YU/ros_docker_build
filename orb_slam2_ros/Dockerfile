# Based on https://github.com/osrf/docker_images
# FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
# FROM nvidia/cudagl:10.0-runtime-ubuntu18.04
FROM ros:melodic_cudagl

ENV DEBIAN_FRONTEND noninteractive 

WORKDIR /home/ws

COPY orb_slam_2_ros /home/ws/src/orb_slam_2_ros

RUN rosdep install --from-paths src --ignore-src -r -y
