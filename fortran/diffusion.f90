! Programmer: Christian Winds
! Course: CSC 330 Organization of Programming Languages
! School Year: 2019-2020 School Year

! Code from Dr. Pounds,
! /tmp/diffusion.java
! Accessed October 15th, 2019

program diffusion
implicit none
integer, parameter :: maxSize = 10
integer :: i, j, k, l, m, n, passes
real :: diffusionCoefficient, roomDimension, speedOfGasMolecules, timestep, distanceBetweenBlocks, dTerm, time, ratio, change,&
&sumVal, maxValue, minValue
real, DIMENSION(maxSize, maxSize, maxSize) :: cube

! Zero the cube
do  i = 0, maxSize
        do j = 0, maxSize
                do k = 0, maxSize
                        cube(i, j, k) = 0.0
                end do
        end do
end do

diffusionCoefficient = 0.175

! Create a variable for room dimension to represent 5 meters
roomDimension = 5

! Set a gas molecule speed variable to represent gas molecules' speed at room
! temperature
speedOfGasMolecules = 250.0

! Create a timestep variable to represent the value of h in seconds
timestep = (roomDimension / speedOfGasMolecules) / maxSize
distanceBetweenBlocks = roomDimension / maxSize

DTerm = diffusionCoefficient * timestep / (distanceBetweenBlocks *&
&distanceBetweenBlocks)

! Initialize the first cell
cube(0:0:0) = 1.0e21

passes = 0
time = 0.0
ratio = 0.0

do while (ratio < 0.99)
    do i = 0, maxSize, 1
        do j = 0, maxSize, 1
            do k = 0, maxSize, 1
                do l = 0, maxSize, 1
                    do m = 0, maxSize, 1
                        do n = 0, maxSize, 1
                            if (((i == l) .and. (j == m) .and. (k == n + 1)) .or.&
&((i == l) .and. (j&
&== m) .and. (k == n - 1)) .or.&
                                                        &((i == l) .and. (j&
&== m + 1) .and. (k == n)) .or.&
                                                        &((i == l) .and. (j&
&== m - 1) .and. (k == n)) .or.&
                                                        &((i == l + 1) .and.&
&(j == m) .and. (k == n)) .or.&
                                                        &((i == l - 1) .and.&
&(j == m) .and. (k == n))) then
                                                            change =&
&(cube(i:j:k) - cube(l:m:n)) * DTerm
                                                            cube(i:j:k) =&
&cube(i:j:k) - change
                                                            cube(l:m:n) =&
&cube(l:m:n) + change
                            end if
                        end do
                    end do
                end do
            end do
        end do
    end do
end do

print *, time, ' ', ratio, ' ', sumVal
print *, 'Box equilibrated in ', time, ' seconds of simulated time.'
end program diffusion
