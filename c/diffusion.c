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

	// Initialize the first cell
	cube[0][0][0] = 1.0e21;

	return 0;
}
