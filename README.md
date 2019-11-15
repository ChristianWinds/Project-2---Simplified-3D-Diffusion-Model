# Project 2 - Simplified 3D Diffusion Model

Organization of Programming Languages Project 2
C compilation instructions: Enter "gcc diffusion.c -lm" on the command line.
C execution instructions: Using the name of the executable file created by the
gcc compiler, enter "(executable file name) (positive room divisions integer)"
on the command line to run the C program with the specified number of room
divisions and without a partition, or enter "(executable file name) (positive
room divisions integer) partition" on the command line to run the program with
both the specified number of room divisions and a partition. The partition's
height will be the height of 75% of the room's vertical divisions, floored to
the nearest room division integer less than or equal to the 75% height.
C# compilation instructions: Enter "mcs diffusion.cs" in the command line.
C# execution instructions: Enter "mono diffusion.exe (positive room divisions
integer)" in the command line to run the program with the specified number of
room divisions and without a partition. Enter "mono diffusion.exe (positive room
divisions integer) partition" in the command line to run the program with both
the specified number of room divisions and a partition. The partition's height
will be 75% of the room's vertical divisions' total height, floored to the
nearest room division integer less than or equal to the 75% height.
Fortran compilation instructions: Before compiling the diffusion.90 program,
change the maxSize variable in the diffusion.90 source code to set the number
of room divisions for the program, and set the diffusion.90 source code's
partitionFlag variable to ".FALSE." to prepare diffusion.90 to compile without
a partition, or set the partitionFlag variable to ".TRUE." to prepare
diffusion.90 to compile with a partition. With both
checkIfCellInPartitionModule.f90 and diffusion.f90 in the same directory, enter
the command "gfortran checkIfCellInPartitionModule.f90 diffusion.f90" in the
command line to compile the source code necessary to run the diffusion.f90
program.
Fortran execution instructions: With the files checkifcellinpartitionmodule.mod
and a.out, each created from compilng checkIfCellInPartitionModule.f90 and
diffusion.f90, within the current directory, enter "a.out" in the command line
to run the diffusion.f90 program.
Go compilation instructions: diffusion.go does not require a compilation
command.
Go execution instructions: Within the diffusion.go source code, change the
maxSize integer to set the number of room divisions to use in the diffusion.go
program execution. Enter "go run diffusion.go" upon the command line to run the
program without a partition, or enter "go run diffusion.go (any argument)
partition" to run the program with an active partition.
Python compilation instructions:
Python execution instructions:
Julia compilation instructions:
Julia execution instructions:
R compilation instructions:
R execution instructions:
Lisp compilation instructions:
Lisp execution instructions:
