PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0

LINEAGE_VERSION_APPEND_TIME_OF_DAY ?= true
ifeq ($(LINEAGE_VERSION_APPEND_TIME_OF_DAY),true)
    LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set LINEAGE_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

LINEAGE_BUILDTYPE ?= COMMUNITY


ifeq ($(WITH_GMS), true)
    ifeq ($(TARGET_CORE_GMS), true)
       RISING_PACKAGE_TYPE ?= CORE
    else
       RISING_PACKAGE_TYPE ?= PIXEL
    endif
else
       RISING_PACKAGE_TYPE ?= AOSP
endif

LINEAGE_VERSION_SUFFIX := $(LINEAGE_BUILD_DATE)-$(LINEAGE_BUILDTYPE)-$(RISING_PACKAGE_TYPE)-$(LINEAGE_BUILD)

# Internal version
LINEAGE_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_VERSION_SUFFIX)

# Display version
LINEAGE_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(LINEAGE_VERSION_SUFFIX)
