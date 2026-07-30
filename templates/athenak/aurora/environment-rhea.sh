# Aurora environment for the Rhea (LibTorch/XPU) build: the same production stack as
# environment.sh, and deliberately NOT `module load frameworks`.
#
# LibTorch is taken from the frameworks module's install by PATH ONLY, via TORCH_PREFIX below.
# Loading the module instead sets ZE_FLAT_DEVICE_HIERARCHY=FLAT and appends opencl:gpu to
# ONEAPI_DEVICE_SELECTOR, both of which are actively harmful here:
#
#   - under FLAT, PVC tiles are root devices and ZE_AFFINITY_MASK is a flat list ("0".."11"),
#     so /soft/tools/mpi_wrapper_utils/gpu_tile_compact.sh -- which batch.sub uses -- emits
#     COMPOSITE "gpu.tile" masks ("0.0") that match NO device. The failure is quiet: sycl-ls
#     reports "No platforms found" and Kokkos::initialize() aborts "no GPU available".
#   - exposing both opencl and level_zero makes SYCL enumerate every GPU twice, at odds with
#     the Rhea port requiring Kokkos's device index and Torch's XPU index to name the same
#     physical device (radiation_m1_rhea.cpp, ResolveDevice()).
#
# The site defaults (COMPOSITE, level_zero:gpu) are exactly what gpu_tile_compact.sh expects.
#
# Nothing below is needed at RUNTIME for LibTorch: the linked binary's RUNPATH already covers
# torch/lib, and libsycl/libmkl come from oneapi/release/2025.3.1, which is loaded by default.
# Verified 2026-07-29: `ldd src/athena` has zero unresolved libraries with only these modules.
module load boost/1.88.0
module load fftw/3.3.10
module load cmake

# Path-pinned to a specific frameworks release, since we are not asking the module system for
# it. Re-derive after an Aurora software update with:
#     module load frameworks && python -c 'import torch;print(torch.utils.cmake_prefix_path)'
# (that prints $TORCH_PREFIX/share/cmake, which is what configure-rhea.sh passes to CMake).
export TORCH_PREFIX=/opt/aurora/26.26.0/frameworks/aurora_frameworks-2025.3.1/lib/python3.12/site-packages/torch

if [ ! -d "$TORCH_PREFIX/share/cmake/Torch" ]; then
	echo "environment-rhea.sh: TORCH_PREFIX is not a LibTorch install:" >&2
	echo "  $TORCH_PREFIX" >&2
	echo "re-derive it as described in the comment above" >&2
fi
