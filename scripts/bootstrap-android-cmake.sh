#!/bin/bash

## Please edit android sdk/ndk/cmake path
ANDROID_SDK_ROOT=$HOME/Android/Sdk/
ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk-bundle
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.6.4111459/bin/cmake

rm -rf build-android

# For ninja build
# -DCMAKE_MAKE_PROGRAM=$ANDROID_SDK_ROOT/cmake/3.6.4111459/bin/ninja \

BOOST_ROOT=$HOME/local/opt/boost_1_69_0 \
TBBROOT=$HOME/local/aarch64/tbb \
PTEX_LOCATION=$HOME/local/aarch64 \
  $CMAKE_BIN \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_NATIVE_API_LEVEL=28 \
  -DANDROID_STL=c++_static \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX=$HOME/local/USD-android \
  -DPXR_ENABLE_PYTHON_SUPPORT=Off \
  -DPXR_ENABLE_GL_SUPPORT=Off \
  -DPXR_ENABLE_PTEX_SUPPORT=On \
  -DOPENSUBDIV_ROOT_DIR=$HOME/local/opensubdiv-aarch64 \
  -Bbuild-android -H.
