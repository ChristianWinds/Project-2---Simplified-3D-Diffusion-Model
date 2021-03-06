#!/usr/bin/env Rscript

# Programmer: Christian Winds
# Course: CSC 330 Organization of Programming Languages
# School Year: 2019-2020 School Year

# Code from Dr. Pounds,
# /tmp/diffusion.java
# Accessed Saturday, November 9th, 2019

maxsize = 10

# Code from Stack Overflow,
# https://stackoverflow.com/questions/10961141/setting-up-a-3d-matrix-in-r-and-accessing-certain-elements
# Accessed Friday, November 15th, 2019
someData <- rep(0, maxsize*maxsize*maxsize)
cube <- array(someData, dim = c(maxsize,maxsize,maxsize))

diffusion_coefficient = 0.175

# Create a variable for room dimension to represent 5 meters
room_dimension = 5

# Set a gas molecule speed variable to represent 100 g/mol gas molecules' speed
# at room temperature
speed_of_gas_molecules = 250.0

# Create a timestep variable to represent the value of h in seconds
timestep = (room_dimension / speed_of_gas_molecules) / maxsize

distance_between_blocks = room_dimension / maxsize

DTerm = diffusion_coefficient * timestep / (distance_between_blocks * distance_between_blocks)

# Initialize the first cell
cube[0, 0, 0] <- 1.0e21;

pass = 0

# Create a variable to track increasing system time
time = 0.0

ratio = 0.0

	for (i in 1:maxsize)
	{
		for (j in 1:maxsize)
		{
			for (k in 1:maxsize)
			{
				for (l in 1:maxsize)
				{
					for (m in 1:maxsize)
					{
						for (n in 1:maxsize)
						{
							if (((i == l) && (j == m) && (k == n + 1)) ||
							    ((i == l) && (j == m) && (k == n - 1)) ||
							    ((i == l) && (j == m + 1) && (k == n)) ||
							    ((i == l) && (j == m - 1) && (k == n)) ||
							    ((i == l + 1) && (j == m) && (k == n)) ||
							    ((i == l - 1) && (j == m) && (k == n)))
							{
								change = (cube[i, j, k] - cube[l, m, n]) * DTerm
								cube[i, j, k] = cube[i, j, k] - change
								cube[l, m, n] = cube[l, m, n] + change
							}
						}
					}
				}
			}
		}
	}

	time = time + timestep

	# Check for mass consistency
	sumval = 0.0
	maxval = cube[0, 0, 0]
	minval = cube[0, 0, 0]
	for (i in 1:maxsize)
	{
		for (j in 1:maxsize)
		{
			for (k in 1:maxsize)
			{
				# Create a vector for the max function to
				# determine the higher read value
				maxfunctionvector <-c(cube[i, j, k], maxval)

				maxval = max(maxfunctionvector)

				# Create a vector for the min function to
				# determine the lower read value
				minfunctionvector <-c(cube[i, j, k], minval)

				minval = min(minfunctionvector)

				sumval = sumval + cube[i, j, k]
			}
		}
	}

	ratio = minval / maxval

	cat (time, ratio, sumval, "\n")

cat ("Box equilibrated in", time, "seconds of simulated time.\n")
