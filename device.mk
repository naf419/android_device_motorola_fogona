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

# Audio
PRODUCT_PACKAGES += \
    audioadsprpcd \
    audio.bluetooth.default \
    audio.primary.bengal \
    audio.r_submix.default \
    audio.usb.default \
    sound_trigger.primary.bengal \
    android.hardware.audio.service \
    vendor.qti.hardware.AGMIPC@1.0-service \
    vendor.qti.hardware.pal@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@4.0-impl \
    android.hardware.audio@5.0-impl \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.2-impl \
    android.hardware.soundtrigger@2.3-impl

PRODUCT_PACKAGES += \
    firmware_aw_cali.bin_symlink

PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    libagm \
    libagmclient \
    libagm_compress_plugin \
    libagm_mixer_plugin \
    libagm_pcm_plugin \
    libar-pal \
    libbatterylistener \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libhfp_pal \
    libfmpal \
    libldnhncr \
    libpalclient \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libsndcardparser \
    libvisualizer \
    libvolumelistener

PRODUCT_PACKAGES += \
    lib_bt_aptx \
    lib_bt_ble \
    lib_bt_bundle

# Audio - Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/audio/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml
# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Partitions
PRODUCT_PACKAGES += \
    vendor_bt_firmware_mountpoint \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint \
    vendor_fsg_mountpoint

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \

# Platform
PRODUCT_PLATFORM := qcom


# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/permissions/com.qti.dpmframework.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qti.dpmframework.xml \
    $(LOCAL_PATH)/configs/permissions/com.qti.location.sdk.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qti.location.sdk.xml \
    $(LOCAL_PATH)/configs/permissions/com.qti.qcc.vendor_qcc.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qti.qcc.vendor_qcc.xml \
    $(LOCAL_PATH)/configs/permissions/com.qualcomm.qti.imscmservice-V2.0-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qualcomm.qti.imscmservice-V2.0-java.xml \
    $(LOCAL_PATH)/configs/permissions/com.qualcomm.qti.imscmservice-V2.1-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qualcomm.qti.imscmservice-V2.1-java.xml \
    $(LOCAL_PATH)/configs/permissions/com.qualcomm.qti.imscmservice-V2.2-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qualcomm.qti.imscmservice-V2.2-java.xml \
    $(LOCAL_PATH)/configs/permissions/com.qualcomm.qti.VENDORSSGTZD.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.qualcomm.qti.VENDORSSGTZD.xml \
    $(LOCAL_PATH)/configs/permissions/embms-noship_product_privapp_permissions_qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/embms-noship_product_privapp_permissions_qti.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-qti-system-ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti-system-ext.xml \
    $(LOCAL_PATH)/configs/permissions/qti_libpermissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/qti_libpermissions.xml \
    $(LOCAL_PATH)/configs/permissions/qti_permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/qti_permissions.xml \
    $(LOCAL_PATH)/configs/permissions/telephony_system-ext_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/telephony_system-ext_privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/permissions/vendor.qti.ims.rcsconfig-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/vendor.qti.ims.rcsconfig-java.xml \
    $(LOCAL_PATH)/configs/permissions/vendor.qti.ims.rcsservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/vendor.qti.ims.rcsservice.xml \
    $(LOCAL_PATH)/configs/permissions/wfd-system-ext-privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/wfd-system-ext-privapp-permissions-qti.xml

# Recovery init script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/motorola

# System init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.mmi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.rc \
    $(LOCAL_PATH)/init/init.mmi.overlay.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.overlay.rc

# VINTF
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/vintf/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/vintf/compatibility_matrix.device.xml

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwifi-hal-qcom \
    libwifi-hal-ctrl \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    WifiResCommonOverlay

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogona/fogona-vendor.mk)
