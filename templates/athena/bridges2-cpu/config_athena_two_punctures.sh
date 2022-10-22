python3 configure.py \
    -z --prob=z4c_two_punctures \
    -omp -mpi \
    --nghost 4 \
    -rpath \
    -gsl --gsl_path=/jet/home/dradice/local/spack/athena \
    -hdf5 --hdf5_path=/jet/packages/spack/opt/spack/linux-centos8-zen2/gcc-10.2.0/hdf5-1.10.7-3trwysszw4lw3tazizx2if2mg6567cro/ \
    --two_punctures_path=../TwoPuncturesC
