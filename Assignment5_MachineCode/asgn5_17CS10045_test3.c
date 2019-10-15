// GCD sample code
//Testing Function declaration
// Shivam Kumar Jha | Robin Babu

int gcd (int a, int b);


int main () 
{
	int x = 18,y = 24;
	int hcf;
	hcf = gcd(x,y);
	return 0;
}

int gcd(int a, int b) 
{ 
    if (a == 0) 
       return b; 
    if (b == 0) 
       return a; 

    if (a == b) 
        return a;

    if (a > b) 
        return gcd(a-b, b); 
    return gcd(a, b-a); 
} 
  