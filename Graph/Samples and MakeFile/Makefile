all: lexer parser
	g++ y.tab.c lex.yy.c -o graph_parser

lexer: lexer.l
	flex lexer.l

parser: graph_parser.y
	yacc -d graph_parser.y

test1: SampleCode1.txt
	cat SampleCode1.txt | ./graph_parser
test2: SampleCode2.txt
	cat SampleCode2.txt | ./graph_parser
test3: SampleCode3.txt
	cat SampleCode3.txt | ./graph_parser
test4: SampleCode4-Error.txt
	cat SampleCode4-Error.txt | ./graph_parser
test5: SampleCode5-Error.txt
	cat SampleCode5-Error.txt | ./graph_parser
test6: SampleCode6-Error.txt
	cat SampleCode6-Error.txt | ./graph_parser
test7: SampleCode7-Error.txt
	cat SampleCode7-Error.txt | ./graph_parser
test8: SampleCode8-Error.txt
	cat SampleCode8-Error.txt | ./graph_parser

clean:
	-rm -f y.tab.h
	-rm -f graph_parser.c
	-rm -f y.tab.c
	-rm -f lex.yy.c
	-rm -f graph_parser
