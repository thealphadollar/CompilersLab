%{
    #include "y.tab.h"
    #include <stdio.h>
%}

EXPONENT_PART               ([eE]{SIGN}?{DIGIT_SEQ})
ZERO                        "0"
INT_CONST                   (({NONZERODIG}({DIGIT}*))|{ZERO}+)
DOT                         "."
DIGIT                       [0-9]
NONZERODIG                  [1-9]
IDENT_ND                    [A-Za-z_]
IDENT                       ({IDENT_ND}({IDENT_ND}|{DIGIT})*)
WHITESPACE                  [ \n\t]
SIGN                        [+-]
NON_FS                      ([^/].*)
AVOID_MULTI_END             (NON_STAR|([\*]{NON_FS}))
MULTI_COMMENT               ({MULTI_START}(([^\*])|((\*)+[^/\*]))*{MULTI_END})
COMMENT                     {SINGLE_COMMENT}|{MULTI_COMMENT}
SINGLELINE_COMMENT  		\/\/.*	
SEQ 						[^*]|[*][^/]
MULTILINE_COMMENT			[/][*]{SEQ}*[*][/]
NON_DIGIT					[a-zA-Z_]
NON_ZERO_DIGIT				[1-9]
IDENTIFIER					{NON_DIGIT}({NON_DIGIT}|{DIGIT})*
INTEGER						{NON_ZERO_DIGIT}{DIGIT}*
DIGIT_SEQUENCE				{DIGIT}+
FRACTIONAL_CONSTANT			{DIGIT_SEQUENCE}?\.{DIGIT_SEQUENCE}|{DIGIT_SEQUENCE}
FLOATING_CONSTANT			{FRACTIONAL_CONSTANT}{EXPONENT_PART}?|{DIGIT_SEQUENCE}{EXPONENT_PART}
ENUMERATION_CONSTANT		{IDENTIFIER}
ESCAPE_SEQUENCE				\\['"?\\abfnrtv]
C_CHAR						[^'\\\n]|{ESCAPE_SEQUENCE}
CHARACTER_SEQUENCE			{C_CHAR}+
CHARACTER_CONSTANT			'{CHARACTER_SEQUENCE}'
S_CHAR						[^"\\\n]|{ESCAPE_SEQUENCE}
S_CHAR_SEQUENCE				{S_CHAR}+
PUNCTUATOR					"["|"]"|"("|")"|"{"|"}"|"."|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<"|">"|"^"|"|"|"?"|":"|";"|"="|","|"#"
BACKOTHER  					[ \t\v\n\f]
DIGIT_SEQ                   {DIGIT}+
FRACT_CONST                 (({DIGIT_SEQ}?{DOT}{DIGIT_SEQ})|({DIGIT_SEQ}{DOT}))
FLOAT_CONST                 (({FRACT_CONST}{EXPONENT_PART}?)|({DIGIT_SEQ}{EXPONENT_PART}))
CONST                       ({INT_CONST}|{FLOAT_CONST}|{ENUM_CONST}|{C_CHAR_CONST})
S_CHAR_SEQ                  {S_CHAR}+
STRING_LITERAL              (\"{S_CHAR_SEQ}*\")
SINGLE_COMMENT              [/][/].*
MULTI_END                   [\*]+[/]
ENUM_CONST                  {IDENT}
ESC_SEQ                     ([\\][\'\"\?\\abfnrtv])
C_CHAR_SEQ                  {C_CHAR}+
C_CHAR_CONST                (\'{C_CHAR_SEQ}\')
MULTI_START                 [/][\*]+
NON_STAR                    (([^\*]).*)

%%

"auto"						{ return AUTO; }
"enum"						{ return ENUM; }	
"restrict"					{ return RESTRICT; }
"unsigned"					{ return UNSIGNED; }
"break"						{ return BREAK; }
"extern" 					{ return EXTERN; }
"return"					{ return RETURN; }
"void"						{ return VOID; }
"case"						{ return CASE; }
"float"						{ return FLOAT; }
"short"						{ return SHORT; }
"volatile"					{ return VOLATILE; }
"char"						{ return CHAR; }	
"for"						{ return FOR; }
"signed"					{ return SIGNED; }
"while"						{ return WHILE; }
"const"						{ return CONST; }	
"goto"						{ return GOTO; }	
"sizeof"					{ return SIZEOF; }
"_Bool"						{ return BOOL; }
"continue"					{ return CONTINUE; }	
"if"						{ return IF; }
"static"					{ return STATIC; }
"_Complex"					{ return COMPLEX; }
"default"					{ return DEFAULT; }
"inline"					{ return INLINE; }	
"struct"					{ return STRUCT; }
"_Imaginary"				{ return IMAGINARY; }
"do"						{ return DO; }
"int"						{ return INT; }
"switch"					{ return SWITCH; }
"double"					{ return DOUBLE; }
"long"						{ return LONG; }
"typedef"					{ return TYPEDEF; }
"else"						{ return ELSE; }
"register"					{ return REGISTER; }
"union"						{ return UNION; }

"->"						{ return ARROW; }
"++"						{ return INCREMENT; }
"--"						{ return DECREMENT; }
"<<"						{ return LEFT_SHIFT; }
">>"						{ return RIGHT_SHIFT; }
"<="						{ return LSOE; }
">="						{ return GTOE; }
"=="						{ return IS_EQUAL; }
"!="						{ return NOT_EQUAL; }
"&&"						{ return AND; }
"||"						{ return OR; }
"..."						{ return TRIPLE_DOT; }
"*="						{ return MULTIPLY_EQUAL; }
"/="						{ return DIVIDE_EQUAL; }
"%="						{ return PERCENT_EQUAL; }
"+="						{ return PLUS_EQUAL; }
"-="						{ return MINUS_EQUAL; }
"<<="						{ return LEFT_SHIFT_EQUAL; }
">>="						{ return RIGHT_SHIFT_EQUAL; }
"&="						{ return AND_EQUAL; }
"^="						{ return HAT_EQUAL; }
"|="     					{ return OR_EQUAL; }	


{IDENTIFIER}				{ return IDENTIFIER; }
{INTEGER} 					{ return INTEGER_CONST; } 
{FLOATING_CONSTANT} 		{ return FLOAT_CONST; }
{ENUMERATION_CONSTANT} 		{ return ENUMERATION_CONSTANT; }
{CHARACTER_CONSTANT} 		{ return CHARACTER_CONST; }
{STRING_LITERAL} 			{ return STRING_LITERAL; }
{PUNCTUATOR}				{ return yytext[0]; }
{BACKOTHER}					{/* whitespace separates tokens */}
{SINGLELINE_COMMENT}    	{}
{MULTILINE_COMMENT}			{}

%%