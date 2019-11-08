#=
	Programmer: Christian Winds
	Course: CSC 330 Organization of Programming Languages
	School Year: 2019-2020 School Year
=#

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

pass = 0::Int64

# Create a variable to track increasing system time
timeamount = 0.0::Float64

ratioamount = 0.0::Float64

timeamount = (timeamount + timestep)::Float64

# Check for mass consistency
sumval = (0.0)::Float64
maxval = cube[1, 1, 1]::Float64
minval = cube[0, 0, 0]::Float64

sumval += cube[0, 0, 0]::Float64

println(timeamount, " ", ratioamount, " ", sumval)

println("Box equilibrated in ", timeamount, " seconds of simulated time.")
