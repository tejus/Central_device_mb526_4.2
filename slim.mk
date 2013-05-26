## Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/gsm.mk)

# Boot animation
TARGET_BOOTANIMATION_NAME := 480

# Inherit some common slim stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/moto/mb526/full_jordan.mk)

# Inherit device settings
$(call inherit-product, vendor/slim/config/common_defy.mk)
$(call inherit-product, vendor/slim/config/common_ledflash.mk)

# FM
PRODUCT_PACKAGES += \
  FMRadioService

# Camera
PRODUCT_PACKAGES += \
  Camera

# Mms
PRODUCT_PACKAGES += \
  Mms

# Dsp
PRODUCT_PACKAGES += \
    audio_effects.conf \
    DSPManager \
    libcyanogen-dsp \

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

#copy 00check
PRODUCT_COPY_FILES += \
vendor/slim/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check

## Device identifier. This must come after all inclusions
PRODUCT_NAME := slim_mb526
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := mb526
PRODUCT_MODEL := MB526
PRODUCT_MANUFACTURER := MOTO
PRODUCT_RELEASE_NAME := Defy(+)
PRODUCT_SFX := umts

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=${PRODUCT_DEVICE}_${PRODUCT_SFX} \
   BUILD_NUMBER=${DATE} \
   TARGET_DEVICE=${PRODUCT_DEVICE} \
   BUILD_FINGERPRINT=${PRODUCT_BRAND}/${PRODUCT_DEVICE}_${PRODUCT_SFX}/${PRODUCT_DEVICE}:${PLATFORM_VERSION}/${BUILD_ID}/${DATE}:user/release-keys \
   PRIVATE_BUILD_DESC="${PRODUCT_DEVICE}-user ${PLATFORM_VERSION} ${BUILD_ID} ${DATE} release-keys" \
   PRODUCT_BRAND=${PRODUCT_BRAND} \
   BUILD_UTC_DATE= \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \
