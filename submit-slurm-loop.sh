#!/bin/bash

# Example submission for SLURM system
# Loop through multiple job submissions
# Pass environment variables to job script
NUMBERS=$(seq 1 4)

for NUM in ${NUMBERS}
do
	sbatch -J JOB_NAME_${NUM} --export=VARIABLE=${NUM} example-slurm-script.sh
done
