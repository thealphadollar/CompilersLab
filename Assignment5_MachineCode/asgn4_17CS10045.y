%{
	/*
Assignment 4 Parser
Name: Robin Babu Padamadan
Roll No.: 17CS10045
Section 1 (Odd)
Bison Specifications
*/

#include <stdio.h>
extern int yylex();
void yyerror(char*);
%}


%union {
  int intval;
  float floatval;
  char *charval;
}

%token POINTSTO
%token INCREMENT
%token DECREMENT
%token LEFTSHIFT
%token RIGHTSHIFT
%token LESSTHANOREQUAL
%token GREATERTHANOREQUAL
%token EQUALSTO
%token NOTEQUAL
%token AND
%token OR
%token ELLIPSIS

%token MULTIPLYEQUAL
%token DIVIDEEQUAL
%token PERCENTEQUAL
%token PLUSEQUAL
%token MINUSEQUAL
%token LEFTSHIFTEQUAL
%token RIGHTSHIFTEQUAL
%token ANDEQUAL
%token OREQUAL
%token XOREQUAL

%token AUTO
%token ENUM
%token RESTRICT
%token UNSIGNED
%token BREAK 
%token EXTERN
%token RETURN
%token VOID
%token CASE 
%token FLOAT
%token SHORT
%token VOLATILE
%token CHAR
%token FOR
%token SIGNED
%token WHILE
%token CONST 
%token GOTO
%token SIZEOF
%token BOOL
%token CONTINUE
%token IF
%token STATIC
%token COMPLEX
%token DEFAULT
%token INLINE
%token STRUCT
%token IMAGINARY
%token DO
%token INT
%token SWITCH
%token DOUBLE
%token LONG
%token TYPEDEF
%token ELSE
%token REGISTER
%token UNION
%token IDENTIFIER
%token <intval> INT_CONST
%token <floatval> FLOAT_CONST
%token <intval> ENUM_CONST
%token <charval> CHAR_CONST
%token <charval> STRING_LITERAL


%token OPENSQUAREBRACKET
%token CLOSESQUAREBRACKET
%token OPENROUNDBRACKET
%token CLOSEROUNDBRACKET
%token OPENFLOWERBRACKET
%token CLOSEFLOWERBRACKET
%token QUESTION
%token COLON
%token SEMICOLON
%token EQUAL
%token XOR
%token VERTICALSLASH
%token AMPERSAND
%token ASTERISK
%token PLUS
%token MINUS
%token TILDE
%token EXCLAMATION
%token PERIOD
%token FORWARDSLASH
%token PERCENT
%token LESSTHAN
%token GREATERTHAN
%token COMMA
%token HASH


%token WS

%start translation_unit

%%

primary_expression: IDENTIFIER
	{printf("PRIMARY EXPRESSION\n");}
	| constant
	{printf("PRIMARY EXPRESSION\n");}
	| STRING_LITERAL
	{printf("PRIMARY EXPRESSION\n");}
	| OPENROUNDBRACKET expression CLOSEROUNDBRACKET
	{printf("PRIMARY EXPRESSION\n");}
	;

constant: INT_CONST
	| FLOAT_CONST
	| CHAR_CONST
	| ENUM_CONST
	;

postfix_expression: primary_expression
	{printf("primary_expression\n");}
	| postfix_expression OPENSQUAREBRACKET expression CLOSESQUAREBRACKET
	| postfix_expression OPENROUNDBRACKET CLOSEROUNDBRACKET
	| postfix_expression OPENROUNDBRACKET argument_expression_list CLOSEROUNDBRACKET
	| postfix_expression PERIOD IDENTIFIER
	| postfix_expression POINTSTO IDENTIFIER
	| postfix_expression INCREMENT
	| postfix_expression DECREMENT
	| OPENROUNDBRACKET type_name CLOSEROUNDBRACKET OPENFLOWERBRACKET initializer_list CLOSEFLOWERBRACKET
	{printf("POSTFIX EXPRESSION\n");}
	|  OPENROUNDBRACKET type_name CLOSEROUNDBRACKET OPENFLOWERBRACKET initializer_list COMMA CLOSEFLOWERBRACKET
	{printf("POSTFIX EXPRESSION\n");}
	;

