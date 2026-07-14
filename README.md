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

* **Bhavana Kakarla – Systems Integration, Environments & Project Coordination** 
  Managed the overall system architecture, GitHub repository, and version control standards. I developed the automated bash scripts (e.g., `run_2d_exploration.sh`) to streamline the launch process and engineered the custom Python scripts for procedural 3D terrain generation. On the management side, I coordinated our development milestones and ensured all code integrations remained stable across the team's different hardware setups.

* **Rudraksh Jayeshkumar Makwana – Navigation, Path Planning & Visual Media** 
  Focused on implementing and tuning the Nav2 stack, calibrating global and local costmap parameters to ensure safe obstacle avoidance. Beyond the navigation code, they led the creation of visual assets for the project. This included recording and editing the simulation demonstrations, as well as designing the system architecture diagrams used to explain our navigation stack.

* **Srikar Maddala – SLAM, Spatial Perception & Data Analysis** 
  Took ownership of the mapping pipeline using `slam_toolbox`, integrating the 2D LiDAR sensor data and optimizing the occupancy grid to prevent map drift. Additionally, they managed the experimental data analysis. They extracted metrics from our simulation runs (such as mapping completion time and CPU/memory usage) and structured this data into clear, comparative charts for our final presentation.

* **Srinivas Polanki – Exploration Logic, Evaluation & Technical Documentation** 
  Led the integration of the `explore_lite` algorithm, configuring the boundary detection thresholds and mathematical stopping conditions for the autonomous exploration. They also led the project's technical documentation, organizing the defense presentation slide deck, structuring the repository's README, and ensuring our presentation materials accurately reflected the underlying robotics concepts.
