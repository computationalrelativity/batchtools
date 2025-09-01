#!/bin/bash
#set -x
set -eu -o pipefail

if [[ $# != 2 ]];then
        echo 'usage: mpibt NODEFILE EXENAME' >&2
        exit 1
fi
if [[ ! -s $1 ]];then
        echo "Error: nodefile: $1" >&2
        exit 1
fi
NODE_LIST=$(cat "$1")
MPI_EXECUTABLE_NAME="$2"

for node in $NODE_LIST; do
        ssh "$node" "{ date; ps -Fp \$(pgrep -u $LOGNAME -f -x '^$MPI_EXECUTABLE_NAME .*'); } >> $PWD/out.ps.$node"
        ssh "$node" "pkill -STOP -u $LOGNAME -f -x '^$MPI_EXECUTABLE_NAME .*'"
        ssh "$node" "for p in \$(pgrep -u $LOGNAME -f -x '^$MPI_EXECUTABLE_NAME .*'); do { date; INTELGT_AUTO_ATTACH_DISABLE=1 gdb-oneapi -batch -ex 'thread apply all bt' -p \$p; } >> $PWD/out.gdb.$node.\$p 2>&1 & done; wait" &
done
wait

echo "Killing job"
qdel `cat JOBID`

# cat <<EOF
# ## Run the following to continue the processes:
# for n in \$(cat "$1");do
#         ssh "\$n" "pkill -CONT -u $LOGNAME -f -x '^$MPI_EXECUTABLE_NAME .*'"
# done
# EOF

