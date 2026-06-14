chmod +x run_headless_mapping.sh
./run_headless_mapping.sh
---

### **3. `setup_workspace.sh`**
This script automates the 15+ minutes of terminal commands you ran earlier. If your professor or a peer clones this repository, they just run this one file, and it builds the entire robot environment automatically.

```bash
#!/bin/bash
echo "Starting ROS 2 Environment Setup for Autonomous Exploration..."

# 1. Update package lists
sudo apt update

# 2. Install core robotics packages
echo "Installing Nav2, SLAM Toolbox, and TurtleBot3 packages..."
sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup ros-humble-slam-toolbox ros-humble-turtlebot3-gazebo ros-humble-turtlebot3 python3-colcon-common-extensions python3-rosdep -y

# 3. Initialize and update rosdep
sudo rosdep init || true
rosdep update

# 4. Create workspace and clone the exploration node
echo "Building the custom ROS 2 Workspace..."
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://github.com/robo-friends/m-explore-ros2.git

# 5. Resolve dependencies and build the workspace
cd ~/ros2_ws
rosdep install --from-paths src -y --ignore-src
colcon build --symlink-install

# 6. Export permanent environment variables
echo "Configuring TurtleBot3 Waffle variables..."
grep -qxF "export TURTLEBOT3_MODEL=waffle" ~/.bashrc || echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
grep -qxF "export GAZEBO_MODEL_PATH=\$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models" ~/.bashrc || echo "export GAZEBO_MODEL_PATH=\$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models" >> ~/.bashrc

echo "Setup Complete! Please close this terminal and open a new one to apply the environment variables."
