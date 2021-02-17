ARCHS = armv7 armv7s arm64 arm64e
PACKAGE_VERSION = 0.5a

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppCake2

AppCake2_FILES = Tweak.xm
AppCake2_FRAMEWORKS = UIKit
AppCake2_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
#SUBPROJECTS += appcake2
include $(THEOS_MAKE_PATH)/aggregate.mk
