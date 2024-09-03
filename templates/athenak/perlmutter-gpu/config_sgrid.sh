#!/usr/bin/env bash

cat > MyConfig <<EOF
# MyConfig to compile libsgrid with DNSdata for use e.g. with DNSdataReader
#
# The file MyConfig is included verbatim in the Makefile to determine which
# modules (or libraries) will be included in the build.

# ------------------------------------------------------------------------
# Here are simple examples for modules, they may be mutually exclusive.
# modules we add:

# ADM vars and iterative solvers
libpaths += src/physics/ADMvars
libpaths += src/utility/s2kit
libpaths += src/utility/GridIterators
libpaths += src/utility/LinAlg

# DNSdata and EoS at T=0
repo = giter@quark.physics.fau.edu:
projects += \$(repo)/EoS_T0
projects += \$(repo)/DNSdata

# ------------------------------------------------------------------------
# override various options in the Makefile

# name and directory for the executable
EXEC = sgrid
EXECDIR = \$(TOP)/exe

# pick a C compiler, only gcc and icc have been tested, gcc is the default
CC = gcc # icc

# optimization flags, say -O, -O2, -g for debugging, -pg for profiling, ...
OFLAGS = -O2 # -g # -Wall

# use OpenMP pragmas of LEVEL6 and TOPLEVEL
DFLAGS += -DLEVEL6_Pragmas
DFLAGS += -DTOPLEVEL_Pragmas -DMEMORY_EFFICIENT

# compile libsgrid:
DFLAGS += -DLIBSGRID
EOF
