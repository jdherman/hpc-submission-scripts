#!/bin/bash
#SBATCH -D /full/directory/path
#SBATCH -o /full/path/to/output/file/myjob.%j.%N.out   # Name of the output file (eg. myMPI.oJobID)
#SBATCH -n 1024            # Total number of processors to request (16 cores per node)
#SBATCH -p normal           # Queue name "normal"
#SBATCH -t 24:00:00        # Run time (hh:mm:ss) - 24 hours
#SBATCH --mail-user=email@address              # address for email notification
#SBATCH --mail-type=ALL                  # email at Begin and End of job

# Job script for SLURM system
# Everything in this script will be one job submission
# Note that this loops through SEEDS, but NUM is set as an environment variable in submit-slurm-loop.sh

# In other words you can divide up the work between the two scripts however you want -- decide how many total jobs there should be (in submit-slurm-loop) and how much work should be done for each job (in the loop below).

SEEDS=$(seq 1 10)

for SEED in ${SEEDS}
do
	ibrun ./my_program -s ${SEED} -c ${VARIABLE}
done
