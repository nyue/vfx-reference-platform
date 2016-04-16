SET ( VFXRP_EP_PYTHON_UNDERSCORE_VERSION_STRING
  "${VFXRP_EP_PYTHON_VERSION_MAJOR_STRING}_${VFXRP_EP_PYTHON_VERSION_MINOR_STRING}_${VFXRP_EP_PYTHON_VERSION_PATCH_STRING}" )
SET ( VFXRP_EP_PYTHON_2DOT_VERSION_STRING
  "${VFXRP_EP_PYTHON_VERSION_MAJOR_STRING}.${VFXRP_EP_PYTHON_VERSION_MINOR_STRING}.${VFXRP_EP_PYTHON_VERSION_PATCH_STRING}" )
SET ( VFXRP_EP_PYTHON_1DOT_VERSION_STRING
  "${VFXRP_EP_PYTHON_VERSION_MAJOR_STRING}.${VFXRP_EP_PYTHON_VERSION_MINOR_STRING}" )

ExternalProject_Add ( python_${VFXRP_EP_PYTHON_UNDERSCORE_VERSION_STRING}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/Python-${VFXRP_EP_PYTHON_2DOT_VERSION_STRING}.${VFXRP_EP_PYTHON_ARCHIVE_EXTENSION}
  CONFIGURE_COMMAND env CPPFLAGS=-fPIC <SOURCE_DIR>/configure
  --enable-unicode=${VFXRP_EP_PYTHON_UNICODE_BTYE_COUNT_STRING}
  --prefix=<INSTALL_DIR>/python/${VFXRP_EP_PYTHON_2DOT_VERSION_STRING}
  BUILD_COMMAND make -j${VFXRP_NUM_PROCESSORS}
  )