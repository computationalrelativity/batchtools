#! /bin/bash

cmake -DAthena_ENABLE_MPI=ON \
      -DKokkos_ENABLE_CUDA=ON \
      -DKokkos_ENABLE_CUDA_LAMBDA=ON \
      -DKokkos_ENABLE_IMPL_CUDA_MALLOC_ASYNC=OFF \
      -DKokkos_ARCH_AMPERE80=On \
      -DKokkos_ARCH_ICX=On \
      -B build \
      $@
