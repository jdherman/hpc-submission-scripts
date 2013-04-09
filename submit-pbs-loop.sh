#!/bin/bash

# Example submission of PBS jobs in a loop

NUMBERS=$(seq 1 10) # Create an array of seed values from 1 to NSEEDS

# Loop through the different seed values and submit a run for each

for NUM in ${NUMBERS}
do
	# set the job name
	NAME=My_Job_${NUM}
	echo "Submitting: ${NAME}"
	
	# Build a string called PBS which contains the instructions for your run
	# This requests 1 node for 1 hour. Runs a program called "my_program" with an argument.
	
	PBS="#!/bin/bash\n\
	#PBS -N ${NAME}\n\
	#PBS -l nodes=1:ppn=1\n\
	#PBS -l walltime=1:00:00\n\
	#PBS -o output/${NAME}.out\n\
	#PBS -e error/${NAME}.err\n\
	cd \$PBS_O_WORKDIR\n\
	./my_program -n ${NUM}"
	
	# Note that $PBS_O_WORKDIR is escaped ("\"). We don't want bash to evaluate this variable right now. Instead it will be evaluated when the command runs on the node.
	
	# Echo the string PBS to the function qsub, which submits it as a cluster job for you
	# A small delay is included to avoid overloading the submission process
	
	echo -e ${PBS} | qsub 
	sleep 0.5
	echo "done."

done


