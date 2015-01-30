### Example job submission scripts for HPC systems
#### Contains PBS and SLURM examples

#####PBS
* To submit a single job from a *.sh file: `qsub example-pbs-script.sh`
* To submit multiple jobs in a loop: `./submit-pbs-loop.sh` or `python submit-pbs-loop.py` (These do the same thing, but the Python example is easier to work with).

Note that the latter option does not require a *.sh file to exist for each job. It creates job submission strings and submits them without saving to a file. This is useful for large submissions.

`pbs-serial-batch/` contains a few options for running lots of similar jobs. If your cluster supports array scheduling, this may be easier:

`qsub serial-job.sh -t 0-100%10`

This will submit 100 serial jobs, running a maximum of 10 at a time (the `slot_limit` parameter after the `%`). The array ID is passed into `serial-job.sh` via the `$PBS_ARRAYID` environment variable, which can be used to change what work is being done.

#####SLURM
The SLURM examples are connected to each other, because the "multiple-submission" case requires a *.sh file to exist for the job (as far as I know).

* To submit multiple jobs in a loop: `./submit-slurm-loop.sh`
* To submit a single job, this example would require you to pass an environment variable like so:

```bash
sbatch -J my_job_name --export=VARIABLE=1 example-slurm-script.sh
```

The job name is optional. If you modify `example-slurm-script.sh` to not depend on `${VARIABLE}`, then you could just run `sbatch example-slurm-script.sh`.