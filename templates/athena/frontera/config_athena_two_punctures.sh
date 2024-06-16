python3 configure.py \
    -rpath \
    -omp -mpi \
    -z -cce --nghost=4 \
    -hdf5 --hdf5_path=${TACC_HDF5_DIR} \
    -gsl --gsl_path=$(gsl-config --prefix) \
    --two_punctures_path=$(cd ../TwoPuncturesC && pwd) \
    --prob=z4c_two_punctures \
    $@
