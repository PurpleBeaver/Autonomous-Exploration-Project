#!/bin/bash

echo "==========================================================="
echo " WSL-Optimized Multi-Terminal Launch Sequence"
echo "==========================================================="
echo "Due to WSL resource constraints, please open 4 separate"
echo "Ubuntu terminal windows and run these commands one by one."
echo "==========================================================="
echo ""

echo "TERMINAL 1 (Headless Physics Simulator):"
echo "ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py x_pose:=-2.0 y_pose:=1.0 gui:=false"
echo ""

echo "TERMINAL 2 (Navigation & SLAM Brain):"
echo "ros2 launch nav2_bringup bringup_launch.py slam:=True use_sim_time:=True map:=dummy.yaml"
echo ""

echo "TERMINAL 3 (Visual Interface - RViz):"
echo "rviz2 -d /opt/ros/humble/share/nav2_bringup/rviz/nav2_default_view.rviz"
echo ""

echo "TERMINAL 4 (Autonomous Exploration Node):"
echo "source ~/ros2_ws/install/setup.bash"
echo "ros2 launch explore_lite explore.launch.py"
echo ""
echo "==========================================================="
