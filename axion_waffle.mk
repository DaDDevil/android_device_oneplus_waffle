#
# Copyright (C) 2025
# AxionAOSP Device specific config
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from waffle device
$(call inherit-product, device/oneplus/waffle/device.mk)

# Inherit AxionAOSP common stuff. 
# 注意：如果 Axion 源码里的 vendor 路径不是 vendor/axion，你可能需要修改这里（例如 vendor/aosp/config/...）
$(call inherit-product, vendor/axion/config/common_full_phone.mk)

PRODUCT_NAME := axion_waffle
PRODUCT_DEVICE := waffle
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2573

TARGET_ENABLE_BLUR := true
TARGET_INCLUDE_AXFX := true

# Camera information (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 50,48,64
AXION_CAMERA_FRONT_INFO := 32

# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := DaDDevil

# Processor name (underscores become spaces)
AXION_PROCESSOR := SM8650

BYPASS_CHARGE_SUPPORTED := true
BYPASS_CHARGE_TOGGLE_PATH := /sys/class/oplus_chg/battery/mmi_charging_enable
# CPU governor support
PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := walt
PERF_ANIM_OVERRIDE := true

# High Brightness Mode (HBM)
HBM_SUPPORTED := true
HBM_NODE := /sys/kernel/oplus_display/hbm

TARGET_DOZE_TAP_PULSE_SUPPORTED ?= true
TARGET_DOZE_DOUBLE_TAP_PULSE_SUPPORTED ?= true
TARGET_DOZE_PICKUP_PULSE_SUPPORTED ?= true
TARGET_DOZE_SIDE_FPS_PULSE_SUPPORTED ?= true

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# AxionAOSP Specific System Properties
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.ax_debug_enabled=1 \
    ro.surface_flinger.supports_background_blur=1 \
    ro.sf.blurs_are_expensive=1 \
    persist.sys.perf.scroll_opt = true \
    persist.sys.perf.scroll_opt.heavy_app = 2

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi_64-user 16 BP2A.250605.015 1778932041995 release-keys" \
    BuildFingerprint=OnePlus/CPH2573IN/OP595DL1:16/BP2A.250605.015/U.R4T3.d7e7e8_16617e4_1655bfc:user/release-keys \
    DeviceName=OP595DL1 \
    DeviceProduct=CPH2573 \
    SystemDevice=OP595DL1 \
    SystemName=CPH2573
