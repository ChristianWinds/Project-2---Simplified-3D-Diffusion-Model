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
import math

def checkIfCellInPartition(arraycellx, arraycelly, arraycellz, partitionxmin, partitionxmax, partitionymin, partitionymax, partitionzmin, partitionzmax):
	# Precondition: All coordinates received by this method are valid
	# three-dimensional coordinates, and the received cell coordinates are
	# valid three-dimensional array cell coordinates. Each X, Y, and Z "Min"
	# partition variable value is also less than or equal to the respective
	# X, Y, and Z "Max" variable value.
	# Postcondition: A Boolean of whether the received array cell
	# coordinates were in the specified partition area was returned to this
	# function's caller.

	cellInPartition = False

	if (((arraycellx >= partitionxmin) and (arraycellx < partitionxmax)) and
	    ((arraycelly >= partitionymin) and (arraycelly < partitionymax)) and
	    ((arraycellz >= partitionzmin) and (arraycellz < partitionzmax))):
		cellInPartition = True
	else:
		cellInPartition = False

	return cellInPartition;

partitionFlag = True
maxSize = 10

""" Code citation
Code from GeeksforGeeks,
https://www.geeksforgeeks.org/python-using-2d-arrays-lists-the-right-way/
Accessed Tuesday, October 29th, 2019
"""
rows, columns, layers = (maxSize, maxSize, maxSize)

# Zero the cube
cube = [[[0.0 for i in range(layers)] for j in range (columns)] for k in range(rows)]

# Calculate coordinates to determine the partition location if a partition is
# active
partitionXMin = 0
partitionXMax = 0
partitionYMin = 0
partitionYMax = 0
partitionZMin = 0
partitionZMax = 0

if (partitionFlag):
	# Calculate the partition's X coordinates to place the partition at half
	# the room's length 
	partitionXMin = maxSize // 2
	partitionXMax = partitionXMin + 1

	# Calculate the partition's Y coordinates to place the partition's width
	# across the room
	partitionYMin = 0
	partitionYMax = maxSize

	# Calculate the partition's Z coordinates to set the partition's height
	# to 75% of the room height
	partitionZMin = math.floor(maxSize * 0.25)
	partitionZMax = maxSize

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
								# If the partition is active, determine
								# whether either current array cell is
								# in the partition to prevent gas from
								# moving into the partition
								cellInPartition = False

								if (partitionFlag):
									cellAInPartition = checkIfCellInPartition(i, j, k, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMin, partitionZMax);
									cellBInPartition = checkIfCellInPartition(l, m, n, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMin, partitionZMax);
									cellInPartition = cellAInPartition or cellBInPartition

								if (not (cellInPartition)):
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
				# If the partition is active, determine whether
				# the current array cell is in the partition to
				# avoid including the partition cells' gas
				# amounts
				cellInPartition = False

				if (partitionFlag):
					cellInPartition = checkIfCellInPartition(i, j, k, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMin, partitionZMax)

				if (not (cellInPartition)):
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
