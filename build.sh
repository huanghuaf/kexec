#!/bin/sh

if [ "$1" = "arm64" ];then
	export CROSS_COMPILER=aarch64-linux-gnu-
elif [ "$1" = "arm" ];then
	export CROSS_COMPILER=arm-linux-gnueabi-
else
	echo "Not support ARCH:$1"
	exit 1;
fi
export TARGET_CC=${CROSS_COMPILER}gcc
export TARGET_LD=${CROSS_COMPILER}ld
export TARGET_AR=${CROSS_COMPILER}ar
export TARGET_STRIP=${CROSS_COMPILER}strip
export TARGET_RANLIB=${CROSS_COMPILER}ranlib
export BUILD_CC=gcc

./bootstrap

if [ "$1" = "arm64" ];then
LDFLAGS=-static ./configure --target=aarch64-linux-gnu --host=aarch64-linux-gnu --build=x86_64-pc-linux-gnu
else
LDFLAGS=-static ./configure --target=arm-linux-gnueabi --host=arm-linux-gnueabi --build=x86_64-pc-linux-gnu
fi

make

unset PATH
unset TARGET_CC
unset TARGET_LD
unset TARGET_AR
unset TARGET_STRIP
unset TARGET_RANLIB
unset BUILD_CC
