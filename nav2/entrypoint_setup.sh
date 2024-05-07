#!/bin/bash
set -e

# setup ros environment
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/foxy/share/turtlebot3_gazebo/models
exec "$@"