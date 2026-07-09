# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := lineage_fogona
PRODUCT_DEVICE := fogona
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g play (2024)
PRODUCT_MANUFACTURER := motorola

$(call inherit-product, device/motorola/fogona/device.mk)

PRODUCT_PACKAGES += \
    Launcher3QuickStep
