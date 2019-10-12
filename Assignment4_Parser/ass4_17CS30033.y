%{ /* C Declarations and Definitions */
#include <stdio.h>
extern int yylex();
void yyerror(const char*);
%}

%union {
    float floatval;
    char *charval;
	int intval;
}

%token <intval> INTEGER_CONST
%token <intval> FLOAT_CONST
%token <intval> ENUMERATION_CONSTANT
%token <intval> CHARACTER_CONST
%token <intval> STRING_LITERAL

%token SINGLE_COMMENT
%token MULTI_COMMENT
%token INLINE
%token STRUCT
%token IMAGINARY
%token DO
%token INT
%token SWITCH
%token DOUBLE
%token ARROW
%token INCREMENT
%token DECREMENT
%token LEFT_SHIFT
%token RIGHT_SHIFT
%token LSOE
%token GTOE
%token MINUS_EQUAL
%token LEFT_SHIFT_EQUAL
%token RIGHT_SHIFT_EQUAL
%token SIGNED
%token WHILE
%token CONST 
%token GOTO
%token SIZEOF
%token BOOL
%token CONTINUE
%token ENUM
%token RESTRICT
%token UNSIGNED
%token BREAK 
%token EXTERN
%token RETURN
%token VOID
%token REGISTER
%token UNION
%token IDENTIFIER
%token PUNCTUATOR
%token BACKOTHER
%token CASE 
%token SHORT
%token VOLATILE
%token IS_EQUAL
%token NOT_EQUAL
%token AND
%token OR
%token TRIPLE_DOT
%token MULTIPLY_EQUAL
%token DIVIDE_EQUAL
%token PERCENT_EQUAL
%token PLUS_EQUAL
%token CHAR
%token FOR
%token STATIC
%token COMPLEX
%token DEFAULT
%token LONG
%token TYPEDEF
%token ELSE
%token IF
%token AND_EQUAL
%token OR_EQUAL
%token HAT_EQUAL
%token FLOAT
%token AUTO


%start translation_unit

%%

constant: INTEGER_CONST
	| FLOAT_CONST
	| CHARACTER_CONST
	| ENUMERATION_CONSTANT
	;

argument_expression_list: assignment_expression
	{ printf("argument_expression_list\n"); }
	| argument_expression_list ',' assignment_expression
	{ printf("argument_expression_list\n"); }
	;

declaration: declaration_specifiers ';'
	{ printf("declaration\n"); }
	| declaration_specifiers init_declarator_list ';'
	{ printf("declaration\n"); }
	;

declaration_specifiers: storage_class_specifier
	{ printf("declaration_specifiers\n"); }
	| storage_class_specifier declaration_specifiers
	{ printf("declaration_specifiers\n"); }
	| type_specifier
	{ printf("declaration_specifiers\n"); }
	| type_specifier declaration_specifiers
	{ printf("declaration_specifiers\n"); }	
	| type_qualifier
	{ printf("declaration_specifiers\n"); }	
	| type_qualifier declaration_specifiers
	{ printf("declaration_specifiers\n"); }
	| function_specifier 
	{ printf("declaration_specifiers\n"); }
	| function_specifier declaration_specifiers
	{ printf("declaration_specifiers\n"); }
	;	

init_declarator_list: init_declarator
	{ printf("init_declarator_list\n"); }
	| init_declarator_list ',' init_declarator
	{ printf("init_declarator_list\n"); }
	;

init_declarator: declarator
	{ printf("init_declarator\n"); }
	| declarator '=' initializer
	{ printf("init_declarator\n"); }
	;

primary_expression: IDENTIFIER
	{ printf("primary_expression\n"); }
	| constant
	{ printf("primary_expression\n"); }
	| STRING_LITERAL
	{ printf("primary_expression\n"); }
	| '(' expression ')'
	{ printf("primary_expression\n"); }
	;

postfix_expression: primary_expression
	{ printf("primary_expression\n"); }
	| postfix_expression '[' expression ']'
	{ printf("postfix_expression\n"); }
	| postfix_expression '(' ')'
	{ printf("postfix_expression\n"); }
	| postfix_expression '(' argument_expression_list ')'
	| postfix_expression '.' IDENTIFIER
	{ printf("postfix_expression\n"); }	
	| postfix_expression ARROW IDENTIFIER
	{ printf("postfix_expression\n"); }
	| postfix_expression INCREMENT
	{ printf("postfix_expression\n"); }
	| postfix_expression DECREMENT
	{ printf("postfix_expression\n"); }
	| '(' type_name ')' '{' initializer_list '}'
	{ printf("postfix_expression\n"); }
	|  '(' type_name ')' '{' initializer_list ',' '}'
	{ printf("postfix_expression\n"); }
	;

