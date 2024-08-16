python3 configure.py \
    --cxx=icpc-phi -rpath \
    -omp -mpi \
    -z \
    -hdf5 --hdf5_path=${CRAY_HDF5_PARALLEL_PREFIX} \
    -gsl --gsl_path=${GSL_DIR} \
    --two_punctures_path=/global/homes/d/dradice/Athena/TwoPuncturesC \
    --prob=z4c_two_punctures \
    $@
