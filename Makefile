install:
	sudo apt-get install -f flex
	sudo apt-get install bison

run: 
	bison -d e1.y
	flex e1.l
	cc -o e1 lex.yy.c e1.tab.c
	./e1 < exemplo.e1 >> out.txt

test:
	sh ./tests/test_main.sh

bla:
	echo 'bla'

ble:
	echo 'ble'

all:
	make install
	make run
	make test