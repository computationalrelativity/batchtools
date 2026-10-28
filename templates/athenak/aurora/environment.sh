# Aurora build environment (SLES 15 SP7, Agama 1146.78, libfabric 2.3.1). No LibTorch; see
# environment-rhea.sh for the LibTorch variant.
#
# PE 26.26.0 (oneAPI 2025.3.1), NOT the image's default PE 26.181.0 (oneAPI 2026.1.0):
# oneAPI 2026.1 removed the SYCL_EXT_INTEL_USM_ADDRESS_SPACES feature macro, and AthenaK's
# bundled Kokkos 4.7.4 has a hard `#error` on it (kokkos/core/src/setup/Kokkos_Setup_SYCL.hpp).
# ALCF dropped Kokkos 4.x from PE 26.181.0 for the same reason. Building against oneAPI
# 2026.1 requires upgrading the bundled Kokkos to 5.x.
#
# The explicit oneapi load must come first: it swings MODULEPATH over to the 26.26.0 spack tree,
# so boost/fftw/cmake resolve there.
module load oneapi/release/2025.3.1
module load boost/1.88.0
module load fftw/3.3.10
module load cmake
