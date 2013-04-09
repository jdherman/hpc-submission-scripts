#!/usr/bin/python
# Example PBS cluster job submission in Python

from popen2 import popen2
import time

# If you want to be emailed by the system, include these in job_string:
#PBS -M your_email@address
#PBS -m abe  # (a = abort, b = begin, e = end)

# Loop over your jobs
for i in range(1, 10):

	# Open a pipe to the qsub command.
	output, input = popen2('qsub')
	
	# Customize your options here
	job_name = "my_job_%d" % i
	walltime = "1:00:00"
	processors = "nodes=1:ppn=1"
	command = "./my_program -n %d" % i

	job_string = """#!/bin/bash
	#PBS -N %s
	#PBS -l walltime=%s
	#PBS -l %s
	#PBS -o ./output/%s.out
	#PBS -e ./error/%s.err
	cd $PBS_O_WORKDIR
	%s""" % (job_name, walltime, processors, job_name, job_name, command)
	
	# Send job_string to qsub
	input.write(job_string)
	input.close()
	
	# Print your job and the system response to the screen as it's submitted
	print job_string
	print output.read()
	
	time.sleep(0.1)