module purge
module load tools/python/3.7
module load libs/gsl/2.4-intel-2018
module load mpi/openmpi/3.1.2-gcc-7.3.0
module load tools/cmake/3.15.3
module load compiler/gcc/7.3.0
module load libs/hdf5/1.10.2-gcc-7.3.0

export DIR_GSL=/cluster/spack/opt/spack/linux-centos7-x86_64/intel-18.0.1/gsl-2.4-bp5w6qe4dksrqnubftxxjcyti7jurq
export DIR_HDF5=/cluster/spack/opt/spack/linux-centos7-x86_64/gcc-7.3.0/hdf5-1.10.2-susxcpuzghnsbpn53hizb2a7zucj
export MPI_COMMAND=/cluster/spack/opt/spack/linux-centos7-x86_64/gcc-7.3.0/openmpi-3.1.2-tf3d7rwc76ynvf4mss6sncp

