# and rebuilt from scratch
VERSION = bluewaters-gnu-2016-01-26

CPP  = cpp
FPP  = cpp
CC   = cc
CXX  = CC
CUCC = nvcc
F77  = ftn
F90  = ftn

# There seems to be an error in the acml module
CPPFLAGS  = -g3 -DDISABLE_AVX
FPPFLAGS  = -g3 -traditional
CFLAGS    = -g3 -m128bit-long-double -std=gnu99 -Wl,-rpath,/opt/acml/5.3.1/gfortran64_fma4/lib -Wl,-rpath,/opt/acml/5.3.1/gfortran64_fma4_mp/lib
CXXFLAGS  = -g3 -m128bit-long-double -std=gnu++11 -Wl,-rpath,/opt/acml/5.3.1/gfortran64_fma4/lib -Wl,-rpath,/opt/acml/5.3.1/gfortran64_fma4_mp/lib
CUCCFLAGS = -g -m64 -arch=sm_30 --ptxas-options=-v
F90FLAGS  = -g3 -m128bit-long-double -fcray-pointer -ffixed-line-length-none -fno-range-check
F77FLAGS  = -g3 -m128bit-long-double -fcray-pointer -ffixed-line-length-none -fno-range-check

#LDFLAGS =

#SYS_INC_DIRS =
#LIBDIRS      =
LIBS         = gfortran   dl

C_LINE_DIRECTIVES = yes
F_LINE_DIRECTIVES = yes

VECTORISE                = yes
VECTORISE_ALIGNED_ARRAYS = no
VECTORISE_INLINE         = yes

DEBUG            = no
CPP_DEBUG_FLAGS  = -DCARPET_DEBUG
FPP_DEBUG_FLAGS  = -DCARPET_DEBUG
C_DEBUG_FLAGS    = -ftrapv -fstack-protector-all -fbounds-check
CXX_DEBUG_FLAGS  = -ftrapv -fstack-protector-all -fbounds-check
CUCC_DEBUG_FLAGS =
F77_DEBUG_FLAGS  = -ftrapv -fstack-protector-all -fcheck=bounds,do,mem,pointer,recursion -finit-character=65 -finit-integer=42424242 -finit-real=nan
F90_DEBUG_FLAGS  = -ftrapv -fstack-protector-all -fcheck=bounds,do,mem,pointer,recursion -finit-character=65 -finit-integer=42424242 -finit-real=nan

OPTIMISE            = yes
CPP_OPTIMISE_FLAGS  = # -DCARPET_OPTIMISE -DNDEBUG
FPP_OPTIMISE_FLAGS  = # -DCARPET_OPTIMISE -DNDEBUG
C_OPTIMISE_FLAGS    = -Ofast -funroll-loops
CXX_OPTIMISE_FLAGS  = -Ofast -funroll-loops
CUCC_OPTIMISE_FLAGS = -O3 -use_fast_math
F90_OPTIMISE_FLAGS  = -Ofast -funroll-loops
F77_OPTIMISE_FLAGS  = -Ofast -funroll-loops

PROFILE           = no
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

WARN            = yes
CPP_WARN_FLAGS  = -Wall
FPP_WARN_FLAGS  = -Wall
C_WARN_FLAGS    = -Wall
CXX_WARN_FLAGS  = -Wall
CUCC_WARN_FLAGS = -Xcompiler -Wall
F90_WARN_FLAGS  = -Wall
F77_WARN_FLAGS  = -Wall



BLAS_DIR  = /opt/acml/5.3.1/gfortran64_fma4_mp/lib
BLAS_LIBS = acml_mp

BOOST_DIR = /sw/xe/boost/1.53.0/sles11.3_gnu4.8.2

# TODO: add CUDA

FFTW3_DIR = /opt/fftw/3.3.4.6/interlagos

GSL_DIR = /sw/xe/gsl/1.15/cnl4.1_gnu4.7.2

HDF5_DIR = /opt/cray/hdf5/1.8.14/GNU/49

HWLOC_DIR        = BUILD
HWLOC_EXTRA_LIBS = numa

LAPACK_DIR  = /opt/acml/5.3.1/gfortran64_fma4_mp/lib
LAPACK_LIBS = acml_mp

MPI_DIR = NONE

OPENBLAS_DIR  = /opt/acml/5.3.1/gfortran64_fma4_mp
OPENBLAS_LIBS = acml_mp

OPENCL_DIR      = /opt/nvidia/cudatoolkit/7.0.28-1.0502.10742.5.1
OPENCL_INC_DIRS = /opt/nvidia/cudatoolkit/7.0.28-1.0502.10742.5.1/include
OPENCL_LIB_DIRS = /opt/nvidia/cudatoolkit/7.0.28-1.0502.10742.5.1lib64
OPENCL_LIBS     = OpenCL

PAPI_DIR      = /opt/cray/papi/5.4.1.3
PAPI_LIB_DIRS = /opt/cray/papi/5.4.1.3/lib64

PETSC_DIR = /opt/cray/petsc/3.6.1.0/real/GNU/49/interlagos

PTHREADS_DIR = NO_BUILD
