/* Programmer: Christian Winds
 * Course: CSC 330 Organization of Programming Languages
 * School Year: 2019-2020 School Year */
#include <stdio.h>
int main()
{
	const int maxSize = 10;
	double cube[maxSize][maxSize][maxSize];

	int i = 0;
	int j = 0;
	int k = 0;

	// Zero the cube
	for (i = 0; i < maxSize; i++)
	{
		for (i = 0; i < maxSize; i++)
		{
			for (i = 0; i < maxSize; i++)
			{
				cube[i][j][k] = 0.0;
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

	// Initialize the first cell
	cube[0][0][0] = 1.0e21;

	int pass = 0;
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
					maxVal = cube;
					minVal = cube;
					sumVal += cube[i][j][k];
				}
			}
		}

		ratio = minVal / maxVal;

		printf("%lf %lf %lf", time, ratio, sumVal);

	} while (ratio < 0.99);

	printf("Box equilibrated in %lf seconds of simulated time.", time);

	return 0;
}
