# Autonomous Frontier-Based Exploration and Mapping (ROS 2)

## Abstract
Autonomous exploration and mapping of unfamiliar environments represent a foundational challenge in mobile robotics, with critical applications in search and rescue operations, planetary exploration, and warehouse automation. This project demonstrates the implementation of a frontier-based exploration strategy that enables a mobile robot to navigate autonomously and construct a map of an unmapped environment. Developed within the Robot Operating System (ROS 2) framework and validated using the Gazebo physics simulator, the system provides a high-fidelity environment for testing autonomous behavior. By leveraging sensor streams from LiDAR and odometry, the robot executes Simultaneous Localization and Mapping (SLAM) to estimate its trajectory while incrementally generating an occupancy grid map. The frontier-based algorithm dynamically identifies boundaries between explored and unknown regions, optimizing the robot's trajectories toward these frontiers to maximize exploration efficiency. Concurrently, real-time collision avoidance and path planning are managed by integrated navigation stacks. The experimental results validate the efficacy of the proposed framework, demonstrating robust autonomous navigation and precise map generation without any prior environmental layout knowledge.

## System Requirements
* **OS:** Ubuntu 22.04 LTS (Native or via Windows Subsystem for Linux)
* **ROS Distribution:** ROS 2 Humble Hawksbill
* **Simulator:** Gazebo Classic (v11)
* **Robot Model:** TurtleBot3 (Waffle)

## Core Packages Used
* `nav2_bringup` (Navigation and Costmap generation)
* `slam_toolbox` (2D Grid Mapping)
* `turtlebot3_gazebo` (Simulation environments)
* `explore_lite` (Frontier-based autonomous routing)

## Installation
Ensure ROS 2 Humble is installed on your system. Then, clone this repository and run the setup script to install the required robotics packages, configure the TurtleBot3 models, and compile the workspace.

```bash
chmod +x setup_workspace.sh
./setup_workspace.sh