argument_expression_list: assignment_expression
	{printf("ARGUMENT EXPRESSION LIST\n");}
	| argument_expression_list COMMA assignment_expression
	;

unary_expression: postfix_expression
	{printf("UNARY EXPRESSION\n");}
	| INCREMENT unary_expression
	| DECREMENT unary_expression
	| unary_operator cast_expression
	{printf("UNARY EXPRESSION\n");}
	| SIZEOF unary_expression
	| SIZEOF OPENROUNDBRACKET type_name CLOSEROUNDBRACKET
	{printf("UNARY EXPRESSION\n");}
	;

unary_operator: AMPERSAND
	{printf("UNARY OPERATOR\n");}
	| ASTERISK 
	{printf("UNARY OPERATOR\n");}
	| PLUS
	{printf("UNARY OPERATOR\n");}
	| MINUS
	{printf("UNARY OPERATOR\n");}
	| TILDE
	{printf("UNARY OPERATOR\n");}
	| EXCLAMATION
	{printf("UNARY OPERATOR\n");}
	;		

cast_expression: unary_expression
	{printf("CAST EXPRESSION\n");}
	| OPENROUNDBRACKET type_name CLOSEROUNDBRACKET cast_expression
	;

multiplicative_expression: cast_expression
	{printf("MULTIPLICATIVE EXPRESSION\n");}
	| multiplicative_expression ASTERISK cast_expression
	| multiplicative_expression FORWARDSLASH cast_expression
	| multiplicative_expression PERCENT cast_expression
	;

additive_expression: multiplicative_expression
	{printf("ADDITIVE EXPRESSION\n");}
	| additive_expression PLUS multiplicative_expression
	| additive_expression MINUS multiplicative_expression
	;

shift_expression: additive_expression
	{printf("SHIFT EXPRESSION\n");}
	| shift_expression LEFTSHIFT additive_expression
	| shift_expression RIGHTSHIFT additive_expression
	;	

relational_expression: shift_expression
	{printf("RELATIONAL EXPRESSION\n");}
	| relational_expression LESSTHAN shift_expression
	| relational_expression GREATERTHAN shift_expression
	| relational_expression LESSTHANOREQUAL shift_expression
	| relational_expression GREATERTHANOREQUAL shift_expression
	;

equality_expression: relational_expression
	{printf("EQUALITY EXPRESSION\n");}
	| equality_expression EQUALSTO relational_expression
	| equality_expression NOTEQUAL relational_expression
	;

AND_expression: equality_expression
	{printf("AND EXPRESSION\n");}
	| AND_expression AMPERSAND equality_expression
	;

XOR_expression: AND_expression
	{printf("XOR EXPRESSION\n");}
	| XOR_expression XOR AND_expression
	;

OR_expression: XOR_expression
	{printf("OR EXPRESSION\n");}
	| OR_expression VERTICALSLASH XOR_expression
	;

logical_AND_expression: OR_expression
	{printf("LOGICAL AND EXPRESSION\n");}
	| logical_AND_expression AND OR_expression
	;

logical_OR_expression: logical_AND_expression
	{printf("LOGICAL OR EXPRESSION\n");}
	| logical_OR_expression OR logical_AND_expression
	;

conditional_expression: logical_OR_expression
	{printf("CONDITIONAL EXPRESSION\n");}
	| logical_OR_expression QUESTION expression COLON conditional_expression
	;

assignment_expression: conditional_expression
	{printf("ASSIGNMENT EXPRESSION\n");}
	| unary_expression assignment_operator assignment_expression
	;

