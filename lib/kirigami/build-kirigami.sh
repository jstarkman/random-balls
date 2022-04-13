#!/bin/sh

# Clean up remnants of failed builds; only first one should exist.
rm -rf build CMakeCache.txt CMakeFiles/ build prefix.sh ecm_uninstall.cmake 

mkdir -p build/android_arm64_v8a
cd build/android_arm64_v8a

export ANDROID_SDK_ROOT=/home/jas/Android/Sdk
export ANDROID_NDK=/home/jas/Android/Sdk/ndk/18.1.5063045
export ANDROID_ARCH_ABI=arm64-v8a

cmake ../.. \
  -DCMAKE_SYSROOT=/home/jas/Android/Sdk/ndk/18.1.5063045/platforms/android-21/arch-arm \
  -DCMAKE_TOOLCHAIN_FILE=/usr/share/ECM/toolchain/Android.cmake \
  -DCMAKE_PREFIX_PATH=/opt/qt/5.12.5/android_arm64_v8a \
  -DCMAKE_INSTALL_PREFIX=$(readlink -f ../../../../install/android_arm64_v8a) \

