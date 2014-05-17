#!/bin/bash

# Build test (advection).
gcc advection_1.c ../drawme.c ../gnuplot_i/gnuplot_i.o -lm -o advection_1
