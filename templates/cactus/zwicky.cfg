# Whenever this version string changes, the application is configured
# and rebuilt from scratch
VERSION = zwicky-openmpi-intel12-2013-07-10

CPP = cpp
FPP = cpp
CC  = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/bin/intel64/icc
CXX = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/bin/intel64/icpc
F77 = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/bin/intel64/ifort
F90 = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/bin/intel64/ifort

CPPFLAGS = -DCCTK_DISABLE_OMP_COLLAPSE
FPPFLAGS = -DCCTK_DISABLE_OMP_COLLAPSE -traditional
# no -msse3
CFLAGS   =  -g -traceback -debug all  -align -std=c99 -ansi_alias -align -U__STRICT_ANSI__
CXXFLAGS =  -g -traceback -debug all  -align -restrict -D__builtin_signbit=::signbit -D_intel_fast_memcpy=memcpy -D_intel_fast_memset=memset
F77FLAGS =  -g -traceback -debug all  -align -pad
F90FLAGS =  -g -traceback -debug all  -align -pad

LDFLAGS = -rdynamic
LIBDIRS = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/compiler/lib/intel64

C_LINE_DIRECTIVES = yes
F_LINE_DIRECTIVES = yes

VECTORISE                  = yes
VECTORISE_ALIGNED_ARRAYS   = no
VECTORISE_INLINE           = no

# -check-uninit fails for asm output operands
DEBUG           = no
CPP_DEBUG_FLAGS = -DCARPET_DEBUG -DFEENABLEEXCEPT
FPP_DEBUG_FLAGS = -DCARPET_DEBUG -DFEENABLEEXCEPT
C_DEBUG_FLAGS   = -O0 # -check-uninit
CXX_DEBUG_FLAGS = -O0 # -check-uninit
F77_DEBUG_FLAGS = -O0 -check bounds -check format # -check all
F90_DEBUG_FLAGS = -O0 -check bounds -check format # -check all

# On Abe, the options -O3, -xT, and -ip lead to segmentation faults
# near MPI calls
# With Intel 9, using -ip prevents debug information for local variables
# With Intel 9, using -O3 leads to very long compile times (> 45 minutes)
OPTIMISE           = yes
CPP_OPTIMISE_FLAGS = #-DCARPET_OPTIMISE -DNDEBUG
FPP_OPTIMISE_FLAGS = #-DCARPET_OPTIMISE -DNDEBUG
C_OPTIMISE_FLAGS   = -O2 -msse4.1
CXX_OPTIMISE_FLAGS = -O2 -msse4.1
F77_OPTIMISE_FLAGS = -O2 -msse4.1
F90_OPTIMISE_FLAGS = -O2 -msse4.1

PROFILE           = no
CPP_PROFILE_FLAGS =
FPP_PROFILE_FLAGS =
C_PROFILE_FLAGS   = -pg
CXX_PROFILE_FLAGS = -pg
F77_PROFILE_FLAGS = -pg
F90_PROFILE_FLAGS = -pg

OPENMP           = yes
CPP_OPENMP_FLAGS = -openmp
FPP_OPENMP_FLAGS = -D_OPENMP
C_OPENMP_FLAGS   = -openmp
CXX_OPENMP_FLAGS = -openmp
F77_OPENMP_FLAGS = -openmp
F90_OPENMP_FLAGS = -openmp

WARN           = yes
CPP_WARN_FLAGS = 
FPP_WARN_FLAGS = 
C_WARN_FLAGS   = 
CXX_WARN_FLAGS = 
F77_WARN_FLAGS = 
F90_WARN_FLAGS = 

BLAS_DIR  = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/mkl/lib/intel64
BLAS_LIBS = iomp5   pthread

BOOST_DIR = /home/david_e/local/boost/1.55.0
HDF5_DIR = /home/david_e/local/hdf5/1.8.11-intel12-1.5.339
HWLOC_DIR = /home/david_e/local/hwloc/1.7.2
FFTW3_DIR = /usr/local/fftw3-3.2.2
GSL_DIR = /usr/local/gsl-1.15-gcc


LAPACK      = yes
LAPACK_DIR  = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/mkl/lib/intel64
LAPACK_LIBS = mkl_solver_lp64 mkl_intel_lp64 mkl_intel_thread mkl_core

MPI_DIR      = /usr/local/openmpi-1.4.3-gcc-dynamic
MPI_INC_DIRS = /usr/local/openmpi-1.4.3-gcc-dynamic/include
MPI_LIB_DIRS = /usr/local/openmpi-1.4.3-gcc-dynamic/lib /usr/lib64 /opt/torque/lib
MPI_LIBS     = mpi open-rte open-pal numa rdmacm ibverbs torque util

PETSC_DIR                   = BUILD
PETSC_BLAS_EXTRA_LIB_DIRS   = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/mkl/lib/intel64 /usr/lib64
PETSC_BLAS_EXTRA_LIBS       = mkl_solver_lp64 mkl_intel_lp64 mkl_intel_thread mkl_core   iopm5 guide   pthread
PETSC_LAPACK_EXTRA_LIB_DIRS = /usr/local/Intel-12/composer_xe_2011_sp1.11.339/mkl/lib/intel64 /usr/lib64
PETSC_LAPACK_EXTRA_LIBS     = iomp5 guide   pthread
PETSC_MPI_EXTRA_LIB_DIRS    = /usr/lib64
PETSC_MPI_EXTRA_LIBS        = pthread

PTHREADS_DIR = NO_BUILD
