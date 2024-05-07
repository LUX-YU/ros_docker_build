# Based on https://github.com/osrf/docker_images
# FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
# FROM nvidia/cudagl:10.0-runtime-ubuntu18.04
FROM nav2:foxy_cudagl

# Install ros noetic
ARG ROS_PYTHON_VERSION 3
ARG ROS_DISTRO         noetic

# setup keys
RUN set -eux; \
    key='C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654'; \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
    mkdir -p /usr/share/keyrings; \
    gpg --batch --export "$key" > /usr/share/keyrings/ros1-latest-archive-keyring.gpg; \
    gpgconf --kill all; \
    rm -rf "$GNUPGHOME"

# setup sources.list
RUN echo "deb [ signed-by=/usr/share/keyrings/ros1-latest-archive-keyring.gpg ] http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-robot \
    ros-noetic-cv-bridge \
    ros-noetic-image-transport \
    ros-noetic-tf2-geometry-msgs \
    ros-foxy-ros1-bridge \
    python3-catkin-tools \
    python3-rosinstall && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/ws

COPY thirdparty/orb_slam_2_ros /home/ws/src/orb_slam_2_ros
RUN rosdep update && rosdep install --from-paths src --ignore-src -r -y && \
    catkin config --extend /opt/ros/noetic && \
    catkin build && \
    rm -f /entrypoint_setup.sh

ENTRYPOINT [] 

CMD ["bash"]