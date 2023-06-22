################################################################################
#
# ti-core-secdev-k3
#
################################################################################

TI_CORE_SECDEV_K3_VERSION = 08.06.00.007
TI_CORE_SECDEV_K3_SITE = https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
TI_CORE_SECDEV_K3_LICENSE = TI TSPA License
TI_CORE_SECDEV_K3_LICENSE_FILES = manifest/k3-secdev-0.2-manifest.html
TI_CORE_SECDEV_K3_SOURCE = core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz

# To allow the image signing process for various firmware artifacts to work the
# build process for TI K3 platform HS-FS and HS-SE device variants is using the
# 'core-secdev-k3' tool provided by TI. Its location must be made available to
# the build process of dependent packages by exporting it through the use of an
# environmental variable. In order to not pollute the global Buildroot
# environment let's record the package's location and then define the actual
# environmental variable needed for the build only in the packages that need it.
TI_CORE_SECDEV_K3_INSTALL_DIR = $(HOST_DIR)/opt/ti-core-secdev-k3

define HOST_TI_CORE_SECDEV_K3_INSTALL_CMDS
	mkdir -p $(TI_CORE_SECDEV_K3_INSTALL_DIR)/keys
	cp -dpfr $(@D)/keys/* $(TI_CORE_SECDEV_K3_INSTALL_DIR)/keys
	mkdir -p $(TI_CORE_SECDEV_K3_INSTALL_DIR)/scripts
	cp -dpfr $(@D)/scripts/* $(TI_CORE_SECDEV_K3_INSTALL_DIR)/scripts
	mkdir -p $(TI_CORE_SECDEV_K3_INSTALL_DIR)/templates
	cp -dpfr $(@D)/scripts/* $(TI_CORE_SECDEV_K3_INSTALL_DIR)/templates
endef

$(eval $(host-generic-package))