unary_expression: postfix_expression
	{ printf("unary_expression\n"); }
	| INCREMENT unary_expression
	{ printf("unary_expression\n"); }
	| DECREMENT unary_expression
	{ printf("unary_expression\n"); }
	| unary_operator cast_expression
	{ printf("unary_expression\n"); }
	| SIZEOF unary_expression
	{ printf("unary_expression\n"); }
	| SIZEOF '(' type_name ')'
	{ printf("unary_expression\n"); }
	;

unary_operator: '&'
	{ printf("unary_operator\n"); }
	| '*'
	{ printf("unary_operator\n"); }
	| '+'
	{ printf("unary_operator\n"); }
	| '-'
	{ printf("unary_operator\n"); }
	| '~'
	{ printf("unary_operator\n"); }
	| '!'
	{ printf("unary_operator\n"); }
	;		

cast_expression: unary_expression
	{ printf("cast_expression\n"); }
	| '(' type_name ')' cast_expression
	{ printf("cast_expression\n"); }
	;

multiplicative_expression: cast_expression
	{ printf("multiplicative_expression\n"); }
	| multiplicative_expression '*' cast_expression
	{ printf("multiplicative_expression\n"); }
	| multiplicative_expression '/' cast_expression
	{ printf("multiplicative_expression\n"); }
	| multiplicative_expression '%' cast_expression
	{ printf("multiplicative_expression\n"); }
	;

additive_expression: multiplicative_expression
	{ printf("additive_expression\n"); }
	| additive_expression '+' multiplicative_expression
	{ printf("additive_expression\n"); }
	| additive_expression '-' multiplicative_expression
	{ printf("additive_expression\n"); }
	;

shift_expression: additive_expression
	{ printf("shift_expression\n"); }
	| shift_expression LEFT_SHIFT additive_expression
	{ printf("shift_expression\n"); }
	| shift_expression RIGHT_SHIFT additive_expression
	{ printf("shift_expression\n"); }
	;	

relational_expression: shift_expression
	{ printf("relational_expression\n"); }
	| relational_expression '<' shift_expression
	{ printf("relational_expression\n"); }
	| relational_expression '>' shift_expression
	{ printf("relational_expression\n"); }
	| relational_expression LSOE shift_expression
	{ printf("relational_expression\n"); }
	| relational_expression GTOE shift_expression
	{ printf("relational_expression\n"); }
	;

equality_expression: relational_expression
	{ printf("equality_expression\n"); }
	| equality_expression IS_EQUAL relational_expression
	{ printf("equality_expression\n"); }
	| equality_expression NOT_EQUAL relational_expression
	{ printf("equality_expression\n"); }
	;

and_expression: equality_expression
	{ printf("and_expression\n"); }
	| and_expression '&' equality_expression
	{ printf("and_expression\n"); }
	;

exclusive_or_expression: and_expression
	{ printf("exclusive_or_expression\n"); }
	| exclusive_or_expression '^' and_expression
	{ printf("exclusive_or_expression\n"); }
	;

inclusive_or_expression: exclusive_or_expression
	{ printf("inclusive_or_expression\n"); }
	| inclusive_or_expression '|' exclusive_or_expression
	{ printf("inclusive_or_expression\n"); }
	;

logical_and_expression: inclusive_or_expression
	{ printf("logical_and_expression\n"); }
	| logical_and_expression AND inclusive_or_expression
	{ printf("logical_and_expression\n"); }
	;

logical_or_expression: logical_and_expression
	{ printf("logical_or_expression\n"); }
	| logical_or_expression OR logical_and_expression
	{ printf("logical_or_expression\n"); }
	;

conditional_expression: logical_or_expression
	{ printf("conditional_expression\n"); }
	| logical_or_expression '?' expression ':' conditional_expression
	{ printf("conditional_expression\n"); }
	;

assignment_operator: '='
	{ printf("assignment_operator\n"); }
	| MULTIPLY_EQUAL
	{ printf("assignment_operator\n"); }
	| DIVIDE_EQUAL
	{ printf("assignment_operator\n"); }
	| PERCENT_EQUAL
	{ printf("assignment_operator\n"); }
	| PLUS_EQUAL
	{ printf("assignment_operator\n"); }
	| MINUS_EQUAL	
	{ printf("assignment_operator\n"); }
	| LEFT_SHIFT_EQUAL	
	{ printf("assignment_operator\n"); }
	| RIGHT_SHIFT_EQUAL
	{ printf("assignment_operator\n"); }
	| AND_EQUAL
	{ printf("assignment_operator\n"); }
	| HAT_EQUAL
	{ printf("assignment_operator\n"); }
	| OR_EQUAL
	{ printf("assignment_operator\n"); }
	;

