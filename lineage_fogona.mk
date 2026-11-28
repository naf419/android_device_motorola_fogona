#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/motorola/fogona/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)


PRODUCT_NAME := lineage_fogona
PRODUCT_DEVICE := fogona
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g play (2024)
PRODUCT_MANUFACTURER := motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="fogona_g-user 14 U1TFS34M.100-35-14-1-16 8aa5c release-keys" \
    BuildFingerprint=motorola/fogona_g/msi:14/U1TFS34M.100-35-14-1-16/8aa5c:user/release-keys
    DeviceProduct=fogona_g