python3 configure.py \
    --cxx=gcc -rpath \
    -omp -mpi --cflag=-fopenmp \
    -z \
    -hdf5 --hdf5_path=${HDF5_DIR} \
    -gsl --gsl_path="`gsl-config --prefix`" \
    --two_punctures_path=$HOME/Athena/gcc/TwoPuncturesC \
    --prob=z4c_two_punctures \
    $@
