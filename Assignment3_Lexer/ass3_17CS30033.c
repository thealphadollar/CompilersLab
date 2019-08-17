#include "y.tab.h"
#include <stdio.h>

extern int yylex();
extern char* yytext;

void main() {
    int tok = 1;
	while(tok)
    {
       tok = yylex();
       switch (tok) 
       {
        case IDENTIFIER: 
            printf("< IDENTIFIER, %d, %s >\n", tok, yytext); 
            break;
        case STRING_LITERAL: 
            printf("< STRING_LITERAL, %d, %s >\n", tok, yytext); 
            break;
        case CONSTANT: 
            printf("<CONSTANT, %d, %s>\n", tok, yytext); 
            break;
        case PUNCTUATOR: 
            printf("<PUNCTUATOR, %d, %s>\n", tok, yytext); 
            break;
        case KEYWORD:
            printf("<KEYWORD, %d, %s>\n", tok, yytext);
            break;
        default: 
            printf("<PUNCTUATOR, %d, %s>\n", tok, yytext); 
            break;
        }

    }
}