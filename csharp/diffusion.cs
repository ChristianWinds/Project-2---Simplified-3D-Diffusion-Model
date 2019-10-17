// Programmer: Christian Winds
// Course: CSC 330 Organization of Programming Languages
// School Year: 2019-2020 School Year

// Code from Dr. Pounds,
// /tmp/diffusion.java
// Accessed October 15th, 2019
using System;

class diffusion
{
	static void Main(string[] args)
	{
		int maxSize = 10;
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

		int pass = 0;

		// Create a double variable to track increasing system time.
		double time = 0.0;

		double ratio = 0.0;

		do
		{
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
						maxVal = Math.Max(cube[p, q, r], maxVal);
						minVal = Math.Min(cube[p, q, r], minVal);
						sumVal += cube[p, q, r];
					}
				}
			}

			ratio = minVal / maxVal;
			Console.WriteLine($"{time} {ratio} {sumVal}");
		} while (ratio < 0.99);

		Console.WriteLine($"Box equilibrated in {time} seconds of simulated time.");
	}
}
