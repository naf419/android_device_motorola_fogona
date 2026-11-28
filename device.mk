#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/fogona

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
AB_OTA_UPDATER := true
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
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client
# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Partitions
PRODUCT_PACKAGES += \
    vendor_bt_firmware_mountpoint \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint \
    vendor_fsg_mountpoint

# Platform
PRODUCT_PLATFORM := qcom

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogona/fogona-vendor.mk)
