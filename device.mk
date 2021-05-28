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

DEVICE_PATH := device/realme/RMX1941

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Call proprietary blob setup
$(call inherit-product-if-exists, vendor/realme/RMX1941/RMX1941-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Parts
$(call inherit-product-if-exists, packages/apps/RealmeParts/parts.mk)

ALLOW_MISSING_DEPENDENCIES=true

# VNDK
BOARD_VNDK_VERSION := 29
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_EXTRA_VNDK_VERSIONS := 29
PRODUCT_SHIPPING_API_LEVEL := 29

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_DENSITY := 423

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    GoogleCameraGo

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_EXTRA_VNDK_VERSIONS)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_effects.conf:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_EXTRA_VNDK_VERSIONS)/etc/audio_effects.conf \
    $(DEVICE_PATH)/audio/audio_effects.conf:$(TARGET_COPY_OUT_ODM)/etc/audio_effects.conf

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6765:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6765

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/com.mediatek.op.ims.common.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.mediatek.op.ims.common.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-oppo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-oppo.xml \
    $(DEVICE_PATH)/permissions/platform.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/platform.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-platform.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-platform.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor
	
# Telephony Jars
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common 
	
# Trustonic TEE
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/public.libraries-trustonic.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/public.libraries-trustonic.txt

# IMS
PRODUCT_PACKAGES += \
    mtk-ims \
    mtk-ims-telephony

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# Init
PRODUCT_PACKAGES += \
    init.mt6765.rc \
    fstab.mt6765 \
    init.safailnet.rc \
    perf_profile.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
    $(DEVICE_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl \
    $(DEVICE_PATH)/keylayout/mtk-tpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-tpd.kl \
    $(DEVICE_PATH)/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl 

# KPOC
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.0

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.RMX1941

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc  \
    NfcNci \
    SecureElement \
    Tag

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_PACKAGES += \
    NotchBarKiller

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.controls.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.android.customization.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.android.customization.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.custom.ambient.display.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.custom.ambient.display.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.google.android.packageinstaller.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.google.android.packageinstaller.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.android.launcher3.xml:$(TARGET_COPY_OUT_SYSTEM)/system_ext/etc/permissions/privapp-permissions-com.android.launcher3.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.android.systemui.xml:$(TARGET_COPY_OUT_SYSTEM)/system_ext/etc/permissions/privapp-permissions-com.android.systemui.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.google.android.gms.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.google.android.gms.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-com.google.android.gsf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.google.android.gsf.xml
	

# Power
PRODUCT_PACKAGES += \
    power.mt6765

# Properties
-include $(DEVICE_PATH)/system_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Do not spin up a separate process for the network stack, use an in-process APK.
PRODUCT_PACKAGES += InProcessNetworkStack
PRODUCT_PACKAGES += com.android.tethering.inprocess

# Symbols
PRODUCT_PACKAGES += \
    libshim_showlogo

# Wi-Fi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    wpa_supplicant.conf \
    WifiOverlay

# RealmeParts
$(call inherit-product, packages/apps/RealmeParts/parts.mk)


