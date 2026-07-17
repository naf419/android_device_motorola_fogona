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

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.memtrack-service

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
        fastbootd

# Media
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    libplatformconfig

# Recovery init script
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# System init
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc \
        $(LOCAL_PATH)/init/init.class_main.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.class_main.sh \
        $(LOCAL_PATH)/init/init.mmi.boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mmi.boot.sh \
        $(LOCAL_PATH)/init/init.mmi.charge_only.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.charge_only.rc \
        $(LOCAL_PATH)/init/init.mmi.chipset.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.chipset.rc \
        $(LOCAL_PATH)/init/init.mmi.debug.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.debug.rc \
        $(LOCAL_PATH)/init/init.mmi.diag_mdlog.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.diag_mdlog.rc \
        $(LOCAL_PATH)/init/init.mmi.display.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mmi.display.sh \
        $(LOCAL_PATH)/init/init.mmi.modules.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mmi.modules.sh \
        $(LOCAL_PATH)/init/init.mmi.overlay.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.overlay.rc \
        $(LOCAL_PATH)/init/init.mmi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.rc \
        $(LOCAL_PATH)/init/init.mmi.tcmd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.tcmd.rc \
        $(LOCAL_PATH)/init/init.mmi.touch.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mmi.touch.sh \
        $(LOCAL_PATH)/init/init.mmi.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.usb.rc \
        $(LOCAL_PATH)/init/init.mmi.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mmi.usb.sh \
        $(LOCAL_PATH)/init/init.mmi.wlan.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.wlan.rc \
        $(LOCAL_PATH)/init/init.oem.hw.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.oem.hw.sh \
        $(LOCAL_PATH)/init/init.qcom.class_core.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.class_core.sh \
        $(LOCAL_PATH)/init/init.qcom.early_boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.early_boot.sh \
        $(LOCAL_PATH)/init/init.qcom.post_boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.post_boot.sh \
        $(LOCAL_PATH)/init/init.qcom.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.sh \
        $(LOCAL_PATH)/init/init.qti.write.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.write.sh \
        $(LOCAL_PATH)/init/init.target.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.target.rc \
        $(LOCAL_PATH)/init/init.qti.kernel.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qti.kernel.rc \
        $(LOCAL_PATH)/init/init.qcom.early_boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.early_boot.sh \
        $(LOCAL_PATH)/init/init.qti.early_init.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.early_init.sh \
        $(LOCAL_PATH)/init/system_dlkm_modprobe.sh:$(TARGET_COPY_OUT_VENDOR)/bin/system_dlkm_modprobe.sh \
        $(LOCAL_PATH)/init/vendor_modprobe.sh:$(TARGET_COPY_OUT_VENDOR)/bin/vendor_modprobe.sh \
        $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
        $(LOCAL_PATH)/init/fstab.qcom.zram:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom.zram

#TODO: make these dirs correctly
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init/dummy:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/dummy \
        $(LOCAL_PATH)/init/dummy:$(TARGET_COPY_OUT_VENDOR)/bt_firmware/dummy \
        $(LOCAL_PATH)/init/dummy:$(TARGET_COPY_OUT_VENDOR)/fsg/dummy \
        $(LOCAL_PATH)/init/dummy:$(TARGET_COPY_OUT_VENDOR)/dsp/dummy


PRODUCT_VENDOR_PROPERTIES += \
    vendor.gatekeeper.is_security_level_spu=0

# TODO: use frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk?
PRODUCT_VENDOR_PROPERTIES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=adreno \
    graphics.gpu.profiler.support=true \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610 \
    vendor.gralloc.use_dma_buf_heaps=1 \
    vendor.display.disable_layer_stitch 1 \
    vendor.display.enable_rounded_corner 0 \
    vendor.display.disable_rounded_corner_thread 0 \
    vendor.display.enable_rc_support 0 \
    vendor.display.enable_perf_hint_large_comp_cycle 1

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwifi-hal-qcom \
    libwifi-hal-ctrl \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    WifiResCommonOverlay

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Wifi - Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogona/fogona-vendor.mk)
