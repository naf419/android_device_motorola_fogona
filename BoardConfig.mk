LOCAL_PATH := device/motorola/fogona

TARGET_BOOTLOADER_BOARD_NAME = fogona
TARGET_BOARD_PLATFORM := bengal

# Identify CPU architecture & ABI
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

# Device Tree Blob
BOARD_USES_DT := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(LOCAL_PATH)/prebuilt/dtbs
BOARD_PREBUILT_DTBOIMAGE := $(BOARD_PREBUILT_DTBIMAGE_DIR)/dtbo.img

# Partitions
TARGET_COPY_OUT_SYSTEM := system
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

# Boot & vendor boot partitions
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_SUPER_PARTITION_SIZE := 6710886400
BOARD_SUPER_PARTITION_GROUPS := moto_dynamic_partitions
BOARD_MOTO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product system_dlkm vendor_dlkm
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 6706692096 # BOARD_SUPER_PARTITION_SIZE - 4MB
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_USE_LZ4 := true

TARGET_KERNEL_CONFIG := gki_defconfig vendor/bengal_GKI.config vendor/ext_config/moto-bengal.config vendor/ext_config/moto-bengal-fogona.config vendor/ext_config/fogona-modules.config
TARGET_KERNEL_SOURCE := kernel/motorola/sm8550
BOARD_KERNEL_IMAGE_NAME := Image
KERNEL_LTO := thin

# Kernel modules
TARGET_KERNEL_EXT_MODULE_ROOT := kernel/motorola/sm8550-modules

BOARD_USES_GENERIC_KERNEL_IMAGE := true
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(LOCAL_PATH)/modules.load.system_dlkm))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(LOCAL_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(LOCAL_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(LOCAL_PATH)/modules.load.vendor_boot))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(LOCAL_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(LOCAL_PATH)/modules.load.vendor_boot))
BOOT_KERNEL_MODULES := $(strip $(shell cat $(LOCAL_PATH)/modules.load $(LOCAL_PATH)/modules.load.vendor_boot))
SYSTEM_KERNEL_MODULES := $(strip $(shell cat $(LOCAL_PATH)/modules.load.system_dlkm))

TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/mm-drivers/hw_fence \
    qcom/opensource/mm-drivers/msm_ext_display \
    qcom/opensource/mm-drivers/sync_fence \
    qcom/opensource/audio-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/securemsm-kernel \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/video-driver \
    qcom/opensource/graphics-kernel \
    qcom/opensource/bt-kernel \
    qcom/opensource/wlan/platform \
    qcom/opensource/wlan/qcacld-3.0/.wlan \
    nxp/opensource/driver \
    motorola/drivers/input/misc/chipone_fps_mmi_v1 \
    motorola/drivers/input/misc/fpc_fps_mmi \
    motorola/drivers/input/misc/qpnp_power_on_mmi \
    motorola/drivers/input/touchscreen/chipone_tddi_v2_mmi \
    motorola/drivers/input/touchscreen/touchscreen_mmi \
    motorola/drivers/input/touchscreen/ilitek_v3_mmi \
    motorola/drivers/input/touchscreen/nova_0flash_mmi \
    motorola/drivers/input/misc/goodix_fod_mmi \
    motorola/drivers/mmi_annotate \
    motorola/drivers/mmi_info \
    motorola/drivers/mmi_relay \
    motorola/drivers/power/bq2589x_chg_mmi \
    motorola/drivers/power/cw2217b_fg_mmi \
    motorola/drivers/power/bm_adsp_ulog \
    motorola/drivers/power/mmi_charger \
    motorola/drivers/power/qti_glink_charger \
    motorola/drivers/power/qpnp_adaptive_charge \
    motorola/drivers/power/rt9426a_fg_mmi \
    motorola/drivers/misc/utag \
    motorola/drivers/moto_f_usbnet \
    motorola/drivers/moto_mm \
    motorola/drivers/moto_mmap_fault \
    motorola/drivers/moto_sched \
    motorola/drivers/moto_swap \
    motorola/drivers/misc/aw9610x \
    motorola/drivers/misc/mmi_sys_temp \
    motorola/drivers/misc/ldo_vibrator_mmi \
    motorola/drivers/misc/sx937x_multi \
    motorola/drivers/misc/sx933x \
    motorola/drivers/misc/tps61280a \
    motorola/drivers/nfc/st21nfc \
    motorola/drivers/power/mmi_discrete_charger \
    motorola/drivers/power/mmi_lpd_mitigate \
    motorola/drivers/power/sgm4154x_chg_mmi \
    motorola/drivers/power/sm5602_fg_mmi \
    motorola/drivers/power/wakeup_sources \
    motorola/drivers/regulator/wl2868c \
    motorola/drivers/sensors \
    motorola/drivers/usb/typec/adapter_class \
    motorola/drivers/usb/typec/mmi_tcpc \
    motorola/drivers/watchdogtest

BOARD_USES_SYSTEM_DLKMIMAGE := true
BOARD_USES_VENDOR_DLKMIMAGE := true

BOARD_BOOTCONFIG += androidboot.memcg=1
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

BOARD_KERNEL_CMDLINE := \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    firmware_class.path=/vendor/firmware_mnt/image \
    mem.enable_mglru=1

#Audio
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_EC_REF_CAPTURE := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
TARGET_USES_QCOM_MM_AUDIO := true

$(call soong_config_set,android_hardware_audio,run_64bit,true)

# Filesystem
TARGET_FS_CONFIG_GEN := \
    $(LOCAL_PATH)/config.fs \
    $(LOCAL_PATH)/mot_aids.fs

# Fstab
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/init/fstab.recovery

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom \
        $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# HIDL
ODM_MANIFEST_SKUS += b
ODM_MANIFEST_B_FILES := $(LOCAL_PATH)/sku/manifest_b.xml

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
#include hardware/motorola/sepolicy/qti/SEPolicy.mk
#BOARD_VENDOR_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy/vendor
#PRODUCT_PRIVATE_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy/private
#PRODUCT_PUBLIC_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy/public
BOARD_BOOTCONFIG += androidboot.selinux=permissive

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Init script
BOARD_BOOTCONFIG += androidboot.hardware=qcom

# USB
BOARD_BOOTCONFIG += androidboot.usbcontroller=4e00000.dwc3

# Debugging
BOARD_KERNEL_CMDLINE += printk.devkmsg=on  printk.always_kmsg_dump=1 loglevel=7
BOARD_BOOTCONFIG += androidboot.init_fatal_reboot_target=recovery
BOARD_BOOTCONFIG += androidboot.init_fatal_panic=true

# Userdata Partition
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# Metadata encryption
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := metadata

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_AVB_ROLLBACK_INDEX := 24

BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ROLLBACK_INDEX := 24
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 4

BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_DTBO_ROLLBACK_INDEX := 24
BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 3

BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 24
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system system_dlkm system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 24
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 24
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 5

# Use sha256 hash algorithm for system_dlkm partition
BOARD_AVB_SYSTEM_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_ODM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit the proprietary files
include vendor/motorola/fogona/BoardConfigVendor.mk
