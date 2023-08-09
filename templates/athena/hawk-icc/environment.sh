module purge
module load system/site_names system/ws/1.4.0 system/wrappers/1.0
module load hlrs-software-stack/previous hlrs-software-stack/.4  intel/19.1.0  mpt/2.23
module load hdf5/1.10.5
module load gsl

module load python/3.8

export DIR_GSL=${GSL_ROOT}
export DIR_HDF5=${HDF5_ROOT}
