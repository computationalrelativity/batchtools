module load gcc
module load mkl
module load phdf5
module load gsl
#module load mvapich2-x

gsl_path=${TACC_GSL_DIR}
phdf5_path=${TACC_HDF5_DIR}
fftw_path=${TACC_FFTW3_DIR}
lorene_path=${HOME_LORENE}
mkl_include="${MKLROOT}/include"
mkl_lib="${MKLROOT}/lib/intel64"

if true
then

python3 configure.py \
  --prob=gr_mhd_Lorene_scalar_bns2 \
	--flux=llftaudyn --eos=eostaudyn_ps --eospolicy=eos_compose --errorpolicy=reset_floor \
	--coord=gr_dynamical -vertex -gbfz -tracker_extrema -z_wext \
  --nghost=4 --ncghost=4 --nrad=10 --nscalars=1 \
  -mpi -omp -ej \
	-gsl --gsl_path=${gsl_path} \
	-fft --fftw_path=${fftw_path} \
  -hdf5 -h5double --hdf5_path=${phdf5_path} \
  --lorene_path=${lorene_path} \
  --include ${mkl_include} --lib_path ${mkl_lib} \
  --lib mkl_intel_lp64 --lib mkl_core --lib mkl_gnu_thread --lib pthread

fi

make clean
make -j 3
