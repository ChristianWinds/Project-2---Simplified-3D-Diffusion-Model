// Programmer: Christian Winds
// Course: CSC 330 Organization of Programming Languages
// School Year: 2019-2020 School Year

// Code from Dr. Pounds,
// /tmp/diffusion.java
// Accessed October 15th, 2019
using System;

static void Main()
{
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
							for (int n = 0; n < maxSize; j++)
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

	ratio = minval / maxval;
	} while (ratio < 0.99);
}
