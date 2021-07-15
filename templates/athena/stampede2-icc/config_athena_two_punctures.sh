python3 configure.py \
    --cxx=icpc-phi -rpath \
    -omp -mpi \
    -z \
    -hdf5 --hdf5_path=${TACC_HDF5_DIR} \
    -gsl --gsl_path=/work2/03043/dradice/stampede2/spack/views/icc \
    --two_punctures_path=/work2/03043/dradice/stampede2/local/icc/TwoPuncturesC \
    --prob=z4c_two_punctures \
    $@
