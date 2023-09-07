module purge
module load tools/python/3.7
module load libs/hdf5/1.10.2-intel-2018
module load compiler/intel/2018-Update3
module load tools/cmake/3.15.3
module load libs/gsl/2.4-intel-2018
module load mpi/intel/2018-Update3

export DIR_GSL=/cluster/spack/opt/spack/linux-centos7-x86_64/intel-18.0.1/gsl-2.4-bp5w6qe4dksrqnubftxxjcyti7jurqkm/
export DIR_HDF5=/cluster/spack/opt/spack/linux-centos7-broadwell/intel-18.0.1/hdf5-1.10.2-wxf7zzpgwurhiqa3t7s7sh2ijsh4pvou/
export MPI_COMMAND=/cluster/intel/compilers_and_libraries_2018.3.222/linux/mpi/bin64/mpiicpc
