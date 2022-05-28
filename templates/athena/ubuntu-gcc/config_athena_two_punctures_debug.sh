# Required packages
# libhdf5-mpi-dev, libgsl-dev

python3 configure.py \
    -rpath \
    -z \
    -hdf5 --include /usr/include/hdf5/serial --lib_path /usr/lib/x86_64-linux-gnu/hdf5/serial \
    -gsl  \
    --two_punctures_path=$PWD/../TwoPuncturesC \
    --prob=z4c_two_punctures \
    -debug \
    $@
