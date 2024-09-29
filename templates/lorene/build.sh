#!/usr/bin/env bash

cd Lorene
export HOME_LORENE=$PWD
make -j4 cpp fortran export
