#!/bin/bash
echo "Initializing 2D Autonomous Exploration Stack (WSL Optimized)..."

# This line ensures that when you press Ctrl+C, it shuts down ALL the background processes cleanly
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

echo "1. Launching Gazebo..."
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py &
sleep 7

echo "2. Launching Nav2 & SLAM..."
ros2 launch nav2_bringup bringup_launch.py slam:=True use_sim_time:=True map:=dummy.yaml &
sleep 5

echo "3. Launching RViz..."
rviz2 -d /opt/ros/humble/share/nav2_bringup/rviz/nav2_default_view.rviz &
sleep 5

echo "4. Launching Exploration..."
source ~/ros2_ws/install/setup.bash && ros2 launch explore_lite explore.launch.py &

echo "======================================================="
echo "All systems running! Watch RViz for mapping progress."
echo "Press [CTRL + C] in this terminal to safely shut everything down."
echo "======================================================="
wait
