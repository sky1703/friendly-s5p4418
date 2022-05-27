#!/bin/bash

TARGET_PLAT=s5p4418
TARGET_ARCH=arm
CROSS_COMPILER=arm-linux-
TARGET_OSNAME=friendlywrt

# FriendlyWRT
# 

TARGET_FRIENDLYWRT_CONFIG=config_s5p4418
FRIENDLYWRT_SRC=friendlywrt
FRIENDLYWRT_PACKAGES+=(packages/pkg1)
FRIENDLYWRT_PACKAGES+=(packages/pkg2)
FRIENDLYWRT_FILES+=(device/friendlyelec/s5p4418/default-settings)
FRIENDLYWRT_FILES+=(device/friendlyelec/s5p4418/common-files)

# U-boot
# 

TARGET_UBOOT_CONFIG=s5p4418_nanopi2_defconfig

# Kernel
# 
KERNEL_SRC=friendlykernel
TARGET_KERNEL_CONFIG=nanopi2_linux_defconfig
TARGET_KERNEL_DTB=s5p4418-nanopi2-*.dtb

# Misc
# 
FRIENDLYWRT_ROOTFS=build_dir/target-arm_cortex-a9+neon_musl_eabi/root-nexell-s5p4418
TARGET_IMAGE_DIRNAME=friendlywrt
TARGET_SD_RAW_FILENAME=FriendlyWrt_$(date +%Y%m%d)_S5P4418_armhf_sd.img
TARGET_EFLASHER_RAW_FILENAME=FriendlyWrt_$(date +%Y%m%d)_S5P4418_armhf_eflasher.img


