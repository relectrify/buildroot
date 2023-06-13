PHYTEC phyBOARD-AM64x
=====================

https://www.phytec.com/product/phyboard-am64x/

How to Build
============

The build process depends on some out of tree TI tools:

$ git clone https://git.ti.com/git/security-development-tools/core-secdev-k3.git

Load default configuration:

$ make phytec_phyboard_am64x_defconfig

Optionally change settings if required:

$ make menuconfig

Build root file system image:

$ make TI_SECURE_DEV_PKG=/path/to/ti/core-secdev-k3

Flashing
========

To write the image to an SD card:

$ dd if=output/images/sdcard.img of=/dev/sdX bs=4M conv=fsync oflag=direct status=progress
