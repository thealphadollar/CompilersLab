// Concise test file
int foo(char* c){
	double ls = 4.555;
	return 'bar';
}

static int stat;
extern float flty;

int main () {
	int x, i=1;
	float flt = 10.2;
	char string[5] = "Hello";
	for (i=1;i<=10;++i) {
		if(flt<=20.48e-13) {
		printf ("%s", string);
		}
		else{
			break;
		}
	}

	int i=0;
	while(i<50) i++;

	goto label;

	int a = 100, b = 500;
	a++;
	b--;
	b=++a;
	b=a++;
	a=b--;
	a=--b;
	a=!a;
}