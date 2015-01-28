#!/bin/bash
#PBS -j oe
#PBS -l nodes=4:ppn=2
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

# Run 20 serial jobs, 8 at a time (using 8 processors)

# define the total number of jobs here 
num_serial_jobs=20
num_procs=$(cat $PBS_NODEFILE | wc -l)
count=0

while [ $count -lt $num_serial_jobs ]
do
  rank_base=$count
  count=`expr $count + $num_procs`
  remain=`expr $num_serial_jobs - $count`
  if [ $remain -lt 0 ]; then
    run_count=`expr $num_serial_jobs % $num_procs`
  else
    run_count=$num_procs
  fi
  mpirun -np $run_count ./wrapper.sh $rank_base
done