enum_specifier: ENUM '{' enumerator_list '}'
	{ printf("enum_specifier\n"); }
	| ENUM IDENTIFIER '{' enumerator_list '}'
	{ printf("enum_specifier\n"); }
	| ENUM '{' enumerator_list ',' '}'
	{ printf("enum_specifier\n"); }
	| ENUM IDENTIFIER '{' enumerator_list ',' '}'
	{ printf("enum_specifier\n"); }
	| ENUM IDENTIFIER
	{ printf("enum_specifier\n"); }
	;

enumerator_list
	: enumerator
	{ printf("enumerator_list\n"); }
	| enumerator_list ',' enumerator
	{ printf("enumerator_list\n"); }
	;

enumerator
	: IDENTIFIER
	{ printf("enumerator\n"); }
	| IDENTIFIER '=' constant_expression
	{ printf("enumerator\n"); }
	;

assignment_expression: conditional_expression
	{ printf("assignment_expression\n"); }
	| unary_expression assignment_operator assignment_expression
	{ printf("assignment_expression\n"); }
	;

expression: assignment_expression
	{ printf("expression\n"); }
	| expression ',' assignment_expression
	{ printf("expression\n"); }
	;

constant_expression: conditional_expression
	{ printf("constant_expression\n"); }
	;

expression_optional: expression
			  |
			  ;

type_specifier: VOID
	{ printf("type_specifier\n"); }
	| CHAR
	{ printf("type_specifier\n"); }
	| SHORT
	{ printf("type_specifier\n"); }
	| INT
	{ printf("type_specifier\n"); }
	| LONG
	{ printf("type_specifier\n"); }
	| FLOAT
	{ printf("type_specifier\n"); }
	| DOUBLE
	{ printf("type_specifier\n"); }
	| SIGNED
	{ printf("type_specifier\n"); }
	| UNSIGNED
	{ printf("type_specifier\n"); }
	| BOOL
	{ printf("type_specifier\n"); }
	| COMPLEX
	{ printf("type_specifier\n"); }
	| IMAGINARY
	{ printf("type_specifier\n"); }
	| enum_specifier
	{ printf("type_specifier\n"); }
	;


storage_class_specifier: EXTERN
	{ printf("storage_class_specifier\n"); }
	| STATIC
	{ printf("storage_class_specifier\n"); }
	| AUTO
	{ printf("storage_class_specifier\n"); }
	| REGISTER
	{ printf("storage_class_specifier\n"); }
	;	

specifier_qualifier_list: type_specifier specifier_qualifier_list
	{ printf("specifier_qualifier_list\n"); }
	| type_specifier
	{ printf("specifier_qualifier_list\n"); }
	| type_qualifier specifier_qualifier_list
	{ printf("specifier_qualifier_list\n"); }
	| type_qualifier
	{ printf("specifier_qualifier_list\n"); }
	;	

type_qualifier: CONST
	{ printf("type_qualifier\n"); }
	| VOLATILE
	{ printf("type_qualifier\n"); }
	| RESTRICT
	{ printf("type_qualifier\n"); }
	;

function_specifier: INLINE
	{ printf("function_specifier\n"); }
	;

declarator: pointer direct_declarator
	{ printf("declarator\n"); }
	| direct_declarator
	{ printf("declarator\n"); }
	;	

direct_declarator: IDENTIFIER
	{ printf("direct_declarator\n"); }
	| '(' declarator ')'
	{ printf("direct_declarator\n"); }
	| direct_declarator '['  type_qualifier_list_opt assignment_expression_opt ']'
	{ printf("direct_declarator\n"); }
	| direct_declarator '[' STATIC type_qualifier_list_opt assignment_expression ']'
	{ printf("direct_declarator\n"); }
	| direct_declarator '[' type_qualifier_list_opt '*' ']'
	{ printf("direct_declarator\n"); }
	| direct_declarator '(' parameter_type_list ')'
	{ printf("direct_declarator\n"); }
	| direct_declarator '(' identifier_list ')'
	{ printf("direct_declarator\n"); }
	| direct_declarator '(' ')'
	{ printf("direct_declarator\n"); }
	;

type_qualifier_list_opt: %empty
	| type_qualifier_list
	{ printf("type_qualifier_list_opt\n"); }
	;
assignment_expression_opt: %empty
	{ printf("assignment_expression_opt\n"); }
	| assignment_expression
	{ printf("assignment_expression_opt\n"); }
	;	

pointer: '*'
	{ printf("pointer\n"); }
	| '*' type_qualifier_list
	{ printf("pointer\n"); }
	| '*' pointer
	{ printf("p float floatval; char *charval;ointer\n"); }
	| '*' type_qualifier_list pointer
	{ printf("pointer\n"); }
	;

type_qualifier_list: type_qualifier
	{ printf("type_qualifier_list\n"); }
	| type_qualifier_list type_qualifier
	{ printf("type_qualifier_list\n"); }
	;


parameter_type_list: parameter_list
	{ printf("parameter_type_list\n"); }
	| parameter_list ',' TRIPLE_DOT
	{ printf("parameter_type_list\n"); }
	;

parameter_list: parameter_declaration
	{ printf("parameter_list\n"); }
	| parameter_list ',' parameter_declaration
	{ printf("parameter_list\n"); }
	;

parameter_declaration: declaration_specifiers declarator
	{ printf("parameter_declaration\n"); }
	| declaration_specifiers
	{ printf("parameter_declaration\n"); }
	;

identifier_list: IDENTIFIER
	{ printf("identifier_list\n"); }
	| identifier_list ',' IDENTIFIER
	{ printf("identifier_list\n"); }
	;

type_name: specifier_qualifier_list
	{ printf("type_name\n"); }
	;


initializer: assignment_expression
	{ printf("initializer\n"); }
	| '{' initializer_list '}'
	{ printf("initializer\n"); }
	| '{' initializer_list ',' '}'
	{ printf("initializer\n"); }
	;

initializer_list: initializer
	{ printf("initializer_list\n"); }
	| designation initializer
	{ printf("initializer_list\n"); }
	| initializer_list ',' initializer
	{ printf("initializer_list\n"); }
	|  initializer_list ',' designation initializer
	{ printf("initializer_list\n"); }
	;

designation: designator_list '='
	{ printf("designation\n"); }
	;

designator_list: designator
	{ printf("designator_list\n"); }
	| designator_list designator
	{ printf("designator_list\n"); }
	;

designator: '[' constant_expression ']'
	{ printf("designator\n"); }
	| '.' IDENTIFIER
	{ printf("designator\n"); }
	;	

statement: labeled_statement
	{ printf("statement\n"); }
	| compound_statement
	{ printf("statement\n"); }
	| expression_statement
	{ printf("statement\n"); }
	| selection_statement
	{ printf("statement\n"); }
	| iteration_statement
	{ printf("statement\n"); }
	| jump_statement
	{ printf("statement\n"); }
	;

block_item: declaration
	{ printf("block_item\n"); }
	| statement
	{ printf("block_item\n"); }
	;	

expression_statement: ';'
	{ printf("expression_statement\n"); }
	| expression ';'
	{ printf("expression_statement\n"); }
	;

selection_statement: IF '(' expression ')' statement
	{ printf("selection_statement\n"); }
	| IF '(' expression ')' statement ELSE statement
	{ printf("selection_statement\n"); }
	| SWITCH '(' expression ')' statement
	{ printf("selection_statement\n"); }
	;

iteration_statement: WHILE '(' expression ')' statement
	{ printf("iteration_statement\n"); }
	| DO statement WHILE '(' expression ')' ';'
	{ printf("iteration_statement\n"); }
	| FOR '(' expression_optional ';' expression_optional ';' expression_optional ')' statement 
	{ printf("iteration_statement\n"); }
	| FOR '(' declaration expression_optional ';' expression_optional ')' statement
	{ printf("iteration_statement\n"); }
	;

jump_statement: GOTO IDENTIFIER ';'
	{ printf("jump_statement\n"); }
	| CONTINUE ';'
	{ printf("jump_statement\n"); }
	| BREAK ';'
	{ printf("jump_statement\n"); }
	| RETURN ';'
	{ printf("jump_statement\n"); }
	| RETURN expression ';'
	{ printf("jump_statement\n"); }
	;

translation_unit:external_declaration
	{ printf("translation_unit\n"); }
	| translation_unit external_declaration
	{ printf("translation_unit\n"); }
	;

external_declaration: function_definition
	{ printf("external_declaration\n"); }	
	| declaration
	{ printf("external_declaration\n"); }
	;

function_definition: declaration_specifiers declarator declaration_list compound_statement
	{ printf("function_definition\n"); }	
	| declaration_specifiers declarator compound_statement
	{ printf("function_definition\n"); }
	| declarator declaration_list compound_statement
	{ printf("function_definition\n"); }
	| declarator compound_statement
	{ printf("function_definition\n"); }
	;
declaration_list: declaration
	{ printf("declaration_list\n"); }
	| declaration_list declaration
	{ printf("declaration_list\n"); }
	;


labeled_statement: IDENTIFIER ':' statement
	{ printf("labeled_statement\n"); }
	| CASE constant_expression ':' statement
	{ printf("labeled_statement\n"); }
	| DEFAULT ':' statement
	{ printf("labeled_statement\n"); }
	;

compound_statement: '{' '}'
	{ printf("compound_statement\n"); }
	| '{' block_item_list '}'
	{ printf("compound_statement\n"); }
	;

block_item_list: block_item
	{ printf("block_item_list\n"); }
	| block_item_list block_item
	{ printf("block_item_list\n"); }
	;

%%

void yyerror(const char *s) {
	printf ("ERROR is %s", s);
}