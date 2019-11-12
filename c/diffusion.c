/* Programmer: Christian Winds
 * Course: CSC 330 Organization of Programming Languages
 * School Year: 2019-2020 School Year */
#include <stdbool.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

// Checked for mass consistency by Dr. Pounds on 10/25/19

/* Code from Tutorialspoint,
 * https://www.tutorialspoint.com/cprogramming/c_functions.htm
 * Accessed Wednesday, October 23rd, 2019 */
double max(double num1, double num2)
{
	// Precondition: Two valid numeric double values were sent to this
	// function
	// Postcondition: The higher of the two values sent to this function was
	// returned to this function's caller as a double value

	double higherValue;

	// Compare the two parameter values to determine the higher of the two
	// values
	if (num1 > num2)
		higherValue = num1;
	else
		higherValue = num2;
 
	return higherValue; 
}

/* Code from Tutorialspoint,
 * https://www.tutorialspoint.com/cprogramming/c_functions.htm
 * Accessed Wednesday, October 23rd, 2019 */
double min(double num1, double num2)
{
	// Precondition: Two valid numeric double values were sent to this
	// function
	// Postcondition: The lower of the two values sent to this function was
	// returned to this function's caller as a double value

	double lowerValue;

	// Compare the two parameter values to determine the lower of the two
	// values
	if (num1 < num2)
		lowerValue = num1;
	else
		lowerValue = num2;
 
	return lowerValue; 
}

bool checkIfCellInPartition(int arrayCellX,
			    int arrayCellY,
			    int arrayCellZ,
			    int partitionXMin,
			    int partitionXMax,
			    int partitionYMin,
			    int partitionYMax,
			    int partitionZMin,
			    int partitionZMax)
{
	// Precondition: All coordinates received by this method are valid
	// three-dimensional coordinates, and the received cell  coordinates are
	// valid three-dimensional array cell coordinates. Each X, Y, and Z
	// "Min" partition variable value is also less than or equal to the
	// respective X, Y, and Z "Max" variable value.
	// Postcondition: A Boolean of whether the received array cell
	// coordinates were in the specified partition area was returned to this
	// function's caller.

	bool cellInsidePartition = false;

	if (((arrayCellX >= partitionXMin) && (arrayCellX < partitionXMax)) &&
	    ((arrayCellY >= partitionYMin) && (arrayCellY < partitionYMax)) &&
	    ((arrayCellZ >= partitionZMin) && (arrayCellZ < partitionZMax)))
	{
		cellInsidePartition = true;
	}
	else
	{
		cellInsidePartition = false;
	}

	return cellInsidePartition;
}

