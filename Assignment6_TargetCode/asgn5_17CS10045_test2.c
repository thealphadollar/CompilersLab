/*
Assignment 6
Name: Robin Babu Padamadan | Shivam Kumar Jha
Roll No.: 17CS10045 | 17CS30033
Section 1 (Odd)
Test Case 2
*/


//Checking expressions, conditions, functions and declaration functionalities

void one()
{
int i;
for(i=25 ;i>0;i-=2)
{
  if(i>='B'&& i<=101)
    i=2*i;
  else{
    if(i>55 && i<='x')
      i=77;
  }
}

void main()
{  
int p=0;
p = one();
}
