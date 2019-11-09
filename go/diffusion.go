// Programmer: Christian Winds
// Course: CSC 330 Organization of Programming Languages
// School Year: 2019-2020 School Year

// Code from Dr. Pounds,
// /tmp/diffusion.java
// Accessed Tuesday, October 29th, 2019
package main

import "fmt"

func main() {

	const maxSize int = 10
	var cube[maxsize][maxSize][maxSize] float64

	cube[1][1][1] = 0.0
	fmt.Println("Set cube[1][1][1] to 0.0")

	// Zero the cube
	// Code from Stack Overflow,
	// https://stackoverflow.com/questions/37668224/iterating-over-over-a-2d-slice-in-go
	// Accessed Thursday, November 7th, 2019
	for i := range cube {
		fmt.Println("TEST: Passed first for loop starement of first nested for loop set")
		fmt.Println("i == ", i)
		for j := range cube {
			fmt.Println("TEST: Passed second for loop statement of first nested for loop set")
			fmt.Println("i == ", i)
			fmt.Println("j == ", j)
			for k := range cube {
				fmt.Println("TEST: Passed third for loop statement of first nested for loop set")
				fmt.Println("i == ", i)
				fmt.Println("j == ", j)
				fmt.Println("k == ", k)
				cube[i][j][k] = 0.0
				fmt.Println("TEST: Initialized a cube cell")
			}
		}
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

		time += time + timestep

		// Check for mass consistency
		var sumVal float64 = 0.0
		var maxVal float64 = cube[0][0][0]
		var minVal float64 = cube[0][0][0]

		for i := 0; i < int(maxSize); i++ {
			for j:= 0; j < int(maxSize); j++ {
				for k := 0; k < int(maxSize); k++ {
					sumVal += cube[i][j][k]
				}
			}
		}

		ratio = minVal / maxVal

		fmt.Println("  ")

		if !(ratio < 0.99) {
			break
		}
	}

	fmt.Println("Box equilibrated in  seconds of simulated time.")
}
