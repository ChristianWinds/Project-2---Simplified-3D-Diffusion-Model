! Programmer: Christian Winds
! Course: CSC 330 Organization of Programming Languages
! School Year: 2019-2020 School Year

! Code from Dr. Pounds,
! /tmp/diffusion.java
! Accessed October 15th, 2019

! Checked for mass consistency on 10/20/19 by Dr. Pounds
 
program diffusion
implicit none
integer, parameter :: maxSize = 10
integer :: partitionXMin, partitionXMax, partitionYMin, partitionYMax,&
&partitionZMin, partitionZMax
integer :: i, j, k, l, m, n
real :: diffusionCoefficient, roomDimension, speedOfGasMolecules, timestep,&
&distanceBetweenBlocks, dTerm, time, ratio, change, sumVal, maxValue, minValue
real, DIMENSION(maxSize, maxSize, maxSize) :: cube
LOGICAL :: partitionFlag = .FALSE.
LOGICAL :: cell_in_partition = .FALSE.

! Zero the cube
do  i = 1, maxSize
        do j = 1, maxSize
                do k = 1, maxSize
                        cube(i, j, k) = 0.0
                end do
        end do
end do

! Calculate coordinates to determine the partition location if a partition is
! active
if (partitionFlag) then
        ! Calculate the partition's X coordinates to place the partition at half
        ! the room's length
        partitionXMin = maxSize / 2
        partitionXMax = partitionXMin + 1

        ! Calculate the partition's Y coordinates to place the partition's width
        ! across the room
        partitionYMin = 0
        partitionYMax = maxSize

        ! Calculate the partition's Z coordinates to set the partition's height
        ! to 75% of the room height
        partitionZMin = floor(maxSize * 0.25)
        partitionZMax = maxSize
endif

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
cube(1, 1, 1) = 1.0e21

time = 0.0
ratio = 0.0

do while (ratio < 0.99)
    do i = 1, maxSize, 1
        do j = 1, maxSize, 1
            do k = 1, maxSize, 1
                do l = 1, maxSize, 1
                    do m = 1, maxSize, 1
                        do n = 1, maxSize, 1
                            if (((i == l) .and. (j == m) .and. (k == n + 1)) .or.&
                               &((i == l) .and. (j == m) .and. (k == n - 1)) .or.&
                               &((i == l) .and. (j == m + 1) .and. (k == n)) .or.&
                               &((i == l) .and. (j == m - 1) .and. (k == n)) .or.&
                               &((i == l + 1) .and. (j == m) .and. (k == n)) .or.&
                               &((i == l - 1) .and. (j == m) .and. (k == n))) then
                                change = (cube(i, j, k) - cube(l, m, n)) * DTerm
                                cube(i, j, k) = cube(i, j, k) - change
                                cube(l, m, n) = cube(l, m, n) + change
                            end if
                        end do
                    end do
                end do
            end do
        end do
    end do
    time = time + timestep

    ! Check for mass consistency
    sumVal = 0.0
    maxValue = cube(1, 1, 1)
    minValue = cube(1, 1, 1)
    do i = 1, maxSize, 1
        do j = 1, maxSize, 1
            do k = 1, maxSize, 1
                ! If the partition is active, determine whether the current array
                ! cell is in the partition to avoid including the partition
                ! cells' gas amounts
                cell_in_partition = .FALSE.

                if (partitionFlag) then
                        cell_in_partition = check_if_cell_in_partition(i, j, k,&
&partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMin,&
&partitionZMax) 
                endif

                maxValue = maxval(cube)
                minValue = minval(cube)
                sumVal = sumVal + cube(i, j, k)
            end do
        end do
    end do
    ratio = minValue / maxValue

    print *, time, ' ', ratio, ' ', sumVal
end do

print *, 'Box equilibrated in ', time, ' seconds of simulated time.'
end program diffusion

function check_if_cell_in_partition(arrayCellX,&
                                   &arrayCellY,&
                                   &arrayCellZ,&
                                   &partitionXMin,&
                                   &partitionXMax,&
                                   &partitionYMin,&
                                   &partitionYMax,&
                                   &partitionZMin,&
                                   &partitionZMax) result (cell_in_partition)
! Precondition: All coordinates received by this function are valid
! three-dimensional coordinates, and the received cell coordinates are valid
! three-dimensional array cell coordinates. Each X, Y, and Z "Min" partition
! variable value is also less than or equal to the respective X, Y, and Z "Max"
! variable value.
! Postcondition: A Boolean of whether the received array cell coordinates were
! in the specified partition area was returned to this function's caller.

implicit none

        LOGICAL :: cell_in_partition
       
        integer :: arrayCellX
        integer :: arrayCellY
        integer :: arrayCellZ
        integer :: partitionXMin
        integer :: partitionXMax
        integer :: partitionYMin
        integer :: partitionYMax
        integer :: partitionZMin
        integer :: partitionZMax

        cell_in_partition = .FALSE.

        ! Compare the array cell coordinates and partition cell coordinates to
        ! determine whether the array cell exists within the partition
        if (((arrayCellX >= partitionXMin) .and.&
           &(arrayCellX < partitionXMax)) .and.&
           &((arrayCellY >= partitionYMin) .and.&
           &(arrayCellY < partitionYMax)) .and.&
           &((arrayCellZ >= partitionZMin) .and.&
           &(arrayCellZ < partitionZMax))) then
                cell_in_partition = .TRUE.
        else
                cell_in_partition = .FALSE.
        endif

end function check_if_cell_in_partition
