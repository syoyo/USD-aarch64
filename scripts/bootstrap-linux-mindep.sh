#!/bin/bash

rm -rf build
mkdir build

cmake \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$HOME/local/USD-aarch64 \
  -DPXR_BUILD_IMAGING=Off \
  -DPXR_ENABLE_PYTHON_SUPPORT=Off \
  -DPXR_ENABLE_GL_SUPPORT=Off \
  -DPXR_ENABLE_PTEX_SUPPORT=On \
  -Bbuild -H.
