// Programmer: Christian Winds
// Course: CSC 330 Organization of Programming Languages
// School Year: 2019-2020 School Year

// Code from Dr. Pounds,
// /tmp/diffusion.java
// Accessed Tuesday, October 29th, 2019
package main

import "fmt"
import "os"
import "math"

func main() {
	// Examine the command line arguments to determine whether to activate
	// the partition
	var partitionFlag bool = false

	if (len(os.Args) > 2) {
		var partitionArgument string = os.Args[2]

		if (partitionArgument == "partition") {
			partitionFlag = true
		} else {
			partitionFlag = false
		}
	}

	const maxSize int = 10
	var cube[maxSize][maxSize][maxSize] float64

	// Zero the cube
	// Code from Stack Overflow,
	// https://stackoverflow.com/questions/37668224/iterating-over-over-a-2d-slice-in-go
	// Accessed Thursday, November 7th, 2019
	for i := range cube {
		for j := range cube {
			for k := range cube {
				cube[i][j][k] = 0.0
			}
		}
	}

	// Calculate coordinates for a partition location if a partition is
	// active
	var partitionXMin int = 0
	var partitionXMax int = 0
	var partitionYMin int = 0
	var partitionYMax int = 0
	var partitionZMinInt int = 0
	var partitionZMax int = 0

	if (partitionFlag) {
		// Calculate the partition's X coordinates to place the
		// partition at half the room's length
		partitionXMin = maxSize / 2
	}

	var diffusionCoefficient float64 = 0.175

	// Create a variable for room dimension to represent 5 meters
	var roomDimension float64 = 5

	// Set a gas molecule speed variable to represent gas molecules' speed
	// at room temperature
	var speedOfGasMolecules float64 = 250.0

	// Create a timestep variable to represent the value of h in seconds
	var timestep float64 = (roomDimension / speedOfGasMolecules) / float64(maxSize)

	var distanceBetweenBlocks float64 = roomDimension / float64(maxSize)

	var dTerm float64 = diffusionCoefficient * timestep / (distanceBetweenBlocks * distanceBetweenBlocks)

	// Initialize the first cell
	cube[0][0][0] = 1.0e21

	// Create a double variable to track increasing system time
	var time float64 = 0.0

	var ratio float64 = 0.0

	var l int
	var m int
	var n int

	// Code from YourBasic,
	// https://yourbasic.org/golang/do-while-loop/
	// Accessed Thursday, November 7th, 2019
	for {
		for i := 0; i < int(maxSize); i++ {
			for j := 0; j < int(maxSize); j++ {
				for k := 0; k < int(maxSize); k++ {
					for l = 0; l < int(maxSize); l++ {
						for m = 0; m < int(maxSize); m++ {
							for n = 0; n < int(maxSize); n++ {
								if (((i == l) && (j == m) && (k == n + 1)) ||
								   ((i == l) && (j == m) && (k == n - 1)) ||
								   ((i == l) && (j == m + 1) && (k == n)) ||
								   ((i == l) && (j == m - 1) && (k == n)) ||
								   ((i == l + 1) && (j == m) && (k == n)) ||
								   ((i == l - 1) && (j == m) && (k == n))) {
									var change float64 = (cube[i][j][k] - cube[l][m][n]) * dTerm
									cube[i][j][k] = cube[i][j][k] - change
									cube[l][m][n] = cube[l][m][n] + change
								}
							}
						}
					}
				}
			}
		}

		time = time + timestep

		// Check for mass consistency
		var sumVal float64 = 0.0
		var maxVal float64 = cube[0][0][0]
		var minVal float64 = cube[0][0][0]

		for i := 0; i < int(maxSize); i++ {
			for j:= 0; j < int(maxSize); j++ {
				for k := 0; k < int(maxSize); k++ {
					// If the partition is active, determine
					// whether the current slice cell is in
					// the partition to avoid including the
					// partition cells' gas amounts
					var cellInPartition bool = false

					if (partitionFlag) {
						cellInPartition = checkIfCellInPartition(i, j, k, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax);
					}

					if !(cellInPartition) {
						maxVal = math.Max(cube[i][j][k], maxVal)
						minVal = math.Min(cube[i][j][k], minVal)
						sumVal += cube[i][j][k]
					}
				}
			}
		}

		ratio = minVal / maxVal

		fmt.Println(time, " ", ratio, " ", sumVal)

		if !(ratio < 0.99) {
			break
		}
	}

	fmt.Println("Box equilibrated in ", time, " seconds of simulated time.")
}

func checkIfCellInPartition (sliceCellX,
			     sliceCellY,
			     sliceCellZ,
			     partitionXMin,
			     partitionXMax,
			     partitionYMin,
			     partitionYMax,
			     partitionZMin,
			     partitionZMax int) bool {
	// Precondition: All coordinates received by this method are valid
	// three-dimensional coordinates, and the received cell coordinates are
	// valid three-dimensional slice cell coordinates. Each X, Y, and Z
	// "Min" partition variable value is also less than or equal to the
	// respective X, Y, and Z "Max" variable value.
	// Postcondition: A Boolean of whether the received slice cell
	// coordinates were in the specified partition area was returned to this
	// function's caller.

	var cellInPartition bool = false

	if (((sliceCellX >= partitionXMin) && (sliceCellX < partitionXMax)) &&
	    ((sliceCellY >= partitionYMin) && (sliceCellY < partitionYMax)) &&
	    ((sliceCellZ >= partitionZMin) && (sliceCellZ < partitionZMax))) {
		cellInPartition = true
	} else {
		cellInPartition = false
	}

	return cellInPartition
}
