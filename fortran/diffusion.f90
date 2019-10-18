! Programmer: Christian Winds
! Course: CSC 330 Organization of Programming Languages
! School Year: 2019-2020 School Year

! Code from Dr. Pounds,
! /tmp/diffusion.java
! Accessed October 15th, 2019

program diffusion
implicit none
integer :: maxSize
real :: diffusionCoefficient, roomDimension, speedOfGasMolecules, timestep,
distanceBetweenBlocks, dTerm, time, ratio, change, sumVal, maxVal, minVal
real, DIMENSION(maxSize, maxSize, maxSize) :: cube

maxSize = 10

! Zero the cube
do  i = 0, maxSize
        do j = 0, maxSize
                do k = 0, maxSize
                        cube = 0.0
                end do
        end do
end do

diffusionCoefficient = 0.175;

! Create a variable for room dimension to represent 5 meters
roomDimension = 5;

! Set a gas molecule speed variable to represent gas molecules' speed at room
! temperature
speedOfGasMolecules = 250.0;

! Create a timestep variable to represent the value of h in seconds
timestep = (roomDimension / speedOfGasMolecules) / maxSize;
distanceBetweenBlocks = roomDimension / maxSize;

DTerm = diffusionCoefficient * timestep / (distanceBetweenBlocks * distanceBetweenBlocks);

print *, time, ' ', ratio, ' ', sumVal
print *, 'Box equilibrated in ', time, ' seconds of simulated time.'
end program diffusion
