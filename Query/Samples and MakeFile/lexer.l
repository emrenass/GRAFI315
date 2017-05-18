%{
#include<iostream>
#include "y.tab.h"
using namespace std;
int yyparse();
%}
%option yylineno

SPACE [ \t]+
ASSIGN =
EQUALITYCHECK ==
PLUS \+
HASHTAG #
COLON \:
PROPERTYSIGN ->
MINUS -
MUL \*
DIV \/
COMMA ,
DOT \.
LESSTHAN <
GREATERTHAN >
LTE <=
GTE >=
NOT !
CONCAT \^
LPARAN \(
RPARAN \)
LCBRACKET \{
RCBRACKET \}
LSBRACKET \[
RSBRACKET \]
DIGIT [0-9]
LETTER [a-zA-Z]
NEWLINE \n
NONSTAR [^\*]
NONSTARNONDIV [^\*/]
NONNEWLINE [^\n]
UNDERSCORE _
STRINGLITERAL	\"([^\"\\\n]|\\\"|\\n|\\t|\\\\)*\" 
BOOL true|false
ID {LETTER}({LETTER}|{DIGIT}|{UNDERSCORE})*
INT ({MINUS}|{PLUS})?{DIGIT}+
FLOAT {INT}"."{DIGIT}+
ENDSTATEMENT ;
COMMENT {DIV}{DIV}{NONNEWLINE}*{NEWLINE}|{DIV}\*({NONSTAR}|\*+{NONSTARNONDIV})*\*+{DIV}
QUERY Query
EDGE edge
VERTEX vertex
HASPROP	hasProp
ABS abs
ROUNDUP roundUp
ROUNDDOWN roundDown
INTKEY int
FLOATKEY float
BOOLKEY boolean
STRINGKEY String
IF \?
AND &
OR \|

%%
{INTKEY} return INTKEY;
{FLOATKEY} return FLOATKEY;
{BOOLKEY} return BOOLKEY;
{STRINGKEY} return STRINGKEY;
{QUERY} return QUERY;
{HASPROP} return HASPROP;
{ABS} return ABS ;
{ROUNDUP} return ROUNDUP ;
{ROUNDDOWN} return ROUNDDOWN ;
{VERTEX} return VERTEX ;
{EDGE} return EDGE ;
{PROPERTYSIGN} return PROPERTYSIGN;
{AND} return AND;
{OR} return OR;
{DOT} return DOT;
{SPACE} ;
{COMMENT} ;
{COMMA} ;
{NEWLINE} ;
{ENDSTATEMENT} return ENDSTATEMENT;
{ASSIGN} return ASSIGN;
{NOT} return NOT;
{LTE} return LTE;
{GTE} return GTE ;
{LESSTHAN} return LESSTHAN;
{GREATERTHAN} return GREATERTHAN ;
{EQUALITYCHECK} return EQUALITYCHECK ;
{LCBRACKET} return LCBRACKET;
{RCBRACKET} return RCBRACKET;
{PLUS} return PLUS;
{MINUS} return MINUS;
{MUL} return STAR;
{DIV} return DIV;
{LPARAN} return LPARAN;
{RPARAN} return RPARAN;
{LSBRACKET} return LSBRACKET ;
{RSBRACKET} return RSBRACKET ;
{STRINGLITERAL} return STRINGLITERAL ;
{BOOL} return BOOL ;
{INT} return INT;
{FLOAT} return FLOAT ;
{ID} return ID ;
{HASHTAG} return HASHTAG;
{CONCAT} return CONCAT ;

%%
int yywrap()
{
	return 1;
}
