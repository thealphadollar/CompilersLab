// Test Statements functionality
//Tests pointer, array assignments
//Tests iterative loops
// Shivam Kumar Jha | Robin Babu
int test = 3;

int Lol (int s, int t) {
	s = 10;
	int *x, y;

	*x = y;
	y = *x;
	x = &y;
}



void main () {
	int i, k = 2;
	int *y = NULL;
	int x[3];


	x[0] = 1;
	x[1] = 3;
	x[2] = 2;

	double d;
	double *f;
	char testing[10];
	char *g=NULL;
	char one='a',two='b';
	one = 'c';
	two = 'd';

	for (i=1; i<x[1]; i++) 
		i++;

	do k = k - 1; 
	while (x[k] < k);
	
	
	i = 2;
	
	if (i&&k || i^k) i = 1;

	while (i<5) 
	{
		i--;
	}
	


	return;
}