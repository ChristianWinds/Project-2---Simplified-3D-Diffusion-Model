/* Programmer: Christian Winds
 * Course: CSC 330 Organization of Programming Languages
 * School Year: 2019-2020 School Year */
#include <stdio.h>
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

int main(int argc, char** argv)
{
	const int maxSize = 10;
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
					maxVal = max(cube[i][j][k], maxVal);
					minVal = min(cube[i][j][k], minVal);
					sumVal += cube[i][j][k];
				}
			}
		}

		ratio = minVal / maxVal;

		printf("%lf %lf %lf\n", time, ratio, sumVal);

	} while (ratio < 0.99);

	printf("Box equilibrated in %lf seconds of simulated time.\n", time);

	return 0;
}

