# Aurora environment for the Rhea (LibTorch/XPU) build targeting the `next-eval` queue's new
# compute image (SLES 15 SP7, Agama 1146.78, libfabric 2.3.1).
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

# LibTorch by path only. Loading `frameworks` sets ZE_FLAT_DEVICE_HIERARCHY=FLAT, under which
# gpu_tile_compact.sh's COMPOSITE "gpu.tile" masks match no device, and appends opencl:gpu to
# ONEAPI_DEVICE_SELECTOR, which double-enumerates every GPU and breaks the Kokkos/Torch
# device-index agreement radiation_m1_rhea.cpp's ResolveDevice() relies on.
export TORCH_PREFIX=/opt/aurora/26.26.0/frameworks/aurora_frameworks-2025.3.1/lib/python3.12/site-packages/torch

if [ ! -d "$TORCH_PREFIX/share/cmake/Torch" ]; then
	echo "environment-rhea-next.sh: TORCH_PREFIX is not a LibTorch install:" >&2
	echo "  $TORCH_PREFIX" >&2
	echo "re-derive with: module load frameworks && python -c 'import torch;print(torch.utils.cmake_prefix_path)'" >&2
fi
