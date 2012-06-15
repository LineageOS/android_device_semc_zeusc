$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/zeusc/zeusc-vendor.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := zeusc
PRODUCT_DEVICE := zeusc
PRODUCT_MODEL := zeusc

-include device/semc/zeus-common/zeus.mk

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/zeusc/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/semc/zeusc/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
    device/semc/zeusc/prebuilt/init.semc.usb.rc:root/init.semc.usb.rc \
    device/semc/msm7x30-common/prebuilt/logo_H.rle:root/logo.rle \
    device/semc/zeusc/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/zeusc/recovery.fstab:root/recovery.fstab \
    device/semc/zeusc/prebuilt/bootrec-device:root/sbin/bootrec-device

#WIFI modules
PRODUCT_COPY_FILES += \
    device/semc/zeusc/prebuilt/bcm4329.ko:root/modules/bcm4329.ko

# semc msm7x30 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

-include device/semc/msm7x30-common/prebuilt/resources-hdpi.mk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.telephony.default_network=4 \
    ro.ril.vzw.feature=1 \
    ro.ril.wp.feature=1 \
    persist.telephony.support_ipv4=true \
    persist.telephony.support_ipv6=true \
    ro.cdma.data_retry_config=max_retries=infinite,0,0,60000,120000,480000,900000 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.telephony.ril.v3=datacall