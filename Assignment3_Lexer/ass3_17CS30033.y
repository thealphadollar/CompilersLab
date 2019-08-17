%{#include <stdio.h>

extern int yylex();
void yyerror(char *s);

%}

%union {
int intval;
}

%token <intval> KEYWORD
%token <intval> IDENTIFIER
%token <intval> CONSTANT
%token <intval> STRING_LITERAL
%token <intval> PUNCTUATOR

%%
statement   :|KEYWORD|IDENTIFIER|CONSTANT|STRING_LITERAL|PUNCTUATOR
%%

void yyerror(char *s) {
	printf ("ERROR is %s", s);
}