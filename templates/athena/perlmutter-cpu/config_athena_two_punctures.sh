python3 configure.py \
    --cxx=g++ -rpath \
    -omp -mpi --cflag=-fopenmp \
    -z \
    -hdf5 --hdf5_path=${CRAY_HDF5_PARALLEL_PREFIX} \
    -gsl --gsl_path=/usr \
    --two_punctures_path=/$HOME/Athena/TwoPuncturesC \
    --prob=z4c_two_punctures \
    $@
