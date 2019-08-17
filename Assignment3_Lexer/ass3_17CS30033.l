%{
#include "y.tab.h"
#include <stdio.h>
%}

EXPONENT_PART ([eE]{SIGN}?{DIGIT_SEQ})
ZERO "0"
INT_CONST (({NONZERODIG}({DIGIT}*))|{ZERO}+)
DOT "."
DIGIT [0-9]
NONZERODIG [1-9]
IDENT_ND [A-Za-z_]
IDENT ({IDENT_ND}({IDENT_ND}|{DIGIT})*)
WHITESPACE [ \n\t]
SIGN [+-]
NON_FS ([^/].*)
AVOID_MULTI_END (NON_STAR|([\*]{NON_FS}))
MULTI_COMMENT ({MULTI_START}(([^\*])|((\*)+[^/\*]))*{MULTI_END})
COMMENT {SINGLE_COMMENT}|{MULTI_COMMENT}
DIGIT_SEQ {DIGIT}+
FRACT_CONST (({DIGIT_SEQ}?{DOT}{DIGIT_SEQ})|({DIGIT_SEQ}{DOT}))
FLOAT_CONST (({FRACT_CONST}{EXPONENT_PART}?)|({DIGIT_SEQ}{EXPONENT_PART}))
CONST ({INT_CONST}|{FLOAT_CONST}|{ENUM_CONST}|{C_CHAR_CONST})
S_CHAR [^\"\\\n]|{ESC_SEQ}
S_CHAR_SEQ {S_CHAR}+
STRING_LITERAL (\"{S_CHAR_SEQ}*\")
SINGLE_COMMENT [/][/].*
MULTI_END [\*]+[/]
ENUM_CONST {IDENT}
ESC_SEQ ([\\][\'\"\?\\abfnrtv])
C_CHAR [^\'\\\n]|{ESC_SEQ}
C_CHAR_SEQ {C_CHAR}+
C_CHAR_CONST (\'{C_CHAR_SEQ}\')
MULTI_START [/][\*]+
NON_STAR (([^\*]).*)

%%

"typedef"           {/* TYPEDEF;*/ return KEYWORD;}
"else"              {/* ELSE;*/ return KEYWORD;}
"register"          {/* REGISTER;*/ return KEYWORD;}
"union"             {/* UNION;*/ return KEYWORD;}
"return"            {/* RETURN;*/ return KEYWORD;}
"void"              {/* VOID;*/ return KEYWORD;}
"char"              {/* CHAR;*/ return KEYWORD;}
"for"              	{/* FOR;*/ return KEYWORD;}
"continue"          {/* CONTINUE;*/ return KEYWORD;}
"if"                {/* IF;*/ return KEYWORD;}
"static"            {/* STATIC;*/ return KEYWORD;}
"default"           {/* DEFAULT;*/ return KEYWORD;}
"inline"            {/* INLINE;*/ return KEYWORD;}
"auto"              {/* AUTO;*/ return KEYWORD;}
"enum"              {/* ENUM;*/ return KEYWORD;}
"restrict"          {/* RESTRICT;*/ return KEYWORD;} 
"unsigned"          {/* UNSIGNED;*/ return KEYWORD;}
"break"             {/* BREAK;*/ return KEYWORD;}
"extern"            {/* EXTERN;*/ return KEYWORD;}
"struct"            {/* STRUCT;*/ return KEYWORD;}
"do"                {/* DO;*/ return KEYWORD;}
"int"               {/* INT;*/ return KEYWORD;}
"switch"            {/* SWITCH;*/ return KEYWORD;}
"signed"            {/* SIGNED;*/ return KEYWORD;}
"while"             {/* WHILE;*/ return KEYWORD;}
"const"             {/* CONST;*/ return KEYWORD;}
"goto"              {/* GOTO;*/ return KEYWORD;}
"sizeof"            {/* SIZEOF;*/ return KEYWORD;}
"case"              {/* CASE;*/ return KEYWORD;}
"float"             {/* FLOAT;*/ return KEYWORD;}
"short"             {/* SHORT;*/ return KEYWORD;}
"volatile"          {/* VOLATILE;*/ return KEYWORD;}
"double"            {/* DOUBLE;*/ return KEYWORD;}
"long"              {/* LONG;*/ return KEYWORD;}

"..."               { return PUNCTUATOR; }
"="                 { return PUNCTUATOR; }
"%="                { return PUNCTUATOR; }
"+="                { return PUNCTUATOR; }
"*="                { return PUNCTUATOR; }
"/="                { return PUNCTUATOR; }
"-="                { return PUNCTUATOR; }
"<<="               { return PUNCTUATOR; }
">>="               { return PUNCTUATOR; }
"["                 { return PUNCTUATOR; }
"]"                 { return PUNCTUATOR; }
"("                 { return PUNCTUATOR; }
")"                 { return PUNCTUATOR; }
"{"                 { return PUNCTUATOR; }
"}"                 { return PUNCTUATOR; }
"."                 { return PUNCTUATOR; }
"->"                { return PUNCTUATOR; }
"++"                { return PUNCTUATOR; }
"--"                { return PUNCTUATOR; }
"&"                 { return PUNCTUATOR; }
"*"                 { return PUNCTUATOR; }
"+"                 { return PUNCTUATOR; }
"-"                 { return PUNCTUATOR; }
"~"                 { return PUNCTUATOR; }
"!"                 { return PUNCTUATOR; }
"/"                 { return PUNCTUATOR; }
"%"                 { return PUNCTUATOR; }
"<<"                { return PUNCTUATOR; }
">>"                { return PUNCTUATOR; }
"<"                 { return PUNCTUATOR; }
">"                 { return PUNCTUATOR; }
"<="                { return PUNCTUATOR; }
">="                { return PUNCTUATOR; }
"=="                { return PUNCTUATOR; }
"!="                { return PUNCTUATOR; }
"^"                 { return PUNCTUATOR; }
"|"                 { return PUNCTUATOR; }
"&&"                { return PUNCTUATOR; }
"||"                { return PUNCTUATOR; }
"?"                 { return PUNCTUATOR; }
":"                 { return PUNCTUATOR; }
";"                 { return PUNCTUATOR; }
"&="                { return PUNCTUATOR; }
"^="                { return PUNCTUATOR; }
"|="                { return PUNCTUATOR; }
","                 { return PUNCTUATOR; }
"#"                 { return PUNCTUATOR; }


{COMMENT}           {printf("< Comment: %s >\n", yytext);}
{IDENT}             { return IDENTIFIER;}
{CONST}             { return CONSTANT;}
{STRING_LITERAL}    { return STRING_LITERAL;}
{WHITESPACE}        {;}

%%