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
