Fortran compilation instructions: Before compiling the diffusion.90 program,
change the maxSize variable in the diffusion.90 source code to set the number
of room divisions for the program, and set the diffusion.90 source code's
partitionFlag variable to ".FALSE." to prepare diffusion.90 to compile without
a partition, or set the partitionFlag variable to ".TRUE." to prepare
diffusion.90 to compile with a partition. The partition's height will be 75% of
the room's vertical divisions' total height, floored to the nearest room
division integer less than or equal to the 75% height. With both
checkIfCellInPartitionModule.f90 and diffusion.f90 in the same directory, enter
the command "gfortran checkIfCellInPartitionModule.f90 diffusion.f90" in the
command line to compile the source code necessary to run the diffusion.f90
program.
Fortran execution instructions: With the files checkifcellinpartitionmodule.mod
and a.out, each created from compilng checkIfCellInPartitionModule.f90 and
diffusion.f90, within the current directory, enter "a.out" in the command line
to run the diffusion.f90 program.