assignment_operator: EQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| MULTIPLYEQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| DIVIDEEQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| PERCENTEQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| PLUSEQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| MINUSEQUAL	
	{printf("ASSIGNMENT OPERATOR\n");}
	| LEFTSHIFTEQUAL	
	{printf("ASSIGNMENT OPERATOR\n");}
	| RIGHTSHIFTEQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| ANDEQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| XOREQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	| OREQUAL
	{printf("ASSIGNMENT OPERATOR\n");}
	;

expression: assignment_expression
	{printf("EXPRESSION\n");}
	| expression COMMA assignment_expression
	;

constant_expression: conditional_expression
	{printf("CONSTANT EXPRESSION\n");}
	;

expression_optional: expression
	|
	;


declaration: declaration_specifiers SEMICOLON
	{printf("DECLARATION\n");}
	| declaration_specifiers init_declarator_list SEMICOLON
	;

declaration_specifiers: storage_class_specifier
	{printf("DECLARATION SPECIFIER\n");}
	| storage_class_specifier declaration_specifiers
	| type_specifier
	{printf("DECLARATION SPECIFIER\n");}
	| type_specifier declaration_specifiers
	| type_qualifier
	{printf("DECLARATION SPECIFIER\n");}
	| type_qualifier declaration_specifiers
	| function_specifier 
	{printf("DECLARATION SPECIFIER\n");}
	| function_specifier declaration_specifiers
	;	

init_declarator_list: init_declarator
	{printf("INIT DECLARATOR LIST\n");}
	| init_declarator_list COMMA init_declarator
	;

init_declarator: declarator
	{printf("INIT DECLARATOR\n");}
	| declarator EQUAL initializer
	{printf("INIT DECLARATOR\n");}
	;

storage_class_specifier: EXTERN
	{printf("STORAGE CLASS SPECIFIER\n");}
	| STATIC
	{printf("STORAGE CLASS SPECIFIER\n");}
	| AUTO
	{printf("STORAGE CLASS SPECIFIER\n");}
	| REGISTER
	{printf("STORAGE CLASS SPECIFIER\n");}
	;	

type_specifier: VOID
	{printf("TYPE SPECIFIER\n");}
	| CHAR
	{printf("TYPE SPECIFIER\n");}
	| SHORT
	{printf("TYPE SPECIFIER\n");}
	| INT
	{printf("TYPE SPECIFIER\n");}
	| LONG
	{printf("TYPE SPECIFIER\n");}
	| FLOAT
	{printf("TYPE SPECIFIER\n");}
	| DOUBLE
	{printf("TYPE SPECIFIER\n");}
	| SIGNED
	{printf("TYPE SPECIFIER\n");}
	| UNSIGNED
	{printf("TYPE SPECIFIER\n");}
	| BOOL
	{printf("TYPE SPECIFIER\n");}
	| COMPLEX
	{printf("TYPE SPECIFIER\n");}
	| IMAGINARY
	{printf("TYPE SPECIFIER\n");}
	| enum_specifier
	{printf("TYPE SPECIFIER\n");}
	;


specifier_qualifier_list: type_specifier specifier_qualifier_list
	{printf("SPECIFIER QUALIFIER LIST\n");}
	| type_specifier
	{printf("SPECIFIER QUALIFIER LIST\n");}
	| type_qualifier specifier_qualifier_list
	| type_qualifier
	{printf("SPECIFIER QUALIFIER LIST\n");}
	;	


enum_specifier: ENUM OPENFLOWERBRACKET enumerator_list CLOSEFLOWERBRACKET
	{printf("ENUM SPECIFIER\n");}
	| ENUM IDENTIFIER OPENFLOWERBRACKET enumerator_list CLOSEFLOWERBRACKET
	{printf("ENUM SPECIFIER\n");}
	| ENUM OPENFLOWERBRACKET enumerator_list COMMA CLOSEFLOWERBRACKET
	{printf("ENUM SPECIFIER\n");}
	| ENUM IDENTIFIER OPENFLOWERBRACKET enumerator_list COMMA CLOSEFLOWERBRACKET
	{printf("ENUM SPECIFIER\n");}
	| ENUM IDENTIFIER
	{printf("ENUM SPECIFIER\n");}
	;

