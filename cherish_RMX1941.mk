#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from device makefile
$(call inherit-product, device/realme/RMX1941/device.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# Inherit some common RevengeOS stuff
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_INCLUDE_PIXEL_CHARGER := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false
$(call inherit-product, vendor/cherish/config/common_full_phone.mk)

ALLOW_MISSING_DEPENDENCIES := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := cherish_RMX1941
PRODUCT_DEVICE := RMX1941
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme C2
PRODUCT_MANUFACTURER := realme

# Build info
BUILD_FINGERPRINT := "google/redfin/redfin:11/RQ2A.210505.003/7255357:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=RMX1941 \
    PRODUCT_NAME=RMX1941 \
    PRIVATE_BUILD_DESC="full_oppo6762-user 10 QP1A.190711.020 bedd37e98646d3a1 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-realme

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_GENERIC_PROPERTIES += \
    ro.cherish.maintainer=Sundram
