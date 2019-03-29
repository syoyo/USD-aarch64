#!/bin/bash

CMAKE_BIN=cmake

rm -rf build-aarch64-cross

BOOST_ROOT=$HOME/local/opt/boost_1_69_0 \
TBBROOT=$HOME/local/aarch64/tbb \
PTEX_LOCATION=$HOME/local/aarch64 \
  $CMAKE_BIN \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX=$HOME/local/USD-aarch64 \
  -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc-5 \
  -DCMAKE_CXX_COMPILER=aarch64-linux-gnu-g++-5 \
  -DPXR_ENABLE_PYTHON_SUPPORT=Off \
  -DPXR_ENABLE_GL_SUPPORT=Off \
  -DPXR_ENABLE_PTEX_SUPPORT=On \
  -DOPENSUBDIV_ROOT_DIR=$HOME/local/opensubdiv-aarch64 \
  -Bbuild-aarch64-cross -H.
