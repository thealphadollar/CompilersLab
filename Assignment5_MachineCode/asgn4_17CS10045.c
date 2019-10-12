/*
Assignment 4 Parser
Name: Robin Babu Padamadan
Roll No.: 17CS10045
Section 1 (Odd)
Main file
*/


#include <stdio.h>
#include "y.tab.h"

int main()
{
  int x=yyparse();
  
  if(x)
  {
    printf("Parsing Failed!\n");
  }
  else
  {
    printf("Parsing was Successful!\n");
  }

  return 0;
}