%{
/*
Assignment 5
Name: Robin Babu Padamadan | Shivam Kumar Jha
Roll No.: 17CS10045 | 17CS30033
Section 1 (Odd)
Flex Specifications
*/

#include <stdio.h>
#include <string.h>
#include "asgn5_17CS10045_translator.h"
#include "y.tab.h"
void comment(void);

%}

SINGLE_LINE_COMMENT "//".*

MULTI_LINE_COMMENT  "/*"

identifier-nondigit [_a-zA-Z]
digit   [0-9]
nonzero-digit   [1-9]

IDENTIFIER  {identifier-nondigit}({identifier-nondigit}|{digit})*

INT_CONST   {nonzero-digit}{digit}*

digitseq    {digit}+
frac-const  {digitseq}?\.{digitseq}|{digitseq}
exponent-part   [eE][+-]?{digitseq}
FLOAT_CONST {frac-const}{exponent-part}?|{digitseq}{exponent-part}

ENUM_CONST  {IDENTIFIER}

ESCAPE_SEQUENCE				\\['"?\\abfnrtv]
cchar   [^\'\\\n]|{ESCAPE_SEQUENCE}
CHAR_CONST '{cchar}+'

schar   [^"\\\n]|{ESCAPE_SEQUENCE}
STRING_LITERAL  \"{schar}*\"


WS  					[ \t\v\n\f]
%%


{SINGLE_LINE_COMMENT}   {}
{MULTI_LINE_COMMENT}    {comment();}
"->"    {return POINTSTO;}
"++"    {return INCREMENT;}
"--"    {return DECREMENT;}
"<<"    {return LEFTSHIFT;}
">>"    {return RIGHTSHIFT;}
"<="    {return LESSTHANOREQUAL;}
">="    {return GREATERTHANOREQUAL;}
"=="    {return EQUALSTO;}
"!="    {return NOTEQUAL;}
"&&"    {return AND;}
"||"    {return OR;}
"..."   {return ELLIPSIS;}
"*="    {return MULTIPLYEQUAL;}
"/="    {return DIVIDEEQUAL;}
"%="    {return PERCENTEQUAL;}
"+="    {return PLUSEQUAL;}
"-="    {return MINUSEQUAL;}
"<<="   {return LEFTSHIFTEQUAL;}
">>="   {return RIGHTSHIFTEQUAL;}
"&="    {return ANDEQUAL;}
"^="    {return XOREQUAL;}
"|="    {return OREQUAL;}

"auto"  {return AUTO;}
"enum"  {return ENUM;}	
"restrict"  {return RESTRICT;}
"unsigned"  {return UNSIGNED;}
"break" {return BREAK;}
"extern"    {return EXTERN;}
"return"    {return RETURN;}
"void"  {return VOID;}
"case"  {return CASE;}
"float" {return FLOAT;}
"short" {return SHORT;}
"volatile"  {return VOLATILE;}
"char"  {return CHAR;}	
"for"   {return FOR;}
"signed"    {return SIGNED;}
"while" {return WHILE;}
"const" {return CONST;}	
"goto"  {return GOTO;}	
"sizeof"    {return SIZEOF;}
"_Bool" {return BOOL;}
"continue"  {return CONTINUE;}	
"if"    {return IF;}
"static"    {return STATIC;}
"_Complex"  {return COMPLEX;}
"default"   {return DEFAULT;}
"inline"    {return INLINE;}	
"struct"    {return STRUCT;}
"_Imaginary"    {return IMAGINARY;}
"do"    {return DO;}
"int"   {return INT;}
"switch"    {return SWITCH;}
"double"    {return DOUBLE;}
"long"  {return LONG;}
"typedef"   {return TYPEDEF;}
"else"  {return ELSE;}
"register"  {return REGISTER;}
"union" {return UNION;}

{IDENTIFIER}    {
	yylval.symp = table->lookup(yytext);
	return IDENTIFIER;
}
{INT_CONST} {
	yylval.intval = atoi(yytext);
	return INT_CONST;
}
{FLOAT_CONST}   {
	yylval.charval = yytext;
	return FLOAT_CONST;
}
{ENUM_CONST}    {return ENUM_CONST;}
{CHAR_CONST}    {
	yylval.charval = yytext;
	return CHAR_CONST;
}

{STRING_LITERAL}    {
	yylval.charval = yytext;
	return STRING_LITERAL;
}

"[" {return OPENSQUAREBRACKET;}
"]" {return CLOSESQUAREBRACKET;}
"(" {return OPENROUNDBRACKET;}
")" {return CLOSEROUNDBRACKET;}
"{" {return OPENFLOWERBRACKET;}
"}" {return CLOSEFLOWERBRACKET;}
"?" {return QUESTION;}
":" {return COLON;}
";" {return SEMICOLON;}
"=" {return EQUAL;}
"^" {return XOR;}
"|" {return VERTICALSLASH;}
"&" {return AMPERSAND;}
"*" {return ASTERISK;}
"+" {return PLUS;}
"-" {return MINUS;}
"~" {return TILDE;}
"!" {return EXCLAMATION;}
"." {return PERIOD;}
"/" {return FORWARDSLASH;}
"%" {return PERCENT;}
"<" {return LESSTHAN;}
">" {return GREATERTHAN;}
"," {return COMMA;}
"#" {return HASH;}


{WS}					{/* whitespace separates tokens */}

%%
/*
void comment(void)
{
    char c;
    int flag=0;
    while((c=input())!=0)
    {
        if(c=='*') flag=1;
        else if(c=='/'&&flag==1) return;
        else flag=0;
    }
    error("Improper commenting");
}

*/

