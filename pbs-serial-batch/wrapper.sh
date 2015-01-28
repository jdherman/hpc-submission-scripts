#!/bin/bash
# this the shell script for wrapping your program

# 'rank' is taken from the MPI environment variable
# for the 'multi-jobs' case, it also needs the command line argument $1
rank=`expr ${OMPI_COMM_WORLD_RANK} + $1`

# define your commands here
echo "hello, this is processor ${rank}!" > output_${rank}.out
