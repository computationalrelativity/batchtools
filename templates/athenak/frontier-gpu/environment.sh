module restore
module load PrgEnv-cray
module load craype-accel-amd-gfx90a
module load cmake
module load cray-python
module load rocm/5.7.1
module load cray-mpich/8.1.28
module load cce/17.0.0

export MPICH_GPU_SUPPORT_ENABLED=1
