CC = gcc
FLAGS = -Wall
OBJECTS = trie/input_parse.o  trie/postingList.o trie/trie.o trie/trieInsertion.o jobExec/child.o jobExec/fifo_fcts.o jobExec/functions.o jobExec/jobExecutor.o jobExec/parent.o jobExec/PCOptions.o

all : main

main : $(OBJECTS)
	$(CC) $(FLAGS) -o jobExecutor $(OBJECTS) -lm

trie/input_parse.o : trie/input_parse.c
	$(CC) $(FLAGS) -c trie/input_parse.c -o trie/input_parse.o

trie/postingList.o : trie/postingList.c
	$(CC) $(FLAGS) -c trie/postingList.c -o trie/postingList.o

trie/trie.o : trie/trie.c
	$(CC) $(FLAGS) -c trie/trie.c -o trie/trie.o

trie/trieInsertion.o : trie/trieInsertion.c
	$(CC) $(FLAGS) -c trie/trieInsertion.c -o trie/trieInsertion.o

jobExec/child.o : jobExec/child.c
	$(CC) $(FLAGS) -c jobExec/child.c -o jobExec/child.o

jobExec/fifo_fcts.o : jobExec/fifo_fcts.c
	$(CC) $(FLAGS) -c jobExec/fifo_fcts.c -o jobExec/fifo_fcts.o

jobExec/functions.o : jobExec/functions.c
	$(CC) $(FLAGS) -c jobExec/functions.c -o jobExec/functions.o

jobExec/jobExecutor.o : jobExec/jobExecutor.c
	$(CC) $(FLAGS) -c jobExec/jobExecutor.c -o jobExec/jobExecutor.o

jobExec/parent.o : jobExec/parent.c
	$(CC) $(FLAGS) -c jobExec/parent.c -o jobExec/parent.o

jobExec/PCOptions.o : jobExec/PCOptions.c
	$(CC) $(FLAGS) -c jobExec/PCOptions.c -o jobExec/PCOptions.o

.PHONY : clean
clean :
	rm $(OBJECTS) jobExecutor
