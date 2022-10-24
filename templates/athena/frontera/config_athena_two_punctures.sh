python3 configure.py \
    --cxx=icpc -rpath \
    -omp -mpi \
    -z \
    -hdf5 --hdf5_path=${TACC_HDF5_DIR} \
    -gsl --gsl_path=$(gsl-config --prefix) \
    --two_punctures_path=$(cd ../TwoPuncturesC && pwd) \
    --prob=z4c_two_punctures \
    $@
