! Programmer: Christian Winds
! Course: CSC 330 Organization of Programming Languages
! School Year: 2019-2020 School Year

module checkIfCellInPartitionModule

! Precondition: All coordinates received by this function are valid
! three-dimensional coordinates, and the received cell coordinates are valid
! three-dimensional array cell coordinates. Each X, Y, and Z "Min" partition
! variable value is also less than or equal to the respective X, Y, and Z "Max"
! variable value.
! Postcondition: A Boolean of whether the received array cell coordinates were
! in the specified partition area was returned to this function's caller.

        implicit none
        private
        public :: check_if_cell_in_partition
contains
        function check_if_cell_in_partition(arrayCellX,&
                                           &arrayCellY,&
                                           &arrayCellZ,&
                                           &partitionXMin,&
                                           &partitionXMax,&
                                           &partitionYMin,&
                                           &partitionYMax,&
                                           &partitionZMin,&
                                           &partitionZMax)&
                                           & result (cell_in_partition)
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

                ! Compare the array cell coordinates and partition cell
                ! coordinates to determine whether the array cell exists within
                ! the partition
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
        end function 
end module
