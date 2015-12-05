VERSION = 2015-11-19

CPP = /opt/local/bin/cpp
FPP = /opt/local/bin/cpp
CC  = /opt/local/bin/gcc
CXX = /opt/local/bin/g++
F77 = /opt/local/bin/gfortran
F90 = /opt/local/bin/gfortran

CPPFLAGS =
FPPFLAGS = -traditional
CFLAGS   = -std=c99
CXXFLAGS =
F77FLAGS = -m128bit-long-double -fcray-pointer -ffixed-line-length-none -fno-range-check
F90FLAGS = -m128bit-long-double -fcray-pointer -ffixed-line-length-none -fno-range-check

LDFLAGS = -framework Accelerate -lgfortran

VECTORISE                = yes
VECTORISE_ALIGNED_ARRAYS = no
VECTORISE_INLINE         = no
VECTORISE_STREAMING_STORES = no

C_LINE_DIRECTIVES = yes
F_LINE_DIRECTIVES = yes

DEBUG           = no
CPP_DEBUG_FLAGS = -DCARPET_DEBUG -DHRSCC_DEBUG -DTHC_DEBUG
FPP_DEBUG_FLAGS = -DCARPET_DEBUG -DHRSCC_DEBUG -DTHC_DEBUG
C_DEBUG_FLAGS   = -O0 -ggdb
CXX_DEBUG_FLAGS = -O0 -ggdb
F77_DEBUG_FLAGS = -O0 -ggdb
F90_DEBUG_FLAGS = -O0 -ggdb

OPTIMISE           = yes
CPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
FPP_OPTIMISE_FLAGS = # -DCARPET_OPTIMISE -DNDEBUG
C_OPTIMISE_FLAGS   = -O2
CXX_OPTIMISE_FLAGS = -O2
F77_OPTIMISE_FLAGS = -O2
F90_OPTIMISE_FLAGS = -O2

PROFILE           = no
CPP_PROFILE_FLAGS =
FPP_PROFILE_FLAGS =
C_PROFILE_FLAGS   =
CXX_PROFILE_FLAGS =
F77_PROFILE_FLAGS =
F90_PROFILE_FLAGS =

OPENMP           = yes
CPP_OPENMP_FLAGS = -openmp
FPP_OPENMP_FLAGS = -D_OPENMP
C_OPENMP_FLAGS   = -openmp
CXX_OPENMP_FLAGS = -openmp
F77_OPENMP_FLAGS = -openmp
F90_OPENMP_FLAGS = -openmp

WARN           = yes
CPP_WARN_FLAGS = -Wall -Wno-unknown-pragmas
FPP_WARN_FLAGS = -Wall
C_WARN_FLAGS   = -Wall -Wno-unknown-pragmas
CXX_WARN_FLAGS = -Wall -Wno-unknown-pragmas
F77_WARN_FLAGS = -Wall
F90_WARN_FLAGS = -Wall

MPI_DIR = /usr/local/openmpi/1.8.6

BLAS_DIR  = /System/Library/Frameworks/vecLib.framework
BLAS_LIBS =

BOOST_DIR = /usr/local/boost/1.57.0

FFTW_DIR  = /opt/local
FFTW_LIBS = drfftw dfftw m
FFTW3_DIR = /opt/local

GSL_DIR = /opt/local

HDF5_DIR  = /usr/local/hdf5/1.8.14
LIBSZ_DIR = /opt/local
LIBJPEG_DIR = /opt/local

HWLOC_DIR = /opt/local

LAPACK      = yes
LAPACK_DIR  = /System/Library/Frameworks/vecLib.framework
LAPACK_LIBS =

#PETSC_DIR  = /usr/local/petsc/3.5.2
#PETSC_ARCH = arch-darwin-c-debug
#PETSC_ARCH_LIBS = petsc HYPRE

PTHREADS = yes

SSL_DIR = /opt/local
ZLIB_DIR = /opt/local

X_LIB_DIR = /usr/X11R6/lib
