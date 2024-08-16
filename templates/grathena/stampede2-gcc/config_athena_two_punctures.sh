python3 configure.py \
    -rpath \
    -omp -mpi \
    -z \
    -hdf5 --hdf5_path=${TACC_HDF5_DIR} \
    -gsl --gsl_path=/work2/03043/dradice/stampede2/spack/views/gcc \
    --two_punctures_path=/work2/03043/dradice/stampede2/local/gcc/TwoPuncturesC \
    --prob=z4c_two_punctures \
    $@
