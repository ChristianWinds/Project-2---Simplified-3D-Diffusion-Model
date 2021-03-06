// Programmer: Christian Winds
// Course: CSC 330 Organization of Programming Languages
// School Year: 2019-2020 School Year

// Code from Dr. Pounds,
// /tmp/diffusion.java
// Accessed Tuesday, October 15th, 2019

// Checked for mass consistency by Dr. Pounds on 10/19/19

using System;
using System.Collections.Generic;

class diffusion
{
	public static bool CheckIfCellInPartition(int arrayCellX,
						  int arrayCellY,
						  int arrayCellZ,
						  int partitionXMin,
						  int partitionXMax,
						  int partitionYMin,
						  int partitionYMax,
						  int partitionZMin,
						  int partitionZMax)
	{
		// Precondition: All coordinates received by this method are
		// valid three-dimensional coordinates, and the received cell
		// coordinates are valid three-dimensional array cell
		// coordinates. Each X, Y, and Z "Min" partition variable value
		// is also less than or equal to the respective X, Y, and Z
		// "Max" variable value.
		// Postcondition: A Boolean of whether the received array cell
		// coordinates were in the specified partition area was returned
		// to this method's caller.

		bool cellInsidePartition = false;

		// Compare the array cell coordinates and partition cell
		// coordinates to determine whether the array cell exists within
		// the partition.
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

	static int Main(string[] args)
	{
		// Examine the command line arguments to determine the number of
		// room divisions and whether to activate the partition.
		bool partition = false;
		int maxSize = 1;

		// Code from Microsoft,
		// https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/main-and-command-args/command-line-arguments
		// Accessed Sunday, November 10th, 2019
		if (args.Length == 0)
		{
			partition = false;
			Console.WriteLine("Please input a number of room divisions on the command line.");
			Console.WriteLine("Ending program...");
			return 1;
		}
		else if (args.Length > 0)
		{
			// Test whether a valid room division integer was
			// entered to determine whether to continue the program
			// with the entered number of room divisions or end the
			// program.
			bool roomSizeEntered = int.TryParse(args[0], out maxSize);
			if (!roomSizeEntered)
			{
				Console.WriteLine("Please input a number of room divisions on the command line.");
				Console.WriteLine("Ending program...");
                        	return 1;
			}

			// Check whether the second command line argument is
			// "partition" to determine whether to activate the
			// partition.
			if (args.Length >= 2)
			{
				if (string.Compare(args[1], "partition") == 0)
				{
					partition = true;
				}
				else
				{
					partition = false;
				}
			}
		}

		double[, ,] cube = new double[maxSize, maxSize, maxSize];

		// Zero the cube.
		for (int i = 0; i < maxSize; i++)
		{
			for (int j = 0; j < maxSize; j++)
			{
				for (int k = 0; k < maxSize; k++)
				{
					cube[i, j, k] = 0.0;
				}
			}
		}

		// Calculate coordinates to determine the partition location if
		// a partition is active.
		int partitionXMin = 0;
		int partitionXMax = 0;
		int partitionYMin = 0;
		int partitionYMax = 0;
		int partitionZMinInt = 0;
		int partitionZMax = 0;

		if (partition)
		{
			// Calculate the partition's X coordinates to place the
			// partition at half the room's length.
			partitionXMin = maxSize / 2;
			partitionXMax = partitionXMin + 1;

			// Calculate the partition's Y coordinates to place the
			// partition's width across the room.
			partitionYMin = 0;
			partitionYMax = maxSize;

			// Calculate the partition's Z coordinates to set the
			// partition's height to 75% of the room height.
			double partitionZMinDouble = maxSize * 0.25;

			// Code from StackOverflow,
			// https://stackoverflow.com/questions/633335/how-might-i-convert-a-double-to-the-nearest-integer-value
			// Accessed Sunday, November 10th, 2019
			partitionZMinInt = Convert.ToInt32(Math.Floor(partitionZMinDouble));

			partitionZMax = maxSize;
		}

		double diffusionCoefficient = 0.175;

		// Create a variable for room dimension to represent 5 meters.
		double roomDimension = 5;

		// Set a gas molecule speed variable to represent gas molecules'
		// speed at room temperature.
		double speedOfGasMolecules = 250.0;

		// Create a timestep variable to represent the value of h in
		// seconds.
		double timestep = (roomDimension / speedOfGasMolecules) / maxSize;
		double distanceBetweenBlocks = roomDimension / maxSize;

		double DTerm = diffusionCoefficient * timestep / (distanceBetweenBlocks * distanceBetweenBlocks);

		// Initialize the first cell.
		cube[0, 0, 0] = 1.0e21;

		// Create a double variable to track increasing system time.
		double time = 0.0;

		double ratio = 0.0;

		do
		{
			// Iterate through the cube's cells to diffuse the gas
			// through the room.
			for (int i = 0; i < maxSize; i++)
			{
				for (int j = 0; j < maxSize; j++)
				{
					for (int k = 0; k < maxSize; k++)
					{
						for (int l = 0; l < maxSize; l++)
						{
							for (int m = 0; m < maxSize; m++)
							{
								for (int n = 0; n < maxSize; n++)
								{
									if (((i == l) && (j == m) && (k == n + 1)) ||
									    ((i == l) && (j == m) && (k == n - 1)) ||
									    ((i == l) && (j == m + 1) && (k == n)) ||
									    ((i == l) && (j == m - 1) && (k == n)) ||
									    ((i == l + 1) && (j == m) && (k == n)) ||
									    ((i == l - 1) && (j == m) && (k == n)))
									{
										// If the partition is active, determine whether either current
										// array cell is in the partition to prevent gas from moving
										// into the partition.
										bool cellInPartition = false;

										if (partition)
										{
											cellInPartition = CheckIfCellInPartition(i, j, k, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax) ||
													  CheckIfCellInPartition(l, m, n, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax);
										}

										if (!cellInPartition)
										{
											double change = (cube[i, j, k] - cube[l, m, n]) * DTerm;
											cube[i, j, k] = cube[i, j, k] - change;
											cube[l, m, n] = cube[l, m, n] + change;
										}
									}
								}
							}
						}
					}
				}
			}

			time = time + timestep;
					
			// Check for mass consistency.
			double sumVal = 0.0;
			double maxVal = cube[0, 0, 0];
			double minVal = cube[0, 0, 0];

			for (int p = 0; p < maxSize; p++)
			{
				for (int q = 0; q < maxSize; q++)
				{
					for (int r = 0; r < maxSize; r++)
					{
						// If the partition is active,
						// determine whether the current
						// array cell is in the
						// partition to avoid including
						// the empty partition cells'
						// gas amounts
						bool cellInPartition = false;

						if (partition)
						{
							cellInPartition = CheckIfCellInPartition(p, q, r, partitionXMin, partitionXMax, partitionYMin, partitionYMax, partitionZMinInt, partitionZMax);
						}

						if (!cellInPartition)
						{
							maxVal = Math.Max(cube[p, q, r], maxVal);
							minVal = Math.Min(cube[p, q, r], minVal);
							sumVal += cube[p, q, r];
						}
					}
				}
			}

			ratio = minVal / maxVal;
			Console.WriteLine($"{time} {ratio} {sumVal}");
		} while (ratio < 0.99);

		Console.WriteLine($"Box equilibrated in {time} seconds of simulated time.");

		return 0;
	}
}
