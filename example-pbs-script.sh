#!/bin/bash
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe

cd $PBS_O_WORKDIR

# Your commands go here
# This example loops through an array and runs a program called my_program, changing the argument value each time.

numbers="1 2 3 4 5"

for number in ${numbers}
do
  ./my_program -n ${number}
done

# etc. ...