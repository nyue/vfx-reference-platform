ExternalProject_Add ( Qt_4_${VFXRP_EP_QT_VERSION_MINOR}_${VFXRP_EP_QT_VERSION_PATCH}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/qt-everywhere-opensource-src-4.${VFXRP_EP_QT_VERSION_MINOR}.${VFXRP_EP_QT_VERSION_PATCH}.tar.gz
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
  -prefix <INSTALL_DIR>/qt/v4.${VFXRP_EP_QT_VERSION_MINOR}.${VFXRP_EP_QT_VERSION_PATCH}
  -confirm-license -opensource
  -separate-debug-info -stl -no-rpath -no-qt3support -no-webkit -qt-sql-mysql
  -plugin-sql-psql -plugin-sql-sqlite -phonon
  -I/usr/include/gstreamer-0.10 -I/usr/include/glib-2.0
  -I/usr/lib64/glib-2.0/include -I/usr/include/libxml2
  BUILD_COMMAND env INSTALL_ROOT= LD_LIBRARY_PATH=<SOURCE_DIR>/lib:$LD_LIBRARY_PATH make -j${VFXRP_NUM_PROCESSORS} install
  BUILD_IN_SOURCE 1
  )
