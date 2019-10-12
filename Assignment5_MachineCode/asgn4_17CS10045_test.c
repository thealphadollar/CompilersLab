/*
Assignment 4 Parser
Name: Robin Babu Padamadan
Roll No.: 17CS10045
Section 1 (Odd)
Test file
*/


static int x;
extern float y;

int test1(char* c, int k, float c){
	int h = k;
	float x = c+k;
	k++;
	return (k-c*x/h);
}


int main()
{
	/* Multi
		Line
			Comment!

			//dkjbsgd//
	*/

	// //complicated comment


	//Declarations
	int *c;
	int a[100], b = 5;
	_Complex x;
	_Bool y;
	char word[5] = {'m','x','l','p'};
	char* h;
	tech_function2();
	float x = 34.2413E-23;
	float y = 8.13e-9;
	float z = x+y;	
	double d = c/a*b;

	int temp=0;
	//Unary Operator
	temp++;
	temp--;
	temp=++temp;
	temp=--temp;
	temp=temp--;
	temp=temp++;
	temp=!temp;

	//Binary Operator
	a = b & c;
	a = b | c;
	a = b ^ 1;
	a = b * 3;
	a = c / b;
	a = a + c;
	a = c % b;

	b+=1;
	b-=2;
	b*=a;
	b/=3;
	b%=4;
	b<<=5;
	b>>=c;
	b&=c;
	b|=c;
	b^=1;
	int b = a && c;
	int bb = b || (c==r) && (!a);

	//Selection and Iteration
	for(a=0;a<5;a++)
	{
		if(a>2) break;
		else
		{
			int y,z;
			int x = y/z;
			continue;
		}
	}

	int i=10;
	do
	{
		int x = x+y*z;
	} 
	while (i--);
	
	return 0;	
}

