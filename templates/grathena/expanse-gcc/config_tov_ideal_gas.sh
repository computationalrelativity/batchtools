python3 configure.py \
    -gfz \
    --coord=gr_dynamical \
    --flux=llftaudyn \
    -vertex \
    --nghost=4 \
    --ncghost=4 \
    --eos=eostaudyn_ps \
    --eospolicy=idealgas \
    --errorpolicy=reset_floor \
    --prob=gr_tov \
    -gsl \
    --gsl_path=${GSLHOME} \
    -mpi \
    --ccmd=mpicxx \
    -hdf5 \
    -h5double \
    --hdf5_path=${HDF5HOME} \
    $@
