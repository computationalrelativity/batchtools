module purge
module use /dss/dsshome1/0D/di52gal3/spack/modules/x86_avx512/linux-sles15-skylake_avx512/
module load spack/22.2.1
module load gcc/11.2.0 openmpi/4.1.2-gcc11 hdf5/1.10.7-gcc11-ompi-lh2 gsl/2.7-gcc11
module load anaconda3/2021.05

export DIR_GSL=${GSL_BASE}
export DIR_HDF5=${HDF5_BASE}
