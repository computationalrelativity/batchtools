Elliptica needs UMFPACK, which is part of SuiteSparse, and LAPACK (`dgetrf`/`dgetrs`)
for the dense Schur solves on each patch (uses the improved Elliptica main solver under
https://github.com/computationalrelativity/Elliptica. This cluster does not install
`suitesparse-devel`, so we have to build it manually. The OpenBLAS 0.3.15 RPMs in
`/lib64` are installed, so they can be used directly.

## 1. Build SuiteSparse (UMFPACK and its dependencies)

```bash
module purge
module load tools/cmake/3.31.3          # SuiteSparse 7.x needs CMake >= 3.22

mkdir -p ~/src && cd ~/src
git clone https://github.com/DrTimothyAldenDavis/SuiteSparse.git
cd SuiteSparse && git checkout v7.12.3

mkdir build && cd build
cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$HOME/opt/suitesparse-7.12.3 \
  -DSUITESPARSE_ENABLE_PROJECTS="umfpack" \
  -DBLA_VENDOR=OpenBLAS \
  -DSUITESPARSE_USE_OPENMP=ON \
  -DSUITESPARSE_USE_CUDA=OFF
make -j 16 && make install
```

`SUITESPARSE_ENABLE_PROJECTS=umfpack` pulls in the libraries UMFPACK needs
(SuiteSparse_config, AMD, CAMD, COLAMD, CCOLAMD, CHOLMOD). The libraries go to
`~/opt/suitesparse-7.12.3/lib64` and the headers to `.../include/suitesparse`.

## 2. Link Elliptica against it (`MyConfig`)

```make
SPECIAL_INCS += -I$(HOME)/opt/suitesparse-7.12.3/include/suitesparse
SPECIAL_LIBS += -L$(HOME)/opt/suitesparse-7.12.3/lib64 -lumfpack \
                -Wl,-rpath,$(HOME)/opt/suitesparse-7.12.3/lib64
# LAPACK for the dense patch solver
SPECIAL_LIBS += -lopenblas
```

Run `make`, then check:

```bash
ldd Exe/elliptica | grep -Ei 'umfpack|cholmod|openblas|gomp'
# libumfpack.so.6  => ~/opt/suitesparse-7.12.3/lib64/...
# libopenblas.so.0 => /lib64/libopenblas.so.0
```

## 3. Threaded OpenBLAS at run time

`-lopenblas` links against `libopenblas.so.0`, and that gives the
**serial** build. Draco has three OpenBlas versions:

| file                       | threading           |
|----------------------------|---------------------|
| `/lib64/libopenblas.so.0`  | serial              |
| `/lib64/libopenblaso.so.0` | OpenMP              |
| `/lib64/libopenblasp.so.0` | pthreads            |

We should use the OpenMP build. In the run directory, we can create a symlink 
to that version and put it in `LD_LIBRARY_PATH`:

```bash
mkdir -p lib
ln -s /lib64/libopenblaso.so.0 lib/libopenblas.so.0
```

## 4. Slurm script

This line should then be present in the slurm script, see
batch.sub:

```bash
# pick up ./lib/libopenblas.so.0 -> libopenblaso (OpenMP build)
export LD_LIBRARY_PATH=$SLURM_SUBMIT_DIR/lib:$LD_LIBRARY_PATH
```
