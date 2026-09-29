# Aurora environment for the Rhea (LibTorch/XPU) build (SLES 15 SP7, Agama 1146.78, libfabric 2.3.1).
#
# PE 26.26.0 (oneAPI 2025.3.1), NOT the image's default PE 26.181.0 (oneAPI 2026.1.0); see
# environment.sh for why. The explicit oneapi load must come first so boost/fftw/cmake resolve
# in the same 26.26.0 tree.
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
	echo "environment-rhea.sh: TORCH_PREFIX is not a LibTorch install:" >&2
	echo "  $TORCH_PREFIX" >&2
	echo "re-derive with: module load frameworks && python -c 'import torch;print(torch.utils.cmake_prefix_path)'" >&2
fi
