#!/bin/bash

# Build test (advection).
gcc -lm  adv3.c ../drawme.c ../gnuplot_i/gnuplot_i.o -o advection

