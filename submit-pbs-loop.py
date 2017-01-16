#!/usr/bin/python
# Example PBS cluster job submission in Python

from subprocess import Popen, PIPE
import time

# If you want to be emailed by the system, include these in job_string:
#PBS -M your_email@address
#PBS -m abe  # (a = abort, b = begin, e = end)

# Loop over your jobs
for i in range(1, 10):

    # Open a pipe to the qsub command.
    proc = Popen('qsub', shell=True, stdin=PIPE, stdout=PIPE, stderr=PIPE, close_fds=True)
    
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
    proc.stdin.write(job_string.encode('utf-8'))
    out, err = proc.communicate()
    
    # Print your job and the system response to the screen as it's submitted
    print job_string
    print out
    
    time.sleep(0.1)
