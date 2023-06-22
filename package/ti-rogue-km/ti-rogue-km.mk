################################################################################
#
# ti-rogue-km
#
################################################################################

# This corresponds to SDK 08.06.00
TI_ROGUE_KM_VERSION = 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2
TI_ROGUE_KM_SITE = https://git.ti.com/git/graphics/ti-img-rogue-driver.git
TI_ROGUE_KM_SITE_METHOD = git
TI_ROGUE_KM_LICENSE = MIT or GPL-2.0
TI_ROGUE_KM_LICENSE_FILES = README

TI_ROGUE_KM_DEPENDENCIES = linux

PVR_BUILD = "release"
PVR_WS = "wayland"

TI_ROGUE_KM_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
	KERNELDIR=$(LINUX_DIR) \
	BUILD=$(PVR_BUILD) \
	PVR_BUILD_DIR=$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT) \
	WINDOW_SYSTEM=$(PVR_WS)

define TI_ROGUE_KM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TI_ROGUE_KM_MAKE_OPTS)
endef

define TI_ROGUE_KM_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR) \
		M=$(@D)/binary_$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT)_$(PVR_WS)_$(PVR_BUILD)/target_aarch64/kbuild \
		INSTALL_MOD_PATH=$(TARGET_DIR) \
		modules_install
endef

$(eval $(generic-package))
