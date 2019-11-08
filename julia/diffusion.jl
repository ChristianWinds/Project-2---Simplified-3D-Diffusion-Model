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

maxsize = 10
diffusion_coefficient = 0.175
room_dimension = 5
speed_of_gas_molecules = 250.0
timestep = (room_dimension / speed_of_gas_molecules) / maxsize
distance_between_blocks = room_dimension / maxsize
dterm = diffusion_coefficient * timestep / (distance_between_blocks * distance_between_blocks)

pass = 0
timeamount = 0.0
ratioamount = 0.0

timeamount = timeamount + timestep

sumval = 0.0

println(timeamount, " ", ratioamount, " ", sumval)

println("Box equilibrated in ", timeamount, " seconds of simulated time.")
