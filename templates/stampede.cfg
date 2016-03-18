# Whenever this version string changes, the application is configured
# and rebuilt from scratch
VERSION = stampede-2016-03-18

CPP = cpp
FPP = cpp
CC  = icc
CXX = icpc
F77 = ifort
F90 = ifort

CPPFLAGS = -g -DMPICH_IGNORE_CXX_SEEK
FPPFLAGS = -g -traditional
CFLAGS   = -g -traceback -debug all -xhost -align -std=gnu99
CXXFLAGS = -g -traceback -debug all -xhost -align -std=gnu++11
F77FLAGS = -g -traceback -debug all -xhost -align -pad -safe-cray-ptr
F90FLAGS = -g -traceback -debug all -xhost -align -pad -safe-cray-ptr

LDFLAGS = -rdynamic -L/opt/ofed/lib64

C_LINE_DIRECTIVES = yes
F_LINE_DIRECTIVES = yes

VECTORISE                = yes
VECTORISE_ALIGNED_ARRAYS = no
VECTORISE_INLINE         = no

DEBUG = no
CPP_DEBUG_FLAGS = -DCARPET_DEBUG
FPP_DEBUG_FLAGS = -DCARPET_DEBUG
C_DEBUG_FLAGS   = -O0
CXX_DEBUG_FLAGS = -O0
F77_DEBUG_FLAGS = -O0 -check bounds -check format
F90_DEBUG_FLAGS = -O0 -check bounds -check format

OPTIMISE = yes
CPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
FPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
C_OPTIMISE_FLAGS   = -Ofast
CXX_OPTIMISE_FLAGS = -Ofast
F77_OPTIMISE_FLAGS = -Ofast
F90_OPTIMISE_FLAGS = -Ofast

CPP_NO_OPTIMISE_FLAGS  = 
FPP_NO_OPTIMISE_FLAGS  = 
C_NO_OPTIMISE_FLAGS    = -O0
CXX_NO_OPTIMISE_FLAGS  = -O0
CUCC_NO_OPTIMISE_FLAGS =
F77_NO_OPTIMISE_FLAGS  = -O0
F90_NO_OPTIMISE_FLAGS  = -O0

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



BLAS_DIR  = NO_BUILD
BLAS_LIBS = -mkl

BOOST_DIR = /home1/03043/dradice/work/local/boost/1.55.0
#BOOST_DIR = BUILD

GSL_DIR = BUILD

# This lacks libhdf5_hl_cpp:
HDF5_DIR = /opt/apps/intel15/hdf5/1.8.16/x86_64

HWLOC_DIR = NO_BUILD
HWLOC_LIBS =

LAPACK_DIR  = NO_BUILD
LAPACK_LIBS = -mkl

MPI_DIR  = /work/03043/dradice/OpenMPI/install-OMPI-1.10-i15
#MPI_DIR  = /work/00945/rhaas/software/openmpi-1.8
MPI_LIBS = mpi open-rte open-pal dl rt ibverbs scif util

OPENBLAS_DIR  = NO_BUILD
OPENBLAS_LIBS = -mkl

# needs latest compiler (13.1.1.163)
OPENCL_DIR      = /opt/apps/intel/opencl
OPENCL_LIB_DIRS = /opt/apps/intel/opencl/lib64
OPENCL_LIBS     = -lOpenCL

PAPI_DIR = /opt/apps/papi/5.3.0/x86_64

PTHREADS_DIR = NO_BUILD
