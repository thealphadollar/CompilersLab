/*
Assignment 6
Name: Robin Babu Padamadan | Shivam Kumar Jha
Roll No.: 17CS10045 | 17CS30033
Section 1 (Odd)
Test Case 1
*/

//sample code to see how many people are obese
//it checks function , declarations, and few conditions


int printStr(char *s);
int printInt(int n);
int readInt(int *x);

int count_obese(int *weights, int threshold, int num);

int main()
{
    int weights[5];

    weights[0] = 10;
    weights[1] = 15;
    weights[2] = 45;
    weights[3] = 100;
    
    int x;
    int *y;
    x = readInt(y);

    int count = count_obese(weights,50,5);

    printStr("The number of obese people is ");
    printInt(count);
    return 0; 
}


int count_obese(int *weights, int threshold,int num)
{
    int count=0;
    int i;
    for(i=0;i<num;++i)
    {
        if(weights[i]>threshold) count++;
    }
    return count;
}