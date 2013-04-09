## Example job submission scripts for HPC systems
#### Contains PBS and SLURM examples

#####PBS
* To submit a single job from a *.sh file: `qsub example-pbs-script.sh`
* To submit multiple jobs in a loop: `./submit-pbs-loop.sh` or `python submit-pbs-loop.py`

Note that the latter option does not require a *.sh file to exist for each job. It creates job submission strings and submits them without saving to a file. This is useful for large submissions.

#####SLURM
The SLURM examples are connected to each other, because the "multiple-submission" case requires a *.sh file to exist for the job (as far as I know).

* To submit multiple jobs in a loop: `./submit-slurm-loop.sh`
* To submit a single job, this example would require you to pass an environment variable like so:

```bash
sbatch -J my_job_name --export=VARIABLE=1 example-slurm-script.sh
```

But if you modify `example-slurm-script.sh` to not depend on `${VARIABLE}`, then you would not need to do this.