################################################################################
#
# ti-rogue-um
#
################################################################################

# This corresponds to SDK 08.06.00
TI_ROGUE_UM_VERSION = 5977e82b96028f783d39c7219f016c1faf8dc5f5
TI_ROGUE_UM_SITE = https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git
TI_ROGUE_UM_SITE_METHOD = git
TI_ROGUE_UM_LICENSE = TI TSPA License
TI_ROGUE_UM_LICENSE_FILES = LICENSE
TI_ROGUE_UM_INSTALL_STAGING = YES
TI_ROGUE_UM_PROVIDES = libegl libgbm libgles powervr

# ti-rogue-um is a egl/gles provider only if libdrm is installed
TI_ROGUE_UM_DEPENDENCIES = libdrm wayland

PVR_BUILD = "release"
PVR_WS = "wayland"

define TI_ROGUE_UM_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(STAGING_DIR) \
		TARGET_PRODUCT=$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
		BUILD=$(PVR_BUILD) WINDOW_SYSTEM=$(PVR_WS) \
		install
endef

define TI_ROGUE_UM_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(TARGET_DIR) \
		TARGET_PRODUCT=$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
		BUILD=$(PVR_BUILD) WINDOW_SYSTEM=$(PVR_WS) \
		install
endef

$(eval $(generic-package))
