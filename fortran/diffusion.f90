! Programmer: Christian Winds
! Course: CSC 330 Organization of Programming Languages
! School Year: 2019-2020 School Year

program diffusion
implicit none
integer :: maxSize
real :: diffusionCoefficient, roomDimension, speedOfGasMolecules, timestep,
distanceBetweenBlocks, dTerm, time, ratio, change, sumVal, maxVal, minVal

maxSize 10
cube maxSize maxSize maxSize

! Zero the cube
print *, time, ' ', ratio, ' ', sumVal
print *, 'Box equilibrated in ', time, ' seconds of simulated time.'
end program diffusion
