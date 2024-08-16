module purge
module load system/site_names   
module load system/ws/8b99237 
module load system/wrappers/1.0   
module load hlrs-software-stack/current   
module load gcc/10.2.0   
module load mpt/2.26   
module load fftw/3.3.8   
module load boost/1.70.0   
module load gsl/2.6  
module load hdf5/1.10.5  
module load mkl/19.1.3

export DIR_GSL=${GSL_HOME}
export DIR_HDF5=${HDF5_HOME}
