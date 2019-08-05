/* 
 main program to test the created functions
*/
#include "myl.h"

int main()
{
    int n, response;
    printStr("WARNING: Using inhouse print statement, things may break!");
    printStr("\nPlease enter an integer:\n");
    response = readInt(&n);     			   
    
    if(response == OK){
        printInt(n);
    }
    else{
        printStr('Invalid input for integer!');
    }

    float p;
    printStr("\nPlease enter a float:\n");
    response = readFlt(&p);
    
    if(response == OK){
        printFlt(n);
    }
    else{
        printStr('Invalid input for float!');
    }

    return 0;
}