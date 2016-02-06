#! /bin/bash
# @ job_name = @SIMULATION_NAME@-@SEGMENT@
# @ shell = /bin/bash
# @ job_type = bluegene
# @ wall_clock_limit = @WALLTIME@
# @ bg_size = @NODES@
# @ class = parallel
# @ account_no = @ALLOCATION@
# @ queue
# @ notify_user = @EMAIL@
# @ notification = always
# @ environment = COPY_ALL
# @ initialdir = @RUNDIR@
# @ input = /dev/null
# @ environment = COPY_ALL; OMP_NUM_THREADS=@NUM_THREADS@
# @ output = @RUNDIR@/@SIMULATION_NAME@.out
# @ error = @RUNDIR@/@SIMULATION_NAME@.err

echo "Preparing:"
set -x                          # Output commands
set -e                          # Abort on errors

cd @RUNDIR@

echo "Checking:"
pwd
hostname
date

echo "Environment:"
export CACTUS_NUM_PROCS=@NUM_PROCS@
export CACTUS_NUM_THREADS=@NUM_THREADS@
export OMP_NUM_THREADS=@NUM_THREADS@
env | sort > ENVIRONMENT

echo "Starting:"
runjob --ranks-per-node @PROC_PER_NODE@ \
	--envs CACTUS_NUM_PROCS=@NUM_PROCS@ \
	--envs CACTUS_NUM_THREADS=@NUM_THREADS@ \
	--envs CACTUS_STARTTIME=$(date +%s) \
	--envs OMP_THREAD_LIMIT=64 \
	--envs OMP_NUM_THREADS=@NUM_THREADS@ \
	--exe @EXECUTABLE@ \
	--args -L 3 @PARFILE@ \
	2>@SIMULATION_NAME@.err | tee @SIMULATION_NAME@.out
# Dump cores
#	--envs BG_COREDUMPONEXIT=1 \
#	--envs BG_COREDUMPBINARY='*' \
# Other options
#	--envs BG_SHAREDMEMSIZE=32MB \
#	--envs BG_THREADLAYOUT=2 \
#	--envs PAMID_VERBOSE=1 \
#	--envs XL_BG_SPREADLAYOUT=YES \
#	--verbose=INFO \

echo "Stopping:"
date

echo "Done."
