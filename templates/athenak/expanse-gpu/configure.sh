cmake -DPROBLEM=z4c_two_puncture -DAthena_ENABLE_MPI=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_CUDA=ON \
      -DCMAKE_CXX_COMPILER=/cm/shared/apps/spack/0.17.3/gpu/b/opt/spack/linux-rocky8-skylake_avx512/gcc-8.5.0/gcc-10.2.0-i62tgsoexc6ya4h7urwhriiujk22nrnj/bin/gcc \
      $@ ../
