#!/usr/bin/env bash

CONFIG_HOME=$(cd $(dirname $0); pwd)

for f in ${CONFIG_HOME}/*.patch; do
    patch -p1 < $f
done

cat > local_settings <<EOF
###############################################################
#
#  Edit the following lines according to your implementation.
#
#  The environment variable HOME_LORENE (root directory for the
#   Lorene implementation) must be have been already defined.
#
###############################################################

#===============================#
#           COMPILERS		#
#===============================#

# C++ compiler:
# ------------
CXX 	 = g++

# Options for the C++ compiler to produce the optimized library:
# -------------------------------------------------------------
CXXFLAGS = -O2 -DNDEBUG

# Options for the C++ compiler to produce the library for debugging:
# -----------------------------------------------------------------
CXXFLAGS_G = -O0 -g

# with the option -Weffc++ :
#CXXFLAGS_G = -g -pedantic -Wall -W -Wfloat-equal -Wundef -Wshadow -Wcast-qual \
#  -Wcast-align -Wconversion -Winline \
#  -Wabi -Weffc++ -Wold-style-cast -Woverloaded-virtual 

# Path for the include files:
# --------------------------
INC	= -I\$(HOME_LORENE)/C++/Include \
          -I\$(HOME_LORENE)/C++/Include_extra 

# Converting archives to random libraries (if required, otherwise just ls)
# ------------------------------------------------------------------------
RANLIB = ls

# Fortran 77 compiler:
# -------------------
F77 	 = gfortran

# Options for the Fortran 77 compiler to produce the optimized library:
# ---------------------------------------------------------------------
F77FLAGS =  -m64 -ffixed-form -ffixed-line-length-none -O2 

# Options for the Fortran 77 compiler to produce the library for debugging:
# ------------------------------------------------------------------------
F77FLAGS_G = -m64 -ffixed-form -ffixed-line-length-none -g

#===============================#
#           MAKEDEPEND	        #
#===============================#

# First line uses the C precompiler (usually called cpp)
# if yours does not support the -M option try to figure out
# how to output dependencies file, or use makedepend (2nd line)
#--------------------------------------------------------------
MAKEDEPEND = cpp \$(INC) -M >> \$(df).d \$<
#MAKEDEPEND = touch \$(df).d && makedepend \$(INC) -f \$(df).d \$<
DEPDIR = .deps

#===============================#
#      SYSTEM LIBRARIES		#
#===============================#

# FFT library: FFT991 in Fortran coming with Lorene
#              FFTW3 library (must be installed separately)
# -------------------------------------------------------------------
FFT_DIR = FFT991

# C, C++ library, mathematical library and Fortran library
# ---------------------------------------------------------
ifeq (\$(FFT_DIR),FFTW3)
LIB_CXX = -lfftw3 -lgfortran -lstdc++ -lm
else 
LIB_CXX = -lgfortran -lstdc++ -lm
endif

# Linear Algebra Package (LAPACK) library
# ---------------------------------------
LIB_LAPACK = -llapack -lblas

# Graphical libraries: PGPLOT, PNG and X11
# ----------------------------------------
LIB_PGPLOT =

# GNU scientific library
# -----------------------------------
LIB_GSL = -lgsl -lgslcblas
EOF
