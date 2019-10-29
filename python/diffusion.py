""" Program information
Programmer: Christian Winds
Course: CSC 330 Organization of Programming Languages
School Year: 2019-2020 School Year
"""

""" Code citation
Code from Dr. Pounds,
/tmp/diffusion.java
Accessed Tuesday, October 29th, 2019
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
timestep = (float(roomDimension) / float(speedOfGasMolecules)) / float(maxSize)

distanceBetweenBlocks = float(roomDimension) / float(maxSize)

dTerm = float(diffusionCoefficient) * float(timestep) / (float(distanceBetweenBlocks) * float(distanceBetweenBlocks))

# Initialize the first cell


passes = 0

# Create a double variable to track increasing system time
time = 0.0


""" Code citation
Code from javatpoint,
https://www.javatpoint.com/python-do-while-loop
Accessed Tuesday, October 29th, 2019
"""
ratio = 0.0

# Use a while True loop to simulate the beginning of a do while loop
while True:


	# Use an if statemene and a break instruction to simulate the end of a
	# do while loop
	if (ratio >= 0.99)
		break

# Check for mass consistency

