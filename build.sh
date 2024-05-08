docker build -f ros2_foxy_cudagl/Dockerfile --rm --tag ros:foxy_cudagl .
docker build -f nav2/Dockerfile --rm --tag nav2:foxy_cudagl .
docker build -f orb_slam2_nav2/Dockerfile --rm --tag orb_slam2_nav2:noetic_foxy_cudagl .