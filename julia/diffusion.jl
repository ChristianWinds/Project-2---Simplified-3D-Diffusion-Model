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

diffusion_coefficient = 0.175::Float64
room_dimension = 5.0::Float64
speed_of_gas_molecules = 250.0::Float64
timestep = ((room_dimension / speed_of_gas_molecules) / maxsize)::Float64
distance_between_blocks = (room_dimension / maxsize)::Float64
dterm = (diffusion_coefficient * timestep / (distance_between_blocks * distance_between_blocks))::Float64

pass = 0::Int64
timeamount = 0.0::Float64
ratioamount = 0.0::Float64

timeamount = (timeamount + timestep)::Float64

sumval = (0.0)::Float64

println(timeamount, " ", ratioamount, " ", sumval)

println("Box equilibrated in ", timeamount, " seconds of simulated time.")
