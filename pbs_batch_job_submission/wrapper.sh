#!/bin/bash
# this the shell script for wrapping your program

# 'rank' changes with the ongoing no. of the process 
rank=`expr ${OMPI_COMM_WORLD_RANK} + $1`

# define your batch job here
touch output_${rank}.out 
echo "hello, this is no ${rank} file" > output_${rank}.out
