//
// Created by lefevre on 09/12/17.
//

#ifndef TEST1_VECTOR_ADDITION_H
#define TEST1_VECTOR_ADDITION_H


#include <stdio.h>
#include <stdlib.h>

#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif

#define MAX_SOURCE_SIZE (0x100000)

char *get_source_str(char *fname_source, size_t *source_size);

int *myvector_create(int size);


#endif //TEST1_VECTOR_ADDITION_H
