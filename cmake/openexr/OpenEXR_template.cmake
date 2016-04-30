SET ( VFXRP_EP_OPENEXR_2DOT_VERSION_STRING
  "${VFXRP_EP_OPENEXR_VERSION_MAJOR}.${VFXRP_EP_OPENEXR_VERSION_MINOR}.${VFXRP_EP_OPENEXR_VERSION_PATCH}"
  )
SET ( VFXRP_EP_OPENEXR_UNDERSCORE_VERSION_STRING
  "${VFXRP_EP_OPENEXR_VERSION_MAJOR}_${VFXRP_EP_OPENEXR_VERSION_MINOR}_${VFXRP_EP_OPENEXR_VERSION_PATCH}"
  )

SET ( VFXRP_EP_ILMBASE_2DOT_VERSION_STRING
  "${VFXRP_EP_ILMBASE_VERSION_MAJOR}.${VFXRP_EP_ILMBASE_VERSION_MINOR}.${VFXRP_EP_ILMBASE_VERSION_PATCH}"
  )
SET ( VFXRP_EP_ILMBASE_UNDERSCORE_VERSION_STRING
  "${VFXRP_EP_ILMBASE_VERSION_MAJOR}_${VFXRP_EP_ILMBASE_VERSION_MINOR}_${VFXRP_EP_ILMBASE_VERSION_PATCH}"
  )

SET ( VFXRP_EP_PYILMBASE_2DOT_VERSION_STRING
  "${VFXRP_EP_PYILMBASE_VERSION_MAJOR}.${VFXRP_EP_PYILMBASE_VERSION_MINOR}.${VFXRP_EP_PYILMBASE_VERSION_PATCH}"
  )
SET ( VFXRP_EP_PYILMBASE_UNDERSCORE_VERSION_STRING
  "${VFXRP_EP_PYILMBASE_VERSION_MAJOR}_${VFXRP_EP_PYILMBASE_VERSION_MINOR}_${VFXRP_EP_PYILMBASE_VERSION_PATCH}"
  )

ExternalProject_Add ( ilmbase_${VFXRP_EP_ILMBASE_UNDERSCORE_VERSION_STRING}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/ilmbase-${VFXRP_EP_ILMBASE_2DOT_VERSION_STRING}.tar.gz
  CONFIGURE_COMMAND env CPPFLAGS=-fPIC <SOURCE_DIR>/configure
  --disable-ilmbasetest
  --prefix=<INSTALL_DIR>/OpenEXR/v${VFXRP_EP_OPENEXR_2DOT_VERSION_STRING}
  BUILD_COMMAND make -j${VFXRP_NUM_PROCESSORS}
  )

ExternalProject_Add ( pyilmbase_${VFXRP_EP_PYILMBASE_UNDERSCORE_VERSION_STRING}
  DEPENDS
  ilmbase_${VFXRP_EP_ILMBASE_UNDERSCORE_VERSION_STRING}
  boost_${VFXRP_EP_BOOST_VERSION_MAJOR}_${VFXRP_EP_BOOST_VERSION_MINOR}_0_using_python_${VFXRP_EP_PYTHON_VERSION_MAJOR}_${VFXRP_EP_PYTHON_VERSION_MINOR}_${VFXRP_EP_PYTHON_VERSION_PATCH}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/pyilmbase-${VFXRP_EP_PYILMBASE_2DOT_VERSION_STRING}.tar.gz
  CONFIGURE_COMMAND env CPPFLAGS=-fPIC PATH=<INSTALL_DIR>/python/v${VFXRP_EP_PYTHON_2DOT_VERSION_STRING}/bin:$ENV{PATH} <SOURCE_DIR>/configure
  --disable-ilmbasetest
  --with-boost-include-dir=<INSTALL_DIR>/boost/v${VFXRP_EP_BOOST_VERSION_MAJOR}_${VFXRP_EP_BOOST_VERSION_MINOR}/include
  --with-boost-lib-dir=<INSTALL_DIR>/boost/v${VFXRP_EP_BOOST_VERSION_MAJOR}_${VFXRP_EP_BOOST_VERSION_MINOR}/lib
  --with-ilmbase-prefix=<INSTALL_DIR>/OpenEXR/v${VFXRP_EP_OPENEXR_2DOT_VERSION_STRING}
  --prefix=<INSTALL_DIR>/OpenEXR/v${VFXRP_EP_OPENEXR_2DOT_VERSION_STRING}
  BUILD_COMMAND make -j${VFXRP_NUM_PROCESSORS}
  )

ExternalProject_Add ( openexr_${VFXRP_EP_OPENEXR_UNDERSCORE_VERSION_STRING}
  DEPENDS
  ilmbase_${VFXRP_EP_ILMBASE_UNDERSCORE_VERSION_STRING}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/openexr-${VFXRP_EP_OPENEXR_2DOT_VERSION_STRING}.tar.gz
  CONFIGURE_COMMAND env CPPFLAGS=-fPIC <SOURCE_DIR>/configure
  --disable-ilmbasetest
  --with-ilmbase-prefix=<INSTALL_DIR>/OpenEXR/v${VFXRP_EP_OPENEXR_2DOT_VERSION_STRING}
  --prefix=<INSTALL_DIR>/OpenEXR/v${VFXRP_EP_OPENEXR_2DOT_VERSION_STRING}
  BUILD_COMMAND make -j${VFXRP_NUM_PROCESSORS}
  )
