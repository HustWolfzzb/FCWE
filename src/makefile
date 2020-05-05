ifeq ($(shell uname -s), Darwin)
	CC = clang
else
	CC = gcc
	CFLAGS += -pthread -lm
endif

CFLAGS += -O2 -std=c99 

all: FCWE.c word_analogy.c
	${CC} FCWE.c ${CFLAGS} -o fcwe
	${CC} word_analogy.c ${CFLAGS} -o word_analogy
clean: 
	rm fcwe word_analogy
