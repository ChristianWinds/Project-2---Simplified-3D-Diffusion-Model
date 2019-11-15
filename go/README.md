Go compilation instructions: diffusion.go does not require a compilation
command.
Go execution instructions: Within the diffusion.go source code, change the
maxSize integer to set the number of room divisions to use in the diffusion.go
program execution. Enter "go run diffusion.go" upon the command line to run the
program without a partition, or enter "go run diffusion.go (any argument)
partition" to run the program with an active partition. The partition's height
will be 75% of the room's vertical divisions' total height, floored to the
nearest room division integer less than or equal to the 75% height.
