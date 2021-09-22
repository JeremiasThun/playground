FROM ubuntu:bionic
SHELL ["/bin/bash", "-c"]

### Installing ROS

RUN apt-get update && apt-get install -y tzdata

RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list && \
    apt-get install curl -y && \
    apt-get install gnupg -y && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    apt-get update

RUN apt-get install ros-melodic-ros-base -y
# reminder: because of Docker, /opt/ros/melodic/setup.bash needs to be sourced again every time it is needed.

