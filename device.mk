LOCAL_PATH := device/motorola/fogona

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
BOARD_USES_FULL_RECOVERY_IMAGE := true

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery

# Audio - Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service

# Prebuilt kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_PLATFORM := qcom

# VINTF
## Device manifest (from vendor)
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/vintf/manifest.xml
## Device-specific system manifest
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/vintf/compatibility_matrix.device.xml

# API levels
PRODUCT_SHIPPING_API_LEVEL := 33

# A/B
AB_OTA_UPDATER := true
PRODUCT_PACKAGES += \
  update_engine \
  update_verifier
# Debug builds
PRODUCT_PACKAGES_DEBUG += update_engine_client


# A/B updatable partitions
AB_OTA_PARTITIONS := \
  boot \
  init_boot \
  vendor_boot \
  system \
  vendor \
  system_ext \
  product \
  dtbo \
  vbmeta \
  vbmeta_system \
  system_dlkm \
  vendor_dlkm

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service \
    android.hardware.power-impl

# Display
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
        fastbootd

# Mountpoints
PRODUCT_PACKAGES += \
    vendor_firmware_mnt_mountpoint

# Recovery init script
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# System init
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc

#need sysfs fallback enabled for fw loading
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.qti.kernel.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qti.kernel.rc

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/system_dlkm_modprobe.sh:$(TARGET_COPY_OUT_VENDOR)/bin/system_dlkm_modprobe.sh

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/vendor_modprobe.sh:$(TARGET_COPY_OUT_VENDOR)/bin/vendor_modprobe.sh

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

#TODO: make these dirs correctly
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/dummy
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/bt_firmware/dummy
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/fsg/dummy
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/vendor/dsp/dummy

PRODUCT_VENDOR_PROPERTIES += \
    vendor.gatekeeper.is_security_level_spu=0

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=adreno \
    ro.sf.lcd_density=280 \
    service.sf.prime_shader_cache=0

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogona/fogona-vendor.mk)
