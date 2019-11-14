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

partitionFlag = False
maxSize = 10

""" Code citation
Code from GeeksforGeeks,
https://www.geeksforgeeks.org/python-using-2d-arrays-lists-the-right-way/
Accessed Tuesday, October 29th, 2019
"""
rows, columns, layers = (maxSize, maxSize, maxSize)

# Zero the cube
cube = [[[0.0 for i in range(layers)] for j in range (columns)] for k in range(rows)]

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
cube[0][0][0] = 1.0e21

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
	for i in range (maxSize):
		for j in range (maxSize):
			for k in range (maxSize):
				for l in range (maxSize):
					for m in range (maxSize):
						for n in range (maxSize):
							if (((i == l) and (j == m) and (k == n + 1)) or
							    ((i == l) and (j == m) and (k == n - 1)) or
							    ((i == l) and (j == m + 1) and (k == n)) or
							    ((i == l) and (j == m - 1) and (k == n)) or
							    ((i == l + 1) and (j == m) and (k == n)) or
							    ((i == l - 1) and (j == m) and (k == n))):
								change = (cube[i][j][k] - cube[l][m][n]) * dTerm
								cube[i][j][k] = cube[i][j][k] - change
								cube[l][m][n] = cube[l][m][n] + change
	time = time + timestep

	# Check for mass consistency
	sumVal = 0.0
	maxVal = cube[0][0][0]
	minVal = cube[0][0][0]
	for i in range (maxSize):
		for j in range (maxSize):
			for k in range (maxSize):
				maxVal = max(cube[i][j][k], maxVal)
				minVal = min(cube[i][j][k], minVal)
				sumVal += cube[i][j][k]

	ratio = float(minVal) / float(maxVal)

	print(time, ratio, sumVal)

	# Use an if statement and a break instruction to simulate the end of a
	# do while loop
	if (ratio >= 0.99):
		break

print("Box equilibrated in ", time, " seconds of simulated time.")
