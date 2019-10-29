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
	var cube [maxSize][maxSize] float64 

	var diffusionCoefficient float64 = 0.175
	var roomDimension float64 = 5
	var speedOfGasMolecules float64 = 250.0
	var timestep float64 = (roomDimension / speedOfGasMolecules) / maxSize
	var distanceBetweenBlocks float64 = roomDimension / maxSize

	var dTerm float64 = diffusionCoefficient * timestep / (distanceBetweenBlocks * distanceBetweenBlocks)

	var time float64 = 0.0
	var ratio float64 = 0.0

	var sumVal float64 = 0.0
	var maxVal float64
	var minVal float64

	fmt.Println("  ")
	fmt.Println("Box equilibrated in  seconds of simulated time.")
}
