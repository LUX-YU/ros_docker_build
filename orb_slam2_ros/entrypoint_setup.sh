#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash" --
source "/home/ws/devel/setup.bash" --
exec "$@"