//sample code to see how many people are obese
//it checks function , declarations, and few conditions
// Shivam Kumar Jha | Robin Babu

int count_obese(int weights, int threshold, int num);

int main()
{
    int weights[5];

    weights[0] = 10;
    weights[1] = 15;
    weights[2] = 45;
    weights[3] = 100;
    weights[4] = 120;

    int count = count_obese(weights,50,5);

    printf("The number of obese people is %d", count);
    return 0; 
}


int count_obese(int weights, int threshold,int num)
{
    int count=0;
    for(int i=0;i<num;++i)
    {
        if(weights[i]>threshold) count++;
    }
    return count;
}