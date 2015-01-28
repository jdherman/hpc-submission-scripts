#!/bin/bash

rank=`expr ${OMPI_COMM_WORLD_RANK} + $1`

touch output_${rank}.out 
echo "hello, this is no ${rank} file" > output_${rank}.out