enumerator_list: enumerator
	{printf("ENUM LIST\n");}
	| enumerator_list COMMA enumerator
	;

enumerator: IDENTIFIER
	{printf("ENUMERATOR\n");}
	| IDENTIFIER EQUAL constant_expression
	{printf("ENUMERATOR\n");}
	;

type_qualifier: CONST
	{printf("TYPE QUALIFIER\n");}
	| VOLATILE
	{printf("TYPE QUALIFIER\n");}
	| RESTRICT
	{printf("TYPE QUALIFIER\n");}
	;

function_specifier: INLINE
	{printf("FUNCTION SPECIFIER\n");}
	;

declarator: pointer direct_declarator
	{printf("DECLARATOR\n");}
	| direct_declarator
	{printf("DECLARATOR\n");}
	;	

direct_declarator: IDENTIFIER
	{printf("DIRECT DECLARATOR\n");}
	| OPENROUNDBRACKET declarator CLOSEROUNDBRACKET
	{printf("DIRECT DECLARATOR\n");}
	| direct_declarator OPENSQUAREBRACKET  type_qualifier_list_opt assignment_expression_opt CLOSESQUAREBRACKET
	| direct_declarator OPENSQUAREBRACKET STATIC type_qualifier_list_opt assignment_expression CLOSESQUAREBRACKET
	| direct_declarator OPENSQUAREBRACKET type_qualifier_list_opt ASTERISK CLOSESQUAREBRACKET
	| direct_declarator OPENROUNDBRACKET parameter_type_list CLOSEROUNDBRACKET
	| direct_declarator OPENROUNDBRACKET identifier_list CLOSEROUNDBRACKET
	| direct_declarator OPENROUNDBRACKET CLOSEROUNDBRACKET
	;

type_qualifier_list_opt: %empty
	| type_qualifier_list
	;
assignment_expression_opt: %empty
	| assignment_expression
	;	

pointer: ASTERISK
	{printf("POINTER\n");}
	| ASTERISK type_qualifier_list
	{printf("POINTER\n");}
	| ASTERISK pointer
	| ASTERISK type_qualifier_list pointer
	{printf("POINTER\n");}
	;

type_qualifier_list: type_qualifier
	{printf("TYPE QUALIFIER LIST\n");}
	| type_qualifier_list type_qualifier
	;


parameter_type_list: parameter_list
	{printf("PARAMETER TYPE LIST\n");}
	| parameter_list COMMA ELLIPSIS
	;

parameter_list: parameter_declaration
	{printf("PARAMETER LIST\n");}
	| parameter_list COMMA parameter_declaration
	;

parameter_declaration: declaration_specifiers declarator
	| declaration_specifiers
	{printf("PARAMETER DECLARATION\n");}
	;

identifier_list: IDENTIFIER
	{printf("IDENTIFIER LIST\n");}
	| identifier_list COMMA IDENTIFIER
	;

type_name: specifier_qualifier_list
	{printf("TYPE NAME\n");}
	;


initializer: assignment_expression
	{printf("INITIALIZER\n");}
	| OPENFLOWERBRACKET initializer_list CLOSEFLOWERBRACKET
	{printf("INITIALIZER\n");}
	| OPENFLOWERBRACKET initializer_list COMMA CLOSEFLOWERBRACKET
	{printf("INITIALIZER\n");}
	;

initializer_list: initializer
	{printf("INITIALIZER LIST\n");}
	| designation initializer
	{printf("INITIALIZER LIST\n");}
	| initializer_list COMMA initializer
	| initializer_list COMMA designation initializer
	;

designation: designator_list EQUAL
	{printf("DESIGNATION\n");}
	;

designator_list: designator
	{printf("DESIGNATOR LIST\n");}
	| designator_list designator
	;

designator: OPENSQUAREBRACKET constant_expression CLOSESQUAREBRACKET
	{printf("DESIGNATOR\n");}
	| PERIOD IDENTIFIER
	{printf("DESIGNATOR\n");}
	;	

