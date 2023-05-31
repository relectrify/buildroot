Texas Instuments SK-AM64 Test and Development Board

Description
===========
This configuration will build a complete image for the TI SK-AM64 board.

How to Build
============
Select the default configuration for the target:
$ make am64x_sk_defconfig

Optional: modify the configuration:
$ make menuconfig

Required setup step for High Security HS-FS and HS-SE SoC variants:

To allow the image signing process for various firmware artifacts to
work the build process for HS-FS and HS-SE device variants is using
an external 'core-secdev-k3' package which can be obtained from
https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
To prepare building for those device variants create a local copy of
the 'core-secdev-k3' and export its location through the
TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
HS-FS device variants such as populated on the SK-AM64B board, or
customize this package with your private signing keys when using a
HS-SE device variant.

$ git clone https://git.ti.com/git/security-development-tools/core-secdev-k3.git
$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3

Build:
$ make

To copy the resultimg output image file to an SD card use dd:
$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M

How to Run
==========
Insert the SD card into the SK-AM62 board, and power it up through
the USB Type-C connector. The system should come up. You can use
a micro-USB cable to connect to the connector labeled DEBUG CONSOLE
to communicate with the board.
