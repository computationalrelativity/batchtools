# loewe

# Whenever this version string changes, the application is configured
# and rebuilt from scratch
VERSION = 2014-10-20

CPP = cpp
FPP = cpp
CC  = /cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/bin/intel64/icc
CXX = /cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/bin/intel64/icpc
F77 = /cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/bin/intel64/ifort
F90 = /cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/bin/intel64/ifort


CPPFLAGS = -DCCTK_DISABLE_OMP_COLLAPSE
FPPFLAGS = -DCCTK_DISABLE_OMP_COLLAPSE -traditional
CFLAGS   = -g -debug all -traceback -msse3 -align -std=c99 -ansi_alias -U__STRICT_ANSI__ 
CXXFLAGS = -g -debug all -traceback -msse3 -align -std=c++0x -restrict -D__builtin_fmaxf=fmaxf -D__builtin_fmaxl=fmaxl -D__builtin_fminf=fminf -D__builtin_fminl=fminl -D__builtin_signbit=::signbit
F77FLAGS = -g -debug all -safe_cray_ptr -traceback -msse3 -align -pad 
F90FLAGS = -g -debug all -safe_cray_ptr -traceback -msse3 -align -pad 

#CUCC                = /cm/shared/apps/intel/Compiler/11.1/046/bin/intel64/icpc
#CUCCFLAGS           = -x c++ -g -debug all -traceback -align -restrict -openmp
#CUCC_DEBUG_FLAGS    = -DCARPET_DEBUG -O0
#CUCC_OPTIMISE_FLAGS = -O2 -xSSSE3
#CUCC_WARN_FLAGS     =

#CU_DEPEND = /cm/shared/apps/intel/Compiler/11.1/046/bin/intel64/icpc -M -x c++ -openmp

C_LINE_DIRECTIVES = yes
F_LINE_DIRECTIVES = yes

# module show intel/compiler/64/14.0.3

LDFLAGS = -Wl,--export-dynamic -Wl,-rpath,/cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/mkl/lib/intel64  -Wl,-rpath,/cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/ipp/../compiler/lib/intel64  -Wl,-rpath,/cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/ipp/lib/intel64 -Wl,-rpath,/cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/compiler/lib/intel64 -Wl,-rpath,/cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/tbb/lib/intel64/gcc4.4

BEGIN_WHOLE_ARCHIVE_FLAGS = -Wl,--whole-archive
END_WHOLE_ARCHIVE_FLAGS   = -Wl,--no-whole-archive


#LIBDIRS = /cm/shared/apps/szip/2.1/lib/

VECTORISE                = yes
VECTORISE_ALIGNED_ARRAYS = no
VECTORISE_INLINE         = no
VECTORISE_STREAMING_STORES = no

DEBUG           = no
CPP_DEBUG_FLAGS = -DCARPET_DEBUG
FPP_DEBUG_FLAGS = -DCARPET_DEBUG
C_DEBUG_FLAGS   = -O0
CXX_DEBUG_FLAGS = -O0
F77_DEBUG_FLAGS = -O0 -check bounds -check format
F90_DEBUG_FLAGS = -O0 -check bounds -check format

OPTIMISE           = yes
CPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
FPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
C_OPTIMISE_FLAGS   = -O3 -ip
CXX_OPTIMISE_FLAGS = -O3 -ip
F77_OPTIMISE_FLAGS = -O3 
F90_OPTIMISE_FLAGS = -O3 -ip

PROFILE           = no
CPP_PROFILE_FLAGS =
FPP_PROFILE_FLAGS =
C_PROFILE_FLAGS   = -pg
CXX_PROFILE_FLAGS = -pg
F77_PROFILE_FLAGS = -pg
F90_PROFILE_FLAGS = -pg

OPENMP           = yes
CPP_OPENMP_FLAGS = -D_OPENMP
FPP_OPENMP_FLAGS = -D_OPENMP
C_OPENMP_FLAGS   = -openmp
CXX_OPENMP_FLAGS = -openmp
F77_OPENMP_FLAGS = -openmp
F90_OPENMP_FLAGS = -openmp

#WARN           = yes
#CPP_WARN_FLAGS = -Wall
#FPP_WARN_FLAGS = -Wall
#C_WARN_FLAGS   = -Wall -diag-enable warn -par-report3 -vec-report5
#CXX_WARN_FLAGS = -Wall -diag-enable warn -par-report3 -vec-report5
#F77_WARN_FLAGS = -warn all -diag-enable warn -warn nointerfaces -par-report3 -vec-report5
#F90_WARN_FLAGS = -warn all -diag-enable warn -warn nointerfaces -par-report3 -vec-report5

# Append "-warn nointerfaces" to F77_WARN_FLAGS and F90_WARN_FLAGS below if you
# plan to to use this configuration file for a release earlier than Noether
# ET_2013_11. Otherwise Lorene compilation fails.
WARN           = yes
CPP_WARN_FLAGS = -Wall
FPP_WARN_FLAGS = -Wall
C_WARN_FLAGS   = -Wall 
CXX_WARN_FLAGS = -Wall 
F77_WARN_FLAGS = -warn all -warn nointerfaces
F90_WARN_FLAGS = -warn all -warn nointerfaces

BLAS_DIR  = /cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/mkl/lib/intel64
BLAS_LIBS = -Wl,--start-group mkl_intel_lp64 mkl_sequential mkl_core -Wl,--end-group   iomp5   pthread

LAPACK_DIR  = /cm/shared/apps/intel/composer_xe/2013_sp1.3.174/composer_xe_2013_sp1.3.174/mkl/lib/intel64
LAPACK_LIBS = -Wl,--start-group mkl_intel_lp64 mkl_sequential mkl_core -Wl,--end-group

#GSL_DIR     = 
HDF5_DIR    = /cm/shared/apps/hdf5/intel-14.0.3/1.8.13
# NOTE: We should patch ExternalLibraries/HDF5 such that LIBSZ_DIR and LIBZ_DIR
# reflect the library installation directory and not the path to the library.
# They probably need to be renamed to SZLIB_LIB_DIRS and ZLIB_LIB_DIRS
# Used when linking:
LIBSZ_DIR   = /cm/shared/apps/szip/2.1/lib
LIBZ_DIR    = /cm/shared/apps/zlib/1.2.8/lib
# Used when building:
ZLIB_DIR    = /cm/shared/apps/zlib/1.2.8

HWLOC_DIR   = /cm/shared/apps/hwloc/1.9

FFTW3_DIR   = /cm/shared/apps/fftw/intel/64/3.2.2

BOOST_DIR   = /cm/shared/apps/boost/1.52.0
#BOOST_DIR   = BUILD
#BOOST_LIBS  = boost_system boost_filesystem

# module show mpi/mvapich2/intel-14.0.3/2.0
#MPI_DIR      = NO_BUILD
MPI_DIR      = /cm/shared/apps/mvapich2/intel-14.0.3/2.0
MPI_INC_DIRS = /cm/shared/apps/slurm/current/include /cm/shared/apps/mvapich2/intel-14.0.3/2.0/include /cm/shared/apps/mvapich2/intel-14.0.3/2.0/include
MPI_LIB_DIRS = /cm/shared/apps/mvapich2/intel-14.0.3/2.0/lib 
MPI_LIBS     = mpich opa mpl 


#PAPI_DIR    = 

PTHREADS = yes


