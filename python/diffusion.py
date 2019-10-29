""" Program information
Programmer: Christian Winds
Course: CSC 330 Organization of Programming Languages
School Year: 2019-2020 School Year
"""

maxSize = 10

# Zero the cube

diffusionCoefficient = 0.175

# Create a variable for room dimension to represent 5 meters
roomDimension = 5

# Set a gas molecule speed variable to represent 100 g/mol gas molecules' speed
# at room temperature
speedOfGasMolecules = 250.0

# Create a timestep variable to represent the value of h in seconds
timestep = (roomDimension(float) / speedOfGasMolecules(float)) / maxSize(float)

distanceBetweenBlocks = roomDimension(float) / maxSize(float)

dTerm = diffusionCoefficient(float) * timestep(float) / (distanceBetweenBlocks(float) * distanceBetweenBlocks(float))

# Initialize the first cell


passes = 0

# Create a double variable to track increasing system time
time = 0.0

ratio = 0.0

# Check for mass consistency

