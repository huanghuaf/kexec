#!/bin/sh

export PATH=$PATH:/tool/gcc_linaro/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin

export CROSS_COMPILER=aarch64-linux-gnu-
export TARGET_CC=${CROSS_COMPILER}gcc
export TARGET_LD=${CROSS_COMPILER}ld
export TARGET_AR=${CROSS_COMPILER}ar
export TARGET_STRIP=${CROSS_COMPILER}strip
export TARGET_RANLIB=${CROSS_COMPILER}ranlib
export BUILD_CC=gcc

./bootstrap

LDFLAGS=-static ./configure --target=aarch64-linux-gnu --host=aarch64-linux-gnu --build=x86_64-pc-linux-gnu


make

unset PATH
unset TARGET_CC
unset TARGET_LD
unset TARGET_AR
unset TARGET_STRIP
unset TARGET_RANLIB
unset BUILD_CC
