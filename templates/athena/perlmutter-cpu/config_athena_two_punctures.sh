python3 configure.py \
    --cxx=cray -rpath \
    -omp -mpi --cflag=-fopenmp \
    -z \
    -hdf5 --hdf5_path=${CRAY_HDF5_PARALLEL_PREFIX} \
    -gsl --gsl_path=${GSL_DIR} \
    --two_punctures_path=/global/homes/d/dradice/Athena/perlmutter/TwoPuncturesC \
    --prob=z4c_two_punctures \
    $@
