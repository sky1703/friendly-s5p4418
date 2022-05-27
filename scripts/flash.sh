#!/bin/bash

if [ $# -lt 2 ]
then
	echo $0 "img_file boot|rootfs|all [full_size M]"
	exit
fi

img_name=$1
bs=$3

rm -f out/boot*.img
rm -f out/rootfs*.img

if [ "$2" == "boot" ];then
	Start=$(fdisk -l $img_name | grep NanoPC-T2_armhf_sd.img1 | awk '{printf $2}')
	Sectors=$(fdisk -l $img_name | grep NanoPC-T2_armhf_sd.img1 | awk '{printf $4}')
elif [ "$2" == "rootfs" ];then
	Start=$(fdisk -l $img_name | grep NanoPC-T2_armhf_sd.img2 | awk '{printf $2}')
	Sectors=$(fdisk -l $img_name | grep NanoPC-T2_armhf_sd.img2 | awk '{printf $4}')
else
	echo "  $0 img_file boot|rootfs|all"
	exit
fi

rm -f out/FriendlyWrt_$2.img

dd if=$img_name skip=$Start bs=512 count=$Sectors of=out/FriendlyWrt_$2.img

if [ -n "$bs" ]; then  
	echo dd if=out/$2.img of=out/$2-full.img bs=$bs conv=sync
fi


tar -zcvf out/FriendlyWrt_$2.img.tar.gz out/FriendlyWrt_$2.img

