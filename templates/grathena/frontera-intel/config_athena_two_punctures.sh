python3 configure.py \
    -rpath \
    -omp -mpi \
    -z -cce --nghost=4 \
    -hdf5 --hdf5_path=/home1/apps/intel23/impi21_9/phdf5/1.14.0 \
    -gsl --gsl_path=/home1/apps/intel23/gsl/2.7.1/ \
    --two_punctures_path=$(cd ../TwoPuncturesC && pwd) \
    --prob=z4c_two_punctures \
    $@
