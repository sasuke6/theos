ifeq ($(_THEOS_TARGET_LOADED),)
_THEOS_TARGET_LOADED := 1
THEOS_TARGET_NAME := iphone

SDKTARGET ?= arm-apple-darwin9
SDKBINPATH ?= /usr/bin
SYSROOT ?= /var/sdk
ISYSROOT ?= $(SYSROOT)

PREFIX := $(SDKBINPATH)/$(SDKTARGET)-

TARGET_CC ?= $(PREFIX)gcc
TARGET_CXX ?= $(PREFIX)g++
TARGET_LD ?= $(PREFIX)g++
TARGET_STRIP ?= strip
TARGET_STRIP_FLAGS ?= -x
TARGET_CODESIGN_ALLOCATE ?= codesign_allocate
TARGET_CODESIGN ?= ldid
TARGET_CODESIGN_FLAGS ?= -S

TARGET_PRIVATE_FRAMEWORK_PATH = $(SYSROOT)/System/Library/PrivateFrameworks
TARGET_PRIVATE_FRAMEWORK_INCLUDE_PATH = $(ISYSROOT)/System/Library/PrivateFrameworks

include $(THEOS_MAKE_PATH)/targets/_common/darwin.mk
include $(THEOS_MAKE_PATH)/targets/_common/darwin_flat_bundle.mk

SDKFLAGS :=
_THEOS_TARGET_CFLAGS := -isysroot $(ISYSROOT) $(SDKFLAGS)
_THEOS_TARGET_LDFLAGS := -isysroot $(SYSROOT) $(SDKFLAGS) -multiply_defined suppress

TARGET_INSTALL_REMOTE := $(_THEOS_FALSE)
_THEOS_TARGET_DEFAULT_PACKAGE_FORMAT := deb
endif