int main(int argc, char** argv)
{
	// Create an input error variable to prevent the full program from
	// running if an input error is detected
	bool inputError = false;

	// Examine the command line arguments to determine the room size
	// and whether to activate the partition
	bool partition = false;
	int maxSize = 1;

	// Code from Microsoft,
	// https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/main-and-command-args/command-line-arguments
	// Accessed Sunday, November 10th, 2019
	if (argc <= 1)
	{
		inputError = true;
		printf("Please input a room size on the command line.\n");
	}
	else if (argc > 1)
	{
		maxSize = atoi(argv[1]);

		// Check if the word "partition" is a third command line
		// argument to dtermine whether to activate the partition
		if (argc > 2)
		{
			if (strcmp(argv[2], "partition") == 0)
			{
				partition = true;
			}
			else
			{
				partition = false;
			}
		}
		else
		{
			partition = false;
		}
	}

	if (!inputError)
	{
		double cube[maxSize][maxSize][maxSize];

		int i = 0;
		int j = 0;
		int k = 0;

		// Zero the cube
		for (i = 0; i < maxSize; i++)
		{
			for (j = 0; j < maxSize; j++)
			{
				for (k = 0; k < maxSize; k++)
				{
					cube[i][j][k] = 0.0;
				}
			}
		}


		// Calculate coordinates to determine the partition location if
		// a partition is active
		int partitionXMin = 0;
		int partitionXMax = 0;
		int partitionYMin = 0;
		int partitionYMax = 0;
		int partitionZMinInt = 0;
		int partitionZMax = 0;

		if (partition)
		{
			// Calculate the partition's X coordinates to place the
			// partition at half the room's length
			partitionXMin = maxSize / 2;
			partitionXMax = partitionXMin + 1;

			// Calculate the partition's Y coordinates to place the
			// partition's width across the room
			partitionYMin = 0;
			partitionYMax = maxSize;

			// Calculate the partition's Z coordinates to set the
			// partition's height to 75% of the room height
			double partitionZMinDouble = maxSize * 0.25;
			partitionZMinInt = floor(partitionZMinDouble);
			partitionZMax = maxSize;
		}

		double diffusionCoefficient = 0.175;

		// Create a variable for room dimension to represent 5 meters
		double roomDimension = 5;

		// Set a gas molecule speed variable to represent 100 g/mol gas
		// molecules' speed at room temperature
		double speedOfGasMolecules = 250.0;

		// Create a timestep variable to represent the value of h in seconds
		double timestep = (roomDimension / speedOfGasMolecules) / maxSize;
		double distanceBetweenBlocks = roomDimension / maxSize;

		double DTerm = diffusionCoefficient * timestep /
			       (distanceBetweenBlocks * distanceBetweenBlocks);

		// Initialize the first cell
		cube[0][0][0] = 1.0e21;

		int pass = 0;

		// Create a double variable to track increasing system time
		double time = 0.0;

		double ratio = 0.0;

		int l = 0;
		int m = 0;
		int n = 0;

		do
		{
			for (i = 0; i < maxSize; i++)
			{
				for (j = 0; j < maxSize; j++)
				{
					for (k = 0; k < maxSize; k++)
					{
						for (l = 0; l < maxSize; l++)
						{
							for (m = 0; m < maxSize; m++)
							{
								for (n = 0; n < maxSize; n++)
								{
									if (((i == l) && (j == m) && (k == n + 1)) ||
									    ((i == l) && (j == m) && (k == n - 1)) ||
									    ((i == l) && (j == m + 1) && (k == n)) ||
									    ((i == l) && (j == m - 1) && (k == n)) ||
									    ((i == l + 1) && (j == m) && (k == n)) ||
									    ((i == l - 1) && (j == m) && (k == n)))
									{
										// If the partition is active, determine whether either
										// current array cell is in the partition to prevent gas
										// from moving into the partition
										bool cellInPartition = false;

										if (partition)
										{
											cellInPartition = checkIfCellInPartition(i, j, k, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax) ||
													  checkIfCellInPartition(l, m, n, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax);
										}

										if (!cellInPartition)
										{
											double change = (cube[i][j][k] - cube[l][m][n]) * DTerm;
											cube[i][j][k] = cube[i][j][k] - change;
											cube[l][m][n] = cube[l][m][n] + change;
										}
									}
								}
							}
						}
					}
				}
			}

			time = time + timestep;

			// Check for mass consistency
			double sumVal = 0.0;
			double maxVal = cube[0][0][0];
			double minVal = cube[0][0][0];
			for (i = 0; i < maxSize; i++)
			{
				for (j = 0; j < maxSize; j++)
				{
					for (k = 0; k < maxSize; k++)
					{
						// If the partition is active,
						// determine whether the current
						// array cell is in the partition
						// to avoid including the empty
						// array cells' gas amounts
						bool cellInPartition = false;

						if (partition)
						{
							cellInPartition = checkIfCellInPartition(i, j, k, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax);
						}

						if (!cellInPartition)
						{
							maxVal = max(cube[i][j][k], maxVal);
							minVal = min(cube[i][j][k], minVal);
							sumVal += cube[i][j][k];
						}
					}
				}
			}

			ratio = minVal / maxVal;

			printf("%lf %lf %lf\n", time, ratio, sumVal);

		} while (ratio < 0.99);

		printf("Box equilibrated in %lf seconds of simulated time.\n", time);
	}
	return 0;
}

