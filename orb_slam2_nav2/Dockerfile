# Based on https://github.com/osrf/docker_images
# FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
# FROM nvidia/cudagl:10.0-runtime-ubuntu18.04
FROM nav2:foxy_cudagl

# Install ros noetic
ARG ROS_PYTHON_VERSION 3
ARG ROS_DISTRO         noetic

# setup noetic keys
RUN set -eux; \
    key='C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654'; \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
    mkdir -p /usr/share/keyrings; \
    gpg --batch --export "$key" > /usr/share/keyrings/ros1-latest-archive-keyring.gpg; \
    gpgconf --kill all; \
    rm -rf "$GNUPGHOME"

# setup realsense keys
RUN mkdir -p /etc/apt/keyrings && curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | sudo tee /etc/apt/keyrings/librealsense.pgp > /dev/null

# setup sources.list
RUN echo "deb [signed-by=/usr/share/keyrings/ros1-latest-archive-keyring.gpg ] http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list
RUN echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo focal main" > /etc/apt/sources.list.d/librealsense.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-robot \
    ros-noetic-cv-bridge \
    ros-noetic-image-transport \
    ros-noetic-tf2-geometry-msgs \
    ros-foxy-ros1-bridge \
    python3-catkin-tools \
    librealsense2-dkms librealsense2-utils \
    ros-foxy-realsense2-* \
    python3-rosinstall && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/ws

COPY thirdparty/orb_slam_2_ros /home/ws/src/orb_slam_2_ros
RUN rosdep update && rosdep install --from-paths src --ignore-src -r -y && \
    catkin config --extend /opt/ros/noetic && \
    catkin build && \
    rm -f /entrypoint_setup.sh

COPY thirdparty/realsense_gazebo_plugin /home/ws/src/realsense_gazebo_plugin
RUN /bin/bash -c "mkdir /home/ws/src/realsense_gazebo_plugin/build" && \
    /bin/bash -c "cd /home/ws/src/realsense_gazebo_plugin/build && source /opt/ros/foxy/setup.bash && cmake .. && make install" && \
    rm -rf /home/ws/src/realsense_gazebo_plugin/build

COPY orb_slam2_nav2/turtlebot3_waffle_rgbd /opt/ros/foxy/share/turtlebot3_gazebo/models/turtlebot3_waffle_rgbd
COPY orb_slam2_nav2/turtlebot3_waffle_rgbd.urdf /opt/ros/foxy/share/turtlebot3_description/urdf/turtlebot3_waffle_rgbd.urdf
COPY orb_slam2_nav2/waffle_rgbd.model /opt/ros/foxy/share/turtlebot3_gazebo/worlds/turtlebot3_worlds/waffle_rgbd.model
ENV TURTLEBOT3_MODEL waffle_rgbd

ENTRYPOINT [] 

CMD ["bash"]