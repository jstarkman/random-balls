#!/bin/sh

cd build/android_arm64_v8a
rm -rf *

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

export ANDROID_SDK_ROOT=/home/jas/Android/Sdk
export ANDROID_NDK=/home/jas/Android/Sdk/ndk/18.1.5063045
export ANDROID_ARCH_ABI=arm64-v8a

cmake ../.. \
	-DQTANDROID_EXPORTED_TARGET=random-balls \
	-DANDROID_APK_DIR=$(readlink -f ../../src/android) \
	-DCMAKE_SYSROOT=/opt/android-sdk/ndk/18.1.5063045/platforms/android-21/arch-arm \
	-DCMAKE_TOOLCHAIN_FILE=/usr/share/ECM/toolchain/Android.cmake \
	-DCMAKE_PREFIX_PATH=/opt/qt/5.12.5/android_arm64_v8a \
	-DECM_ADDITIONAL_FIND_ROOT_PATH=/opt/qt/5.12.5/android_arm64_v8a \
	-DCMAKE_INSTALL_PREFIX=$(readlink -f ../../install/android_arm64_v8a) \
	-DKF5Kirigami2_DIR=$(readlink -f ../../install/android_arm64_v8a/lib/cmake/KF5Kirigami2) \
	-DCMAKE_BUILD_TYPE=Debug \
	-DANDROID_SDK_BUILD_TOOLS_REVISION=28.0.2 \

echo '=========================='
echo '=== Survived this far! ==='
echo '=========================='

make
make install
make create-apk

cd ../..
