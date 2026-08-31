#
# Copyright (C) 2022 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 2712
TARGET_SCREEN_WIDTH := 1220

# Screen
TARGET_SCREEN_DENSITY := 450

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 480dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

BOARD_SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 34

# Inherit from motorola sm8475-common
$(call inherit-product, device/motorola/sm8475-common/sm8475.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineageSdkResDevice \
    LineageSystemUIResDevice \
    SettingsResDevice \
    SystemUIResDevice

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/sku_cape/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/sku_cape/mixer_paths_waipio_mtp_hdr.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_mtp_hdr.xml \
    $(LOCAL_PATH)/configs/audio/sku_cape/resourcemanager_waipio_mtp_hdr.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_mtp_hdr.xml \
    $(LOCAL_PATH)/configs/audio/sku_cape_qssi/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape_qssi/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/configs/audio/microphone_characteristics.xml:$(TARGET_COPY_OUT_VENDOR)/etc/microphone_characteristics.xml \
    $(LOCAL_PATH)/configs/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.moto_sm8475_fod

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.vendor.st21nfc.rc


# LiveDisplay
$(call soong_config_set_bool,livedisplay_sysfs,enable_af,true)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st \
    com.android.nfc_extras \
    Tag

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

$(call soong_config_set,lineage_powershare,powershare_path,/sys/class/power_supply/wireless/device/tx_mode)

# Properties
PRODUCT_PACKAGES += \
    hardware.sku.XT2407.prop

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# VINTF
ODM_MANIFEST_SKUS += dn n
ODM_MANIFEST_DN_FILES := \
    $(LOCAL_PATH)/vintf/manifest_dn.xml
ODM_MANIFEST_N_FILES := \
    $(LOCAL_PATH)/vintf/manifest_n.xml \
    device/motorola/sm8475-common/vintf/manifest_ss.xml

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/tank/tank-vendor.mk)

