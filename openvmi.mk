#
# Copyright (C) 2013 The Android Open-Source Project
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

PRODUCT_PACKAGES += \
	egl.cfg \
	gralloc.goldfish \
	libGLESv1_CM_emulation \
	lib_renderControl_enc \
	libEGL_emulation \
	libGLES_android \
	libGLESv2_enc \
	libOpenglSystemCommon \
	libGLESv2_emulation \
	libGLESv1_enc \
	qemu-props \
	qemud \
	camera.goldfish \
	camera.goldfish.jpeg \
	lights.goldfish \
	gps.goldfish \
	fingerprint.goldfish \
	sensors.goldfish \
	audio.primary.goldfish \
	vibrator.goldfish \
	power.goldfish \
	fingerprintd

PRODUCT_PACKAGES += \
	Launcher3

PRODUCT_COPY_FILES += \
	vendor/openvmi/android/fstab.goldfish:root/fstab.goldfish \
	vendor/openvmi/android/init.goldfish.rc:root/init.goldfish.rc \
	vendor/openvmi/android/init.goldfish.sh:system/etc/init.goldfish.sh \
	vendor/openvmi/android/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
	vendor/openvmi/android/media/media_profiles.xml:system/etc/media_profiles.xml \
	vendor/openvmi/android/media/media_codecs.xml:system/etc/media_codecs.xml \
	vendor/openvmi/android/media/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	vendor/openvmi/android/media/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	vendor/openvmi/android/media/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
	vendor/openvmi/android/media/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	hardware/libhardware_legacy/audio/audio_policy.conf:system/etc/audio_policy.conf \
	vendor/openvmi/android/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	        vendor/openvmi/android/openvmi-touch.idc:system/usr/idc/openvmi-touch.idc

PRODUCT_CHARACTERISTICS := emulator

# Include drawables for all densities
PRODUCT_AAPT_CONFIG := normal xhdpi

PRODUCT_COPY_FILES += \
	vendor/openvmi/scripts/openvmi-init.sh:root/openvmi-init.sh \
	device/openvmi/openvmi.xml:system/etc/permissions/openvmi.xml

PRODUCT_PACKAGES += \
	openvmid \
	hwcomposer.openvmi \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware=goldfish \
	ro.hardware.hwcomposer=openvmi \
	ro.kernel.qemu.gles=1 \
	ro.kernel.qemu=1
	ro.adb.qemud=1

# Disable any software key elements in the UI
PRODUCT_PROPERTY_OVERRIDES += \
	qemu.hw.mainkeys=0

# Let everything know we're running inside a container
PRODUCT_PROPERTY_OVERRIDES += \
	ro.openvmi=1 \
	ro.boot.container=1

# We don't want telephony support for now
PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes

# Disable boot-animation permanently
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.nobootanimation=1

DEVICE_PACKAGE_OVERLAYS += \
	device/openvmi/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
# Extend heap size we use for dalvik/art runtime
#$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
	device/openvmi/openvmi.xml:system/etc/permissions/openvmi.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

#设置语言与时区为中国
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.language=zh \
	persist.sys.country=CN \
	persist.sys.localevar=""\
	persist.sys.timezone=Asia/Shanghai \
	ro.product.locale.language=zh \
	ro.product.locale.region=CN

