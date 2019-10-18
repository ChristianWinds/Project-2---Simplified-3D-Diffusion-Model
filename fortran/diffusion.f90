! Programmer: Christian Winds
! Course: CSC 330 Organization of Programming Languages
! School Year: 2019-2020 School Year

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
print *, time, ' ', ratio, ' ', sumVal
print *, 'Box equilibrated in ', time, ' seconds of simulated time.'
end program diffusion
