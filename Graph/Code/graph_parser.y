%token SPACE
%token ASSIGN
%token EQUALITYCHECK
%token PLUS
%token HASHTAG
%token COLON
%token DIRECTIONARROW
%token BIDIRECTIONALARROW
%token PROPERTYSIGN
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
%token COMMENT
%token DIRECTEDGRAPH
%token UNDIRECTEDGRAPH
%token QUERY
%token EDGE
%token VERTEX
%token VERTEXQUERY
%token EDGEQUERY
%token IF
%token AND
%token OR

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
program: graph_list

graph_list: graph graph_list 
			|
graph:  undirected_graph
		| directed_graph
		| ID LCBRACKET ud_graph_expr_list RCBRACKET {yyerror("Graph Type is not defined.");}

undirected_graph: UNDIRECTEDGRAPH ID LCBRACKET ud_graph_expr_list RCBRACKET 
				|	UNDIRECTEDGRAPH ID LCBRACKET ud_graph_expr_list {yyerror("Graph Definition is not finished, '}' needed.");}
				|	UNDIRECTEDGRAPH ID ud_graph_expr_list RCBRACKET {yyerror("Graph Definition is not finished, '{' needed.");}

directed_graph: DIRECTEDGRAPH ID LCBRACKET d_graph_expr_list RCBRACKET
			|	DIRECTEDGRAPH ID LCBRACKET d_graph_expr_list {yyerror("Graph Definition is not finished, '}' needed.");}
			|	DIRECTEDGRAPH ID d_graph_expr_list RCBRACKET {yyerror("Graph Definition is not finished, '{' needed.");}
			
d_graph_expr_list: d_graph_expr d_graph_expr_list
					|
ud_graph_expr_list: ud_graph_expr ud_graph_expr_list
					|

ud_graph_expr: vertex_def 
			|	edge_def
			|	property_def
			|	ud_edge_relation_def


d_graph_expr: vertex_def 
			|	edge_def
			|	property_def
			|	d_edge_relation_def


vertex_def: VERTEX id_list ENDSTATEMENT				
			| 	VERTEX id_list {yyerror("Statement not finished, ';' expected.");}

	
edge_def: EDGE id_list ENDSTATEMENT			
			| 	EDGE id_list {yyerror("Missing end statement ';' after edge definition");}

property_def: ID PROPERTYSIGN STRINGLITERAL ASSIGN property_types ENDSTATEMENT
			| 	ID PROPERTYSIGN STRINGLITERAL ASSIGN property_types {yyerror("Statement not finished, ';' expected.");}
			
				

d_edge_relation_def: ID ASSIGN ID DIRECTIONARROW ID ENDSTATEMENT
				|	ID ASSIGN ID BIDIRECTIONALARROW ID ENDSTATEMENT {yyerror("Relation type does not match, ':>' expected.");}
				|	ID ASSIGN ID DIRECTIONARROW ID {yyerror("Statement not finished, ';' expected.");}
				|	ID ASSIGN DIRECTIONARROW ID ENDSTATEMENT {yyerror("Unconnected Vertex.");}

ud_edge_relation_def: ID ASSIGN ID BIDIRECTIONALARROW ID ENDSTATEMENT
				|	ID ASSIGN ID DIRECTIONARROW ID ENDSTATEMENT {yyerror("Relation type does not match, '::' expected.");}
				|	ID ASSIGN ID BIDIRECTIONALARROW ID {yyerror("Statement not finished, ';' expected.");}
				|	ID ASSIGN BIDIRECTIONALARROW ID ENDSTATEMENT {yyerror("Unconnected Vertex.");}


property_types: primitive_types
			| data_struct

primitive_types: STRINGLITERAL 
			| ID
			| INT  
			| BOOL 
			| FLOAT

data_struct: list
		| set

list: LSBRACKET data_elements RSBRACKET
		|

set: LESSTHAN data_elements GREATERTHAN
		|
			
data_elements: primitive_types data_elements_tail
		|	{yyerror("Empty property error.");}
			

data_elements_tail: COMMA primitive_types data_elements_tail
				| primitive_types data_elements_tail {yyerror("Comma needed.");}
				| COMMA data_elements_tail {yyerror("Empty data value error.");}
				|
			
			
id_list: ID id_list_tail

id_list_tail: COMMA ID id_list_tail 
			|
				
				
				
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

