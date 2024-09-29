module purge
module load cpe/23.12
source /opt/cray/pe/cpe/23.12/restore_lmod_system_defaults.sh
module load PrgEnv-gnu
module load cudatoolkit/12.2
module load craype-accel-nvidia80
module load craype-x86-milan
module load xpmem
module load gpu/1.0
