# Whenever this version string changes, the application is configured
# and rebuilt from scratch
VERSION = 2015-11-27

CPP = cpp
FPP = cpp
CC  = gcc
CXX = g++
F77 = gfortran
F90 = gfortran

FPPFLAGS = -traditional

CPPFLAGS =
FPPFLAGS =
CFLAGS   = -g -std=gnu99
CXXFLAGS = -g -std=gnu++11
F77FLAGS = -g -fcray-pointer -m128bit-long-double -ffixed-line-length-none -fno-range-check
F90FLAGS = -g -fcray-pointer -m128bit-long-double -ffixed-line-length-none -fno-range-check

LDFLAGS = -rdynamic

DEBUG           = no
CPP_DEBUG_FLAGS = -DCARPET_DEBUG -DHRSCC_DEBUG -DTHC_DEBUG -DCPPUTILS_DEBUG
FPP_DEBUG_FLAGS = -DCARPET_DEBUG -DHRSCC_DEBUG -DTHC_DEBUG -DCPPUTILS_DEBUG
C_DEBUG_FLAGS   = -O0
CXX_DEBUG_FLAGS = -O0
F77_DEBUG_FLAGS = -O0
F90_DEBUG_FLAGS = -O0 

OPTIMISE           = yes
CPP_OPTIMISE_FLAGS =
FPP_OPTIMISE_FLAGS =
C_OPTIMISE_FLAGS   = -O2
CXX_OPTIMISE_FLAGS = -O2
F77_OPTIMISE_FLAGS = -O2
F90_OPTIMISE_FLAGS = -O2

PROFILE           = no
CPP_PROFILE_FLAGS =
FPP_PROFILE_FLAGS =
C_PROFILE_FLAGS   = -pg
CXX_PROFILE_FLAGS = -pg
F77_PROFILE_FLAGS = -pg
F90_PROFILE_FLAGS = -pg

OPENMP           = yes
CPP_OPENMP_FLAGS = -fopenmp
FPP_OPENMP_FLAGS = -D_OPENMP
C_OPENMP_FLAGS   = -fopenmp
CXX_OPENMP_FLAGS = -fopenmp
F77_OPENMP_FLAGS = -fopenmp
F90_OPENMP_FLAGS = -fopenmp

WARN           = yes
CPP_WARN_FLAGS = -Wall
FPP_WARN_FLAGS = -Wall
C_WARN_FLAGS   = -Wall
CXX_WARN_FLAGS = -Wall
F77_WARN_FLAGS = -Wall
F90_WARN_FLAGS = -Wall

PTHREADS = yes
