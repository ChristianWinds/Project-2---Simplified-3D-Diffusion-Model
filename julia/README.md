Julia compilation instructions: No compilation command is used for diffusion.jl.
Julia execution instructions: If diffusion.jl is not already executable, enter
"chmod u+x diffusion.jl" on the command line to permit diffusion.jl to be
executed. To change the number of room divisions for a diffusion.jl run, before
executing diffusion.jl, change the maxSize integer value in the diffusion.jl
source code. To decide whether diffusion.jl runs with an active partition, set
partitionFlag to false in the diffusion.jl source code to prepare diffusion.jl
to run without a partition, or set partitionFlag to true to prepare diffusion.jl
to run with an active partition. The partition's height will be 75% of the
room's total vertical division height, floored to the nearest room division
integer less than or equal to the 75% height. When diffusion.jl is executable,
enter "./diffusion.jl" to run diffusion.jl.
