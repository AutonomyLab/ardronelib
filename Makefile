SDK_PATH:=$(shell pwd)/ARDroneLib
PC_TARGET=yes
USE_LINUX=yes
USE_ARMV7=yes


ifdef MYKONOS
   include $(ARDRONE_CUSTOM_CONFIG)
   include $(ARDRONE_BUILD_CONFIG)
else
   include $(SDK_PATH)/Soft/Build/custom.makefile
   include $(SDK_PATH)/Soft/Build/config.makefile
endif

$(SDK_TARGET_DIR)

SDK_FLAGS+="USE_APP=no"
SDK_FLAGS+="USE_LIB=yes"
SDK_FLAGS+="USE_LINUX=yes"
SDK_FLAGS+="USE_ARMV7=yes"


all: 
	@$(MAKE) -C $(SDK_PATH)/Soft/Build $(TMP_SDK_FLAGS) $(SDK_FLAGS) $(MAKECMDGOALS)
	@$(MAKE) -C $(SDK_PATH)/VP_SDK/Build $(TMP_SDK_FLAGS) $(SDK_FLAGS) $(MAKECMDGOALS)
              
install:
	mkdir -p ${INSTALL_PREFIX}
	find $(SDK_PATH)/Soft/Build -type f -name '*.a' -exec cp '{}' ${INSTALL_PREFIX} \;
