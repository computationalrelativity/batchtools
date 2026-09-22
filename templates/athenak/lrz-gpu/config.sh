#!/bin/bash

# SYCL performance improvements:
#   - SYCL optimization mode off -> tensor loops get unrolled/scalarized
#   - large GRF (256 registers for heavy kernels)
#   - higher inline threshold
CXXF='-Xclang -mllvm -Xclang -sycl-opt=false -fno-vectorize -fno-slp-vectorize'
CXXF="$CXXF -Xsycl-target-backend=spir64_gen \"-options -ze-opt-large-register-file\""
CXXF="$CXXF -Xclang -mllvm -Xclang -inline-threshold=5000"
LNK="-fsycl-max-parallel-link-jobs=112 -fsycl-device-code-split=per_kernel"

cmake .. \
	-DAthena_ENABLE_MPI=ON \
	-DCMAKE_CXX_FLAGS="$CXXF" \
	-DCMAKE_EXE_LINKER_FLAGS="$LNK" \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=OFF
