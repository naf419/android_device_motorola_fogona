LOCAL_PATH := device/motorola/fogona

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
BOARD_USES_FULL_RECOVERY_IMAGE := true

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

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
  vbmeta_system

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
        fastbootd

# Recovery init script
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# System init
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogona/fogona-vendor.mk)
