docker run --rm -it --privileged --net=host --ipc=host --gpus=all \                                                                                         ✔ 
-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
-v $HOME/.Xauthority:/home/$(id -un)/.Xauthority -e XAUTHORITY=/home/$(id -un)/.Xauthority \
-e ROS_IP=127.0.0.1 \
ros:melodic_cudagl 