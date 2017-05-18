%token ASSIGN
%token EQUALITYCHECK
%token PLUS
%token EXCLAMATION
%token HASHTAG
%token RARROW
%token LARROW
%token DOUBLEHYPHEN
%token MINUS
%token MUL
%token DIV
%token COMMA
%token DOT
%token LESSTHAN
%token GREATERTHAN
%token LTE
%token GTE
%token NOT
%token CONCAT
%token LPARAN
%token RPARAN
%token LCBRACKET
%token RCBRACKET
%token LSBRACKET
%token RSBRACKET
%token DIGIT
%token LETTER
%token NEWLINE
%token NONSTAR
%token NONSTARNONDIV
%token NONNEWLINE
%token UNDERSCORE
%token STRINGLITERAL
%token BOOL
%token ID 
%token INT
%token FLOAT
%token ENDSTATEMENT
%token DIRECTEDGRAPH
%token UNDIRECTEDGRAPH
%token VERTEX
%token EDGE
%token QUESTION
%token AND
%token OR
%token QUERY
%token PROPERTYSIGN
%token HASPROP
%token ABS
%token ROUNDUP
%token ROUNDDOWN
%token INTKEY
%token FLOATKEY
%token BOOLKEY
%token STRINGKEY

// Define the union that can hold different values for the tokens
 
%union 
{
  char ctf; 
  char * string;
  int integer;
}

// Define the token value types

%type <string> ID
%type <string> STRINGLITERAL
%type <integer> INT
// define associativity of operations

%left PLUS MINUS // the order defines precedence, 
%left STAR DIV // so * and / has higher precedence than + and -

%{ 
  #include <iostream> 
  #include <string>
  using namespace std;
  // forward declarations
  extern int yylineno;
  void yyerror(string);
  int yylex(void);
  int numoferr;
  
%}

%%
program: statement_list

statement_list: QUERY ID ASSIGN LCBRACKET query_expr_list RCBRACKET ENDSTATEMENT statement_list
			|	QUERY ID ASSIGN expr_list ENDSTATEMENT statement_list
			|	ID DOT ID ENDSTATEMENT statement_list
			|	ID ASSIGN LCBRACKET query_expr_list RCBRACKET ENDSTATEMENT {yyerror("Query keyword missing.");} statement_list		
			|	QUERY ID ENDSTATEMENT  {yyerror("Illegal statement expression.");} statement_list
			|	QUERY ID ASSIGN query_expr_list RCBRACKET ENDSTATEMENT {yyerror("Statement not finished, '}' expected");} statement_list
			|	QUERY ID ASSIGN LCBRACKET query_expr_list ENDSTATEMENT {yyerror("Statement not finished, '{' expected");} statement_list
			|	assignment statement_list
			|

			
query_expr_list:  	query_expr operator query_expr_list
			|	NOT LPARAN query_expr RPARAN query_expr_list
			|	query_expr  
			| 	query_expr query_expr_list {yyerror("Operator Missing.");}
				
query_expr: edge_expr 
		|vertex_expr 


vertex_expr: VERTEX PROPERTYSIGN property  
		
edge_expr: EDGE PROPERTYSIGN property 

assignment:	primitive_keys ID ASSIGN primitive_types ENDSTATEMENT

property: STRINGLITERAL bool_operator primitive_types 
		|	STRINGLITERAL bool_operator ID 
		|	function_expr
		|	STRINGLITERAL bool_operator arithmatic_expr

arithmatic_expr: primitive_types arithmatic_expr_tail 
		|	arithmatic_expr  arithmatic_expr_tail 

arithmatic_expr_tail: arithmatic primitive_types arithmatic_expr_tail
		|	arithmatic arithmatic_expr_tail
		|	primitive_types arithmatic_expr_tail
		|

function_expr: function_word LPARAN ID RPARAN  
		|	function_word LPARAN ID {yyerror("Illegal function declaration, ')' expected");} 
		|	function_word ID RPARAN	{yyerror("Illegal function declaration, '(' expected");}

expr_list: ID expr_list_tail 
		|	{yyerror("No expression declared.");} 
		
expr_list_tail: operator ID expr_list_tail 
		|	operator LPARAN ID expr_list_tail  
		|	operator ID expr_list_tail 
		|	RPARAN expr_list_tail	 
		|	 
primitive_keys: INTKEY
		| FLOATKEY
		| BOOLKEY
		| STRINGKEY

primitive_types: STRINGLITERAL 
		| INT 
		| FLOAT 
		| BOOL

function_word: ABS 
	|HASPROP
	|ROUNDUP
	|ROUNDDOWN 
			
operator: CONCAT 
		| OR 
		| MUL

not: NOT 
	|  

bool_operator: EQUALITYCHECK
		|LESSTHAN 
		|GREATERTHAN
		|LTE
		|GTE
		|arithmatic {yyerror("Boolean expression is expected for queries");} 
		
arithmatic: PLUS 
		|MINUS 
		|MUL 
		|DIV 
			
				
%%

// report errors
extern int yylineno;
void yyerror(string s) 
{
	numoferr++;
	cout << "error at line " << yylineno << ": " << s << endl;
}
int main()
{
	numoferr=0;
	yyparse();
	if(numoferr>0) {
		cout << "Parsing completed with " << numoferr << " errors" <<endl;
	} else {
		cout << "Successfully parsed" <<endl;
	}
	return 0;
}

