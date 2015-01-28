#!/bin/bash
#PBS -j oe
#PBS -l nodes=2:ppn=4
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR
num_procs=$(cat $PBS_NODEFILE | wc -l)

# run the mpi process with total number of 8 processes ( 2 x 8 ) 
# 'wrapper.sh' is the wrapper script for instructing mpi how to 
# execute the program in batch 
# '0' is the command line input that can be arbitrarily defined 
mpirun -np $num_procs wrapper.sh 0 
