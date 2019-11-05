// Programmer: Christian Winds
// Course: CSC 330 Organization of Programming Languages
// School Year: 2019-2020 School Year

// Code from Dr. Pounds,
// /tmp/diffusion.java
// Accessed Tuesday, October 29th, 2019
package main

import "fmt"

func main() {

	var maxSize uint64 = 10
	cube := make([][][]float64, maxSize)

	// Zero the cube
	var i int
	var j int
	var k int
	for i := 0; i < int(maxSize); i++ {
		for j := 0; j < int(maxSize); j++ {
			for k := 0; k < int(maxSize); k++ {
				cube[i][j][k] = 0.0
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

	// Check for mass consistency
	var sumVal float64 = 0.0
	var maxVal float64 = cube[0][0][0]
	var minVal float64 = cube[0][0][0]

	fmt.Println("  ")
	fmt.Println("Box equilibrated in  seconds of simulated time.")
}
