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
Go compilation instructions: diffusion.go does not require a compilation
command.
Go execution instructions: Within the diffusion.go source code, change the
maxSize integer to set the number of room divisions to use in the diffusion.go
program execution. Enter "go run diffusion.go" upon the command line to run the
program without a partition, or enter "go run diffusion.go (any argument)
partition" to run the program with an active partition. The partition's height
will be 75% of the room's vertical divisions' total height, floored to the
nearest room division integer less than or equal to the 75% height.
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
Lisp compilation instructions: diffusion.lisp does not use a compilation
command.
Lisp execution instructions: If diffusion.lisp is not already executable, enter
"chmod u+x diffusion.lisp" on the command line. When diffusion.lisp is
executable, enter "./diffusion.lisp" to run diffusion.lisp. diffusion.lisp does
not perform a diffusion simulation; the program also cannot activate or
deactivate a partition for a diffusion simulation.
Python compilation instructions: No compilation command is used for
diffusion.py.
Python execution instructions: Before executing diffusion.py, change the maxSize
integer in the diffusion.py source code to set the number of room divisions used
for a diffusion.py run, and set the diffusion.py source code's partitionFlag
variable to False to run diffusion.py without a partition, or set the
partitionFlag variable to True to run diffusion.py with a partition. The
partition's height will be 75% of the room's vertical divisions' total height,
floored to the nearest room division integer less than or equal to the 75%
height. Enter "python diffusion.py" in the command line to run diffusion.py.
R compilation instructions: diffusion.r does not require a compilation command.
R execution instructions: Before running diffusion.r, change the maxSize
variable in the diffusion.r source code to change the number of room divisions
to be used in the diffusion.r execution. If diffusion.r is not yet executable,
enter "chmod u+x diffusion.r" on the command line. When diffusion.r is
executable, enter "./diffusion.r" to run diffusion.r. The diffusion.r program
will not correctly complete a diffusion simulation, however, as the diffusion.r
algorithm is incomplete.
