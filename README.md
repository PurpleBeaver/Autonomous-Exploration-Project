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
```

## Team Contributions

This Master's project was developed collaboratively by a team of four, with each member leading distinct architectural and engineering domains within the ROS 2 ecosystem:

* **[Your Name] – Systems Architecture & Environment Engineering** 
  Led the overarching systems integration and GitHub repository management. Developed the automated bash launch architectures (`run_2d_exploration.sh`, `setup_workspace.sh`) to handle asynchronous node lifecycles and TF tree initialization. Also engineered the custom Python procedural terrain generation (`generate_terrain.py`) and `.world` files for unstructured environment testing.

* **[Teammate 2 Name] – Navigation & Path Planning (Nav2)** 
  Spearheaded the configuration of the ROS 2 Navigation Stack. Tuned the global and local costmap parameters, including the inflation layers and robot footprint radii, to ensure safe obstacle avoidance. Managed the integration of the A*/Dijkstra global planners to allow the robot to efficiently backtrack through known space to reach new frontiers.

* **[Teammate 3 Name] – SLAM & Spatial Perception** 
  Managed the mapping pipeline using `slam_toolbox`. Tuned the Bayesian probability logic (log-odds updating) and occupancy grid resolution to ensure real-time map generation without CPU bottlenecking. Handled the 2D LiDAR (`LDS-01`) sensor pipeline and ensured accurate Odometry and Pose Graph optimization to prevent map drift.

* **[Teammate 4 Name] – Autonomous Exploration & Evaluation** 
  Led the implementation of the `explore_lite` frontier-based exploration algorithm. Calibrated the mathematical boundary detection between known and unknown spaces to prevent the algorithm from stalling or infinitely looping. Directed the experimental evaluation, managed the termination conditions (frontier blacklisting), and synthesized the simulation data for the final academic presentation.
