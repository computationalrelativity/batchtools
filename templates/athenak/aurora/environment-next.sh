# Aurora environment for a build targeting the `next-eval` queue's compute image
# (SLES 15 SP7, Agama 1146.78, libfabric 2.3.1). No LibTorch; see environment-rhea-next.sh
# for the LibTorch variant.
#
# Compile on aurora-uan-0007 or aurora-uan-0008. The other UANs still run the old compute image.
#
# PE 26.26.0 (oneAPI 2025.3.1), NOT the new image's default PE 26.181.0 (oneAPI 2026.1.0):
# oneAPI 2026.1 removed the SYCL_EXT_INTEL_USM_ADDRESS_SPACES feature macro, and AthenaK's
# bundled Kokkos 4.7.4 has a hard `#error` on it (kokkos/core/src/setup/Kokkos_Setup_SYCL.hpp).
# ALCF dropped Kokkos 4.x from PE 26.181.0 for the same reason. PE 26.26.0 is itself rebuilt for
# the new image, so this still exercises the new OS and GPU drivers. Building against oneAPI
# 2026.1 requires upgrading the bundled Kokkos to 5.x.
#
# The explicit oneapi load must come first: it swings MODULEPATH over to the 26.26.0 spack tree,
# so boost/fftw/cmake resolve there. The new-image UANs default to oneapi/release/2026.1.0.
module load oneapi/release/2025.3.1
module load boost/1.88.0
module load fftw/3.3.10
module load cmake
