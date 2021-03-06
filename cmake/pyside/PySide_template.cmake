ExternalProject_Add ( Shiboken_${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}_${VFXRP_EP_SHIBOKEN_VERSION_MINOR}_${VFXRP_EP_SHIBOKEN_VERSION_PATCH}
  DEPENDS
  python_${VFXRP_EP_PYTHON_VERSION_MAJOR}_${VFXRP_EP_PYTHON_VERSION_MINOR}_${VFXRP_EP_PYTHON_VERSION_PATCH}
  Qt_4_${VFXRP_EP_QT_VERSION_MINOR}_${VFXRP_EP_QT_VERSION_PATCH}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/Shiboken-${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}.${VFXRP_EP_SHIBOKEN_VERSION_MINOR}.${VFXRP_EP_SHIBOKEN_VERSION_PATCH}.tar.gz
  CMAKE_CACHE_ARGS
  -DCMAKE_INSTALL_PREFIX:STRING=<INSTALL_DIR>/shiboken/v${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}.${VFXRP_EP_SHIBOKEN_VERSION_MINOR}.${VFXRP_EP_SHIBOKEN_VERSION_PATCH}
  -DQT_QMAKE_EXECUTABLE:STRING=<INSTALL_DIR>/qt/v4.${VFXRP_EP_QT_VERSION_MINOR}.${VFXRP_EP_QT_VERSION_PATCH}/bin/qmake
  -DPYTHON_EXECUTABLE:STRING=<INSTALL_DIR>/python/v${VFXRP_EP_PYTHON_VERSION_MAJOR}.${VFXRP_EP_PYTHON_VERSION_MINOR}.${VFXRP_EP_PYTHON_VERSION_PATCH}/bin/python${VFXRP_EP_PYTHON_VERSION_MAJOR}.${VFXRP_EP_PYTHON_VERSION_MINOR}
  -DPYTHON_LIBRARY:STRING=<INSTALL_DIR>/python/v${VFXRP_EP_PYTHON_VERSION_MAJOR}.${VFXRP_EP_PYTHON_VERSION_MINOR}.${VFXRP_EP_PYTHON_VERSION_PATCH}/lib/libpython${VFXRP_EP_PYTHON_VERSION_MAJOR}.${VFXRP_EP_PYTHON_VERSION_MINOR}.a
  BUILD_COMMAND make -j ${VFXRP_NUM_PROCESSORS}
  )

# Depends on Shiboken
ExternalProject_Add ( PySide_${VFXRP_EP_PYSIDE_VERSION_MAJOR}_${VFXRP_EP_PYSIDE_VERSION_MINOR}_${VFXRP_EP_PYSIDE_VERSION_PATCH}
  DEPENDS
  Shiboken_${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}_${VFXRP_EP_SHIBOKEN_VERSION_MINOR}_${VFXRP_EP_SHIBOKEN_VERSION_PATCH}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/PySide-${VFXRP_EP_PYSIDE_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_VERSION_MINOR}.${VFXRP_EP_PYSIDE_VERSION_PATCH}.tar.gz
  CMAKE_CACHE_ARGS
  -DQT_QMAKE_EXECUTABLE:STRING=<INSTALL_DIR>/qt/v4.${VFXRP_EP_QT_VERSION_MINOR}.${VFXRP_EP_QT_VERSION_PATCH}/bin/qmake
  -DCMAKE_PREFIX_PATH:STRING=<INSTALL_DIR>/shiboken/v${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}.${VFXRP_EP_SHIBOKEN_VERSION_MINOR}.${VFXRP_EP_SHIBOKEN_VERSION_PATCH}/lib/cmake/Shiboken-${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}.${VFXRP_EP_SHIBOKEN_VERSION_MINOR}.${VFXRP_EP_SHIBOKEN_VERSION_PATCH}
  -DCMAKE_INSTALL_PREFIX:STRING=<INSTALL_DIR>/pyside/v${VFXRP_EP_PYSIDE_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_VERSION_MINOR}.${VFXRP_EP_PYSIDE_VERSION_PATCH}
  BUILD_COMMAND make -j ${VFXRP_NUM_PROCESSORS}
  )

# Depends on both Shiboken and PySide
ExternalProject_Add ( PySide_Tools_${VFXRP_EP_PYSIDE_TOOLS_VERSION_MAJOR}_${VFXRP_EP_PYSIDE_TOOLS_VERSION_MINOR}_${VFXRP_EP_PYSIDE_TOOLS_VERSION_PATCH}
  DEPENDS
  PySide_${VFXRP_EP_PYSIDE_VERSION_MAJOR}_${VFXRP_EP_PYSIDE_VERSION_MINOR}_${VFXRP_EP_PYSIDE_VERSION_PATCH}
  Shiboken_${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}_${VFXRP_EP_SHIBOKEN_VERSION_MINOR}_${VFXRP_EP_SHIBOKEN_VERSION_PATCH}
  URL
  ${VFXRP_EP_SOFTWARE_ARCHIVE_URI}/Tools-${VFXRP_EP_PYSIDE_TOOLS_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_TOOLS_VERSION_MINOR}.${VFXRP_EP_PYSIDE_TOOLS_VERSION_PATCH}.tar.gz
  CMAKE_CACHE_ARGS
  -DQT_QMAKE_EXECUTABLE:STRING=<INSTALL_DIR>/qt/v4.${VFXRP_EP_QT_VERSION_MINOR}.${VFXRP_EP_QT_VERSION_PATCH}/bin/qmake
  -DCMAKE_PREFIX_PATH:STRING=<INSTALL_DIR>/shiboken/v${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}.${VFXRP_EP_SHIBOKEN_VERSION_MINOR}.${VFXRP_EP_SHIBOKEN_VERSION_PATCH}/lib/cmake/Shiboken-${VFXRP_EP_SHIBOKEN_VERSION_MAJOR}.${VFXRP_EP_SHIBOKEN_VERSION_MINOR}.${VFXRP_EP_SHIBOKEN_VERSION_PATCH};<INSTALL_DIR>/pyside/v${VFXRP_EP_PYSIDE_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_VERSION_MINOR}.${VFXRP_EP_PYSIDE_VERSION_PATCH}/lib/cmake/PySide-${VFXRP_EP_PYSIDE_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_VERSION_MINOR}.${VFXRP_EP_PYSIDE_VERSION_PATCH}
  -DCMAKE_INSTALL_PREFIX:STRING=<INSTALL_DIR>/tools/v${VFXRP_EP_PYSIDE_TOOLS_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_TOOLS_VERSION_MINOR}.${VFXRP_EP_PYSIDE_TOOLS_VERSION_PATCH}
  -DQMAKE_EXECUTABLE:STRING=<INSTALL_DIR>/qt/v4.${VFXRP_EP_QT_VERSION_MINOR}.${VFXRP_EP_QT_VERSION_PATCH}/bin/qmake
  -DCMAKE_INSTALL_PREFIX:STRING=<INSTALL_DIR>/tools/v${VFXRP_EP_PYSIDE_TOOLS_VERSION_MAJOR}.${VFXRP_EP_PYSIDE_TOOLS_VERSION_MINOR}.${VFXRP_EP_PYSIDE_TOOLS_VERSION_PATCH}
  BUILD_COMMAND make -j ${VFXRP_NUM_PROCESSORS}
  )
