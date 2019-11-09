#!/usr/bin/env Rscript

# Programmer: Christian Winds
# Course: CSC 330 Organization of Programming Languages
# School Year: 2019-2020 School Year

# Code from Dr. Pounds,
# /tmp/diffusion.java
# Accessed Saturday, November 9th, 2019

maxsize = 10

# Zero the cube
for (i in 1:maxsize)
{
	for (j in 1:maxsize)
	{
		for (k in 1:maxsize)
		{
		}
	}
}

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

pass = 0

# Create a variable to track increasing system time
time = 0.0

ratio = 0.0

# Code from Stack Overflow,
# https://stackoverflow.com/questions/4357827/do-while-loop-in-r
# Accessed Saturday, November 9th, 2019
# and from YourBasic,
# https://yourbasic.org/golang/do-while-loop/
# Accessed Saturday, November 9th, 2019

repeat
{
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
						    ((i == l - 1) && (j == m) && (k == n))) {

						}
					}
				}
			}
		}
	}
}

time = time + timestep

sumval = 0.0
if (!(ratio < 0.99))
{
	break
}
}

cat ("Box equilibrated in", time, "seconds of simulated time.\n")
