import os
import numpy as np
from PIL import Image

print("Starting 3D Terrain Generation...")

# 1. Setup strict absolute paths
project_dir = os.path.expanduser("~/autonomous_exploration_project")
image_path = os.path.join(project_dir, "procedural_hills.png")
world_path = os.path.join(project_dir, "procedural_hills.world")

# 2. Mathematical Heightmap Generation
SIZE = 513  
print(f"Calculating {SIZE}x{SIZE} terrain matrix...")

x = np.linspace(0, 4 * np.pi, SIZE)
y = np.linspace(0, 4 * np.pi, SIZE)
X, Y = np.meshgrid(x, y)

terrain = (
    np.sin(X) * np.cos(Y) * 2.5 + 
    np.sin(X * 0.5) * 1.5 + 
    np.cos(Y * 0.8) * 1.5 + 
    np.sin(X * 2.0 + Y) * 0.5
)

terrain_norm = np.interp(terrain, (terrain.min(), terrain.max()), (0, 255))
Image.fromarray(terrain_norm.astype('uint8'), mode='L').save(image_path)
print(f"Saved heightmap image: {image_path}")

# 3. Generate the Gazebo World XML File
print("Writing Gazebo .world file...")
world_xml = f"""<?xml version="1.0" ?>
<sdf version="1.6">
  <world name="custom_generated_terrain">
    
    <include><uri>model://sun</uri></include>
    
    <model name="procedural_hills">
      <static>true</static>
      <link name="terrain_link">
        
        <collision name="collision">
          <geometry>
            <heightmap>
              <uri>file://{image_path}</uri>
              <size>50 50 4</size>
              <pos>0 0 -1.5</pos>
            </heightmap>
          </geometry>
        </collision>
        
        <visual name="visual">
          <geometry>
            <heightmap>
              <texture>
                <diffuse>file://media/materials/textures/dirt_diffusespecular.png</diffuse>
                <normal>file://media/materials/textures/flat_normal.png</normal>
                <size>5</size>
              </texture>
              <uri>file://{image_path}</uri>
              <size>50 50 4</size>
              <pos>0 0 -1.5</pos>
            </heightmap>
          </geometry>
        </visual>
        
      </link>
    </model>
  </world>
</sdf>
"""

with open(world_path, "w") as file:
    file.write(world_xml)

print(f"Saved Gazebo world: {world_path}")
print("Generation Complete! You can now launch this world in Gazebo.")