statement: labeled_statement
	{printf("STATEMENT\n");}
	| compound_statement
	{printf("STATEMENT\n");}
	| expression_statement
	{printf("STATEMENT\n");}
	| selection_statement
	{printf("STATEMENT\n");}
	| iteration_statement
	{printf("STATEMENT\n");}
	| jump_statement
	{printf("STATEMENT\n");}
	;

labeled_statement: IDENTIFIER COLON statement
	{printf("LABELED STATEMENT\n");}
	| CASE constant_expression COLON statement
	{printf("LABELED STATEMENT\n");}
	| DEFAULT COLON statement
	{printf("LABELED STATEMENT\n");}
	;

compound_statement: OPENFLOWERBRACKET CLOSEFLOWERBRACKET
	{printf("COUMPOUND STATEMENT\n");}
	| OPENFLOWERBRACKET block_item_list CLOSEFLOWERBRACKET
	{printf("COUMPOUND STATEMENT\n");}
	;

block_item_list: block_item
	{printf("BLOCK ITEM LIST\n");}
	| block_item_list block_item
	;

block_item: declaration
	{printf("BLOCK ITEM\n");}
	| statement
	{printf("BLOCK ITEM\n");}
	;	

expression_statement: SEMICOLON
	{printf("EXPRESSION STATEMENT\n");}
	| expression SEMICOLON
	{printf("EXPRESSION STATEMENT\n");}
	;

selection_statement: IF OPENROUNDBRACKET expression CLOSEROUNDBRACKET statement
	{printf("SELECTION STATEMENT\n");}
	| IF OPENROUNDBRACKET expression CLOSEROUNDBRACKET statement ELSE statement
	{printf("SELECTION STATEMENT\n");}
	| SWITCH OPENROUNDBRACKET expression CLOSEROUNDBRACKET statement
	{printf("SELECTION STATEMENT\n");}
	;

iteration_statement: WHILE OPENROUNDBRACKET expression CLOSEROUNDBRACKET statement
	{printf("ITERATION STATEMENT\n");}
	| DO statement WHILE OPENROUNDBRACKET expression CLOSEROUNDBRACKET SEMICOLON
	{printf("ITERATION STATEMENT\n");}
	| FOR OPENROUNDBRACKET expression_optional SEMICOLON expression_optional SEMICOLON expression_optional CLOSEROUNDBRACKET statement 
	{printf("ITERATION STATEMENT\n");}
	| FOR OPENROUNDBRACKET declaration expression_optional SEMICOLON expression_optional CLOSEROUNDBRACKET statement
	{printf("ITERATION STATEMENT\n");}
	;

jump_statement: GOTO IDENTIFIER SEMICOLON
	{printf("JUMP STATEMENT\n");}
	| CONTINUE SEMICOLON
	{printf("JUMP STATEMENT\n");}
	| BREAK SEMICOLON
	{printf("JUMP STATEMENT\n");}
	| RETURN SEMICOLON
	{printf("JUMP STATEMENT\n");}
	| RETURN expression SEMICOLON
	{printf("JUMP STATEMENT\n");}
	;

translation_unit:external_declaration
	{printf("TRANSLATION  UNIT\n");}
	| translation_unit external_declaration
	;

external_declaration: function_definition
	{printf("EXTERNAL DECLARATION\n");}	
	| declaration
	{printf("EXTERNAL DECLARATION\n");}
	;

function_definition: declaration_specifiers declarator declaration_list compound_statement
	{printf("FUNCTION DEFINITION\n");}	
	| declaration_specifiers declarator compound_statement
	{printf("FUNCTION DEFINITION\n");}
	| declarator declaration_list compound_statement
	{printf("FUNCTION DEFINITION\n");}
	| declarator compound_statement
	{printf("FUNCTION DEFINITION\n");}
	;
declaration_list: declaration
	{printf("DECLARATION LIST\n");}
	| declaration_list declaration
	;
%%

void yyerror(char *s) 
{
	printf("Parsing Error : %s\n",s);
}
