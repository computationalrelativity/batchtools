module purge
module load system/site_names system/ws/1.4.0 system/wrappers/1.0
module load hlrs-software-stack/.9  gcc/10.2.0  mpt/2.26
module load hdf5/1.10.5 gsl/2.6
module load python/3.10

export DIR_GSL=${GSL_HOME}
export DIR_HDF5=${HDF5_HOME}
