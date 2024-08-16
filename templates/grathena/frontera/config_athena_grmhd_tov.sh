python3 configure.py \
    --cxx=icpc \
    -g -f -b -z \
    --coord=gr_dynamical \
    --eos=eostaudyn_ps --eospolicy=idealgas --errorpolicy=reset_floor \
    --flux=llftaudyn \
    -vertex \
    -gsl --gsl_path=$(gsl-config --prefix) \
    -omp -mpi \
    --ninterp=2 --nghost=4 --ncghost=4 \
    -hdf5 -h5double --hdf5_path=${TACC_HDF5_DIR} \
    --prob=gr_mhd_tov \
    $@
