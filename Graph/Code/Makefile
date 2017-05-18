all: lexer parser
	g++ y.tab.c lex.yy.c -o graph_parser

lexer: lexer.l
	flex lexer.l

parser: graph_parser.y
	yacc -d graph_parser.y

test1: query_sampleCode1.txt
	cat query_sampleCode1.txt | ./query_parser
test2: query_sampleCode2.txt
	cat query_sampleCode2.txt | ./query_parser
test3: query_sampleCode3.txt
	cat query_sampleCode3.txt | ./query_parser
test4: query_sampleCode4.txt
	cat query_sampleCode1.txt | ./query_parser
test5: query_sampleCode5-Error.txt
	cat query_sampleCode5-Error.txt | ./query_parser
test6: query_sampleCode6-Error.txt
	cat query_sampleCode6-Error.txt | ./query_parser
test7: query_sampleCode7-Error.txt
	cat query_sampleCode7-Error.txt | ./query_parser
test8: query_sampleCode8-Error.txt
	cat query_sampleCode8-Error.txt | ./query_parser
test9: query_sampleCode9-Error.txt
	cat query_sampleCode9-Error.txt | ./query_parser

clean:
	-rm -f y.tab.h
	-rm -f graph_parser.c
	-rm -f y.tab.c
	-rm -f lex.yy.c
	-rm -f graph_parser
