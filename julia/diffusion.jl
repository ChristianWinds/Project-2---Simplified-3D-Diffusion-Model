#!/usr/bin/julia

#=
	Programmer: Christian Winds
	Course: CSC 330 Organization of Programming Languages
	School Year: 2019-2020 School Year
=#

function checkIfCellInPartition(arraycellx,
				arraycelly,
				arraycellz,
				partitionxmin,
				partitionxmax,
				partitionymin,
				partitionymax,
				partitionzmin,
				partitionzmax)
	# Precondition: All coordinates received by this function are valid
	# three-dimensional coordinates, and the received cell coordinates are
	# valid three-dimensional array cell coordinates. Each X, Y, and Z "min"
	# partition variable value is also less than or equal to the respective
	# X, Y, and Z "max" variable value.
	# Postcondition: A Boolean of whether the received array cell
	# coordinates were in the specified partition area was returned to this
	# function's caller.

	cellinpartition = false::Bool

	# Compare the array cell coordinates and partition cell coordinates to
	# determine whether the array cell exists within the partition
	if (((arraycellx >= partitionxmin) && (arraycellx < partitionxmax)) &&
	    ((arraycelly >= partitionymin) && (arraycelly < partitionymax)) &&
	    ((arraycellz >= partitionzmin) && (arraycellz < partitionzmax)))
		cellinpartition = true
	else
		cellinpartition = false
	end

	return cellinpartition
end

partitionflag = false::Bool

#=
	Code from Dr. Pounds,
	/tmp/diffusion.java
	Accessed Friday, November 8th, 2019
=#
maxsize = 10::Int64
cube = Array{Float64}(undef, maxsize, maxsize, maxsize)

# Zero the cube
for i = 1:maxsize
	for j = 1:maxsize
		for k = 1:maxsize
			cube[i, j, k] = 0.0::Float64
		end
	end
end

# Calculate coordinates to determine the partition location if a partition is
# active
partitionxmin = 0::Int64
partitionxmax = 0::Int64
partitionymin = 0::Int64
partitionymax = 0::Int64
partitionzmin = 0::Int64
partitionzmax = 0::Int64

if (partitionflag)
	# Calculate the partition's X coordinates to place the partition at half
	# the room's length
	partitionxmin = maxsize / 2
	partitionxmax = partitionxmin + 1

	# Calculate the partition's Y coordinates to place the partition's
	# width across the room
	partitionymin = 0
	partitionymax = maxsize

	# Calculate the partition's Z coordinates to set the partition's height
	# to 75% of the room height
	partitionzmin = floor(Int64, maxsize * 0.25)
	partitionzmax = maxsize
end

diffusion_coefficient = 0.175::Float64

# Create a variable for room dimension to represent 5 meters
room_dimension = 5.0::Float64

# Set a gas molecule speed variable to represent 100 g/mol gas molecules' speed
# at room temperature
speed_of_gas_molecules = 250.0::Float64

# Create a timestep variable to represent the value of h in seconds
timestep = ((room_dimension / speed_of_gas_molecules) / maxsize)::Float64

distance_between_blocks = (room_dimension / maxsize)::Float64

dterm = (diffusion_coefficient * timestep / (distance_between_blocks * distance_between_blocks))::Float64

# Initialize the first cell
cube[1, 1, 1] = 1.0e21::Float64

# Create a variable to track increasing system time
timeamount = 0.0::Float64

ratioamount = 0.0::Float64

#=
	Code from Rosetta Code,
	https://www.rosettacode.org/wiki/Loops/Do-while#Julia
	Accessed Friday, November 8th, 2019
	and from YourBasic,
	https://yourbasic.org/golang/do-while-loop/
	Accessed Saturday, November 9th, 2019
=#
while true
	# Iterate through the cube's cells to diffuse the gas through the room
	for i = 1:maxsize
		for j = 1:maxsize
			for k = 1:maxsize
				for l = 1:maxsize
					for m = 1:maxsize
						for n = 1:maxsize
							if (((i == l) && (j == m) && (k == n + 1)) ||
							    ((i == l) && (j == m) && (k == n - 1)) ||
							    ((i == l) && (j == m + 1) && (k == n)) ||
							    ((i == l) && (j == m - 1) && (k == n)) ||
							    ((i == l + 1) && (j == m) && (k == n)) ||
							    ((i == l - 1) && (j == m) && (k == n)))
								# If the partition is active,
								# determine whether either current
								# array cell is in the partition to
								# prevent gas from moving into the
								# partition
								cellinpartition = false::Bool

								if (partitionflag)
									cellinpartition = (checkIfCellInPartition(i, j, k, partitionxmin, partitionxmax, partitionymin, partitionymax, partitionzmin, partitionzmax)) ||
											  (checkIfCellInPartition(l, m, n, partitionxmin, partitionxmax, partitionymin, partitionymax, partitionzmin, partitionzmax))::Bool
								end

								if (!(cellinpartition))
									change = ((cube[i, j, k] -  cube[l, m, n]) * dterm)::Float64
									cube[i, j, k] = (cube[i, j, k] - change)::Float64
									cube[l, m, n] = (cube[l, m, n] + change)::Float64
								end
							end
						end
					end
				end
			end
		end
	end

	global timeamount
	timeamount = (timeamount + timestep)::Float64

	# Check for mass consistency
	sumval = 0.0::Float64
	maxval = cube[1, 1, 1]::Float64
	minval = cube[1, 1, 1]::Float64

	for i = 1:maxsize
		for j = 1:maxsize
			for k = 1:maxsize
				# If the partition is active, determine whether
				# the current array cell is in the partition to
				# avoid including the partition cells' gas
				# amounts
				cellinpartition = false::Bool
				if (partitionflag)
					cellinpartition = checkIfCellInPartition(i, j, k, partitionxmin, partitionxmax, partitionymin, partitionymax, partitionzmin, partitionzmax)::Bool
				end

				if (!(cellinpartition))
					maxval = max(cube[i, j, k], maxval)::Float64
					minval = min(cube[i, j, k], minval)::Float64
					sumval = sumval + cube[i, j, k]::Float64
				end
			end
		end
	end

	ratioamount = minval / maxval::Float64

	println(timeamount, " ", ratioamount, " ", sumval)

	if (!(ratioamount < 0.99))
		break
	end
end
println("Box equilibrated in ", timeamount, " seconds of simulated time.")
