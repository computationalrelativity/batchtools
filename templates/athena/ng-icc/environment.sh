module purge
module use /dss/dsshome1/0D/di52gal3/spack/modules/x86_avx512/linux-sles15-skylake_avx512/
module load spack/22.2.1
module load intel-oneapi-compilers/2021.4.0
module load intel-oneapi-mpi/2021.7.0-intel
module load gsl hdf5/1.10.7-intel21-impi
module load anaconda3/2021.05

export DIR_GSL=${GSL_BASE}
export DIR_HDF5=${HDF5_BASE}
