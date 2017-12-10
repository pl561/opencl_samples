# dummy makefile with no rule optimization (to do)

TARGET1=main
TARGET2=min
TARGET3=vadd

BSN1=main
BSN2=minimal_opencl_example
BSN3=vector_addition

SRC1=$(BSN1).c
SRC2=$(BSN2).c
SRC3=$(BSN3).c

HDR1=$(BSN1).h
HDR2=$(BSN2).h
HDR3=$(BSN3).h

OBJ1=$(BSN1).o
OBJ2=$(BSN2).o
OBJ3=$(BSN3).o

LIBS=-lm -lOpenCL
CC=gcc
CFLAGS=-g -Wall


.PHONY: default all clean

default: $(TARGET1) $(TARGET2) $(TARGET3)
all: default


$(OBJ1) : $(SRC1)
	$(CC) -c $(CFLAGS) $(SRC1) -o $(OBJ1)

$(OBJ2) : $(SRC2)
	$(CC) -c $(CFLAGS) $(SRC2) -o $(OBJ2)

$(OBJ3) : $(SRC3) $(HDR3)
	$(CC) -c $(CFLAGS) $(SRC3) -o $(OBJ3)




$(TARGET1) : $(OBJ1)
	$(CC) $(OBJ1) $(CFLAGS) $(LIBS) -o $(TARGET1)

$(TARGET2) : $(OBJ2)
	$(CC) $(OBJ2) $(CFLAGS) $(LIBS) -o $(TARGET2)

$(TARGET3) : $(OBJ3)
	$(CC) $(OBJ3) $(CFLAGS) $(LIBS) -o $(TARGET3)


clean:
	rm -f *.o
	rm -f $(TARGET1) $(TARGET2) $(TARGET3)


# -c : argument de gcc pour ne pas linker les binaires
# -o : argument de gcc pour nommer le fichier de sortie


# opencl on cpu
# https://askubuntu.com/questions/850281/opencl-on-ubuntu-16-04-intel-sandy-bridge-cpu
# https://stackoverflow.com/questions/19141272/opencl-implementation-for-intel-core-i5-linux


#https://stackoverflow.com/questions/1484817/how-do-i-make-a-simple-makefile-for-gcc-on-linux
#OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
#HEADERS = $(wildcard *.h)
#%.o: %.c $(HEADERS)
#    $(CC) $(CFLAGS) -c $< -o $@

#.PRECIOUS: $(TARGET) $(OBJECTS)

#$(TARGET): $(OBJECTS)
#    $(CC) $(OBJECTS) -Wall $(LIBS) -o $@
