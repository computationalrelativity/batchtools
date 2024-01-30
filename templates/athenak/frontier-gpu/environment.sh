module restore
module load PrgEnv-cray
module load craype-accel-amd-gfx90a
module load cmake
module load cray-python
module load amd-mixed/5.3.0
module load cray-mpich/8.1.23
module load cce/15.0.1

export MPICH_GPU_SUPPORT_ENABLED=1
