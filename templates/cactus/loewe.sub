#!/bin/sh
#SBATCH --partition=parallel
#SBATCH --constraint=dual
#SBATCH --time=@WALLTIME@
#SBATCH --ntasks=@NUM_PROCS@
#SBATCH --cpus-per-task=@NUM_THREADS@
#SBATCH --job-name=@SIMULATION_NAME@-@SEGMENT@
#SBATCH --mem-per-cpu=2600
#SBATCH --mail-type=ALL
#SBATCH --output=@RUNDIR@/@SIMULATION_NAME@.out
#SBATCH --error=@RUNDIR@/@SIMULATION_NAME@.err

echo "Preparing:"
set -x                          # Output commands
set -e                          # Abort on errors

cd @RUNDIR@

module purge
module load unstable
module load slurm/2.6.3
module load intel/compiler/64/15.0.0
module load mpi/mvapich2/intel-15.0.0/2.0
module load hdf5/intel-15.0.0/1.8.14

echo "Checking:"
pwd
hostname
date

echo "Environment:"
export CACTUS_NUM_PROCS=@NUM_PROCS@
export CACTUS_NUM_THREADS=@NUM_THREADS@
export GMON_OUT_PREFIX=gmon.out
export OMP_NUM_THREADS=@NUM_THREADS@
export MV2_ENABLE_AFFINITY=0

if [ ! -z "$MPI_NODEFILE" ]; then
    cat ${MPI_NODEFILE} > NODES
    export MPI_NODEFILE=${TMPDIR}/machines

    uniq ${MPI_NODEFILE} > PROC_NODES

    for node in $(cat PROC_NODES); do
        for (( proc=0; $proc<@PROC_PER_NODE@; proc=$proc+1 )); do
            echo ${node}
        done
    done > ${MPI_NODEFILE}
fi

env | sort > ENVIRONMENT

export CACTUS_STARTTIME=$(date +%s)
echo "Starting:"

time srun -n @NUM_PROCS@  @EXECUTABLE@ -L 3 @PARFILE@

echo "Stopping:"
date

touch segment.done
echo "Done."
