#!/usr/bin/env Rscript

# Programmer: Christian Winds
# Course: CSC 330 Organization of Programming Languages
# School Year: 2019-2020 School Year

maxsize = 10

diffusion_coefficient = 0.175

# Create a variable for room dimension to represent 5 meters
room_dimension = 5

# Set a gas molecule speed variable to represent 100 g/mol gas molecules' speed
# at room temperature
speed_of_gas_molecules = 250.0

# Create a timestep variable to represent the value of h in seconds
timestep = (room_dimension / speed_of_gas_molecules) / maxsize

distanceBetweenBlocks = room_dimension / maxsize

DTerm = diffusion_coefficient * timestep / (distance_between_blocks * distance_between_blocks)

time = 0.0

cat ("Box equilibrated in", time, "seconds of simulated time.\n")
