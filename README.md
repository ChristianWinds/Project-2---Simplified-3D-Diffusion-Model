# Project 2 - Simplified 3D Diffusion Model

Organization of Programming Languages Project 2
C compilation instructions: Enter "gcc diffusion.c -lm" on the command line.
C execution instructions: Using the name of the executable file created by the
gcc compiler, enter "(executable file name) (positive room size integer)" to run
the program with the specified room size and without a partition, or enter
"(executable file name) (positive room size integer) partition" to run the
program with both the specified room size and a partition. The partition's
height will be 75% of the room's height, floored to the nearest integer less
than or equal to the 75% height.
C# compilation instructions: Enter "mcs diffusion.cs" in the command line.
C# execution instructions: Enter "mono diffusion.exe (positive room size
integer)" in the command line to run the program with the specified room size
and without a partition. Enter "mono diffusion.exe (positive room size integer)
partition" in the command line to run the program with both the specified room
size and a partition. The partition's height will be 75% of the room's height,
floored to the nearest integer less than or equal to the 75% height.
Python compilation instructions:
Python execution instructions:
Fortran compilation instructions: With both checkIfCellInPartitionModule.f90 and
diffusion.f90 in the same directory, enter the command "gfortran
checkIfCellInPartitionModule.f90 diffusion.f90" to compile the source code
necessary to run the diffusion.f90 program.
Fortran execution instructions: In the diffusion.f90 source code, change the
maxSize integer to alter the number of division used in the program's room, and
set the partitionFlag variable in the source code to ".FALSE." to prepare
diffusion.f90 to run without a partition, or set partitionFlag to ".TRUE." to
prepare the program to run with a partition. With the files
checkifcellinpartitionmodule.mod and a.out, each created from compilng
checkIfCellInPartitionModule.f90 and diffusion.f90, in the current directory,
enter a.out in the command line to run the diffusion.f90 program.
Julia compilation instructions:
Julia execution instructions:
R compilation instructions:
R execution instructions:
Go compilation instructions:
Go execution instructions:
Lisp compilation instructions:
Lisp execution instructions:
