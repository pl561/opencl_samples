TARGET1=main
TARGET2=min
TARGET3=vadd
LIBS=-lm -lOpenCL
CC=gcc
CFLAGS=-g -Wall
LIBS=-lOpenCL


.PHONY: default all clean

default: $(TARGET1) # $(TARGET2) $(TARGET3)
all: default


main.o : main.c
	$(CC) $(CFLAGS) main.c $(LIBS) -o main.o

$(TARGET1) : main.o
	$(CC) main.o $(CFLAGS) $(LIBS) $(TARGET1)



clean:
	rm -f *.o
	rm -f $(TARGET1) $(TARGET2) $(TARGET3)

#https://stackoverflow.com/questions/1484817/how-do-i-make-a-simple-makefile-for-gcc-on-linux
#OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
#HEADERS = $(wildcard *.h)
#%.o: %.c $(HEADERS)
#    $(CC) $(CFLAGS) -c $< -o $@

#.PRECIOUS: $(TARGET) $(OBJECTS)

#$(TARGET): $(OBJECTS)
#    $(CC) $(OBJECTS) -Wall $(LIBS) -o $@
