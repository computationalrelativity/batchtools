# Whenever this version string changes, the application is configured
# and rebuilt from scratch
VERSION = fermi-2015-02-26

# last-tested-on: fermi
# last-tested-by: knarf
# NOTE: not working yet

CROSS_COMPILE = yes

HOST_MACHINE       = powerpc64-unknown-linux-gnu
ENDIAN             = BIG
NULL_DEVICE        = /dev/null
SIZEOF_SHORT_INT   =  2
SIZEOF_INT         =  4
SIZEOF_LONG_INT    =  4
SIZEOF_LONG_LONG   =  8
SIZEOF_FLOAT       =  4
SIZEOF_DOUBLE      =  8
SIZEOF_LONG_DOUBLE = 16
SIZEOF_POINTER     =  4

CPP = cpp
FPP = cpp
CC  = mpicc
CXX = mpicxx
F77 = mpif77 
F90 = mpif90 

CPPFLAGS = -g -DH5_USE_18_API
FPPFLAGS = -g -DH5_USE_18_API -traditional
CFLAGS   = -g -DH5_USE_18_API -std=gnu99
CXXFLAGS = -g -DH5_USE_18_API
F77FLAGS = -g -DH5_USE_18_API -fcray-pointer -ffixed-line-length-none -funderscoring -fno-range-check
F90FLAGS = -g -DH5_USE_18_API -fcray-pointer -ffixed-line-length-none -funderscoring -fno-range-check

VECTORISE                          = yes
VECTORISE_ALIGNED_ARRAYS           = no
VECTORISE_ALWAYS_USE_ALIGNED_LOADS = yes
VECTORISE_INLINE                   = no

DEBUG = no
CPP_DEBUG_FLAGS = -DCARPET_DEBUG
FPP_DEBUG_FLAGS = -DCARPET_DEBUG
C_DEBUG_FLAGS   = -O0
CXX_DEBUG_FLAGS = -O0
F77_DEBUG_FLAGS = -O0
F90_DEBUG_FLAGS = -O0

OPTIMISE = yes
CPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
FPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
C_OPTIMISE_FLAGS   = -O2
CXX_OPTIMISE_FLAGS = -O2
F77_OPTIMISE_FLAGS = -O2
F90_OPTIMISE_FLAGS = -O2

PROFILE = no
CPP_PROFILE_FLAGS =
FPP_PROFILE_FLAGS =
C_PROFILE_FLAGS   = -pg
CXX_PROFILE_FLAGS = -pg
F77_PROFILE_FLAGS = -pg
F90_PROFILE_FLAGS = -pg

OPENMP           = yes
CPP_OPENMP_FLAGS = -fopenmp
FPP_OPENMP_FLAGS = -fopenmp
C_OPENMP_FLAGS   = -fopenmp
CXX_OPENMP_FLAGS = -fopenmp
F77_OPENMP_FLAGS = -fopenmp
F90_OPENMP_FLAGS = -fopenmp

WARN           = yes
CPP_WARN_FLAGS =
FPP_WARN_FLAGS =
C_WARN_FLAGS   =
CXX_WARN_FLAGS =
F77_WARN_FLAGS =
F90_WARN_FLAGS =


BOOST_DIR    = /cineca/prod/libraries/boost/1.51.0/bgq-gnu--4.4.6
BLAS_DIR     = BUILD
LAPACK_DIR   = BUILD
LORENE_DIR   = BUILD
HDF5_DIR     = /gpfs/scratch/userinternal/mcestari/build/hdf5-1.8.9/INSTALL
HDF5_ENABLE_CXX = no
HDF5_ENABLE_FORTRAN = yes
HWLOC_DIR    = BUILD
MPI_DIR      = NO_BUILD 
LIBSZ_DIR    = BUILD 
GSL_DIR      = BUILD 
FFTW3_DIR    = BUILD
ZLIB_DIR     = /cineca/prod/libraries/zlib/1.2.7/bgq-gnu--4.4.6

LIBDIRS = /cineca/prod/libraries/szip/2.1/bgq-gnu--4.4.6/lib

PTHREADS_DIR = NO_BUILD
