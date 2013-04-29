#
# Copyright (C) 2012 The Android Open-Source Project
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

TARGET_BOOTANIMATION_NAME := 480

$(call inherit-product-if-exists, vendor/slim/config/common_full_phone.mk)
$(call inherit-product-if-exists, vendor/slim/config/gsm.mk)
$(call inherit-product, device/motorola/mb526/full_jordan.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/mb526/overlay

#Goo.im
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=Kayant \
    ro.goo.version=$(DATE) \

# Inherit device settings
$(call inherit-product, vendor/slim/config/common_defy.mk)

# Inherit torch settings
$(call inherit-product, vendor/slim/config/common_ledflash.mk)

#Boot Animation
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mb526
PRODUCT_NAME := slim_mb526
PRODUCT_BRAND := MOTO
PRODUCT_MODEL := MB526
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := DFP

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=${PRODUCT_MODEL}_${PRODUCT_SFX} \
    TARGET_DEVICE=umts_jordan \
    BUILD_FINGERPRINT=MOTO/MB526_O2DE/umts_jordan:2.3.6/4.5.1-134_DFP-132/1317968148:user/release-keys \
    PRIVATE_BUILD_DESC="umts_jordan_emara-user 2.3.6 4.5.1-134_DFP-132 1317968148 release-keys" \
    BUILD_NUMBER=${DATE} \
    BUILD_VERSION_TAGS=release-keys \
    TARGET_BUILD_TYPE=user
