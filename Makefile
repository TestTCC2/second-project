install:
	apt-get install -f flex
	apt-get install bison

run: 
	bison -d e1.y
	flex e1.l
	cc -o e1 lex.yy.c e1.tab.c
	./e1 < exemplo.e1 >> out.txt

test:
	diff -w -u1 --color=auto --palette='ad=1;3;38;5;154:de=1;3;38;5;9' out.txt test.txt  && echo "OK" || result=1
