# yue.nicholas@gmail.com

CMAKE_MINIMUM_REQUIRED ( VERSION 2.8 )

PROJECT ( VFXReferencePlatform )

# Just to be sure as it will be use by Qt for deployment if set
# Otherwise, it will be set by Qt's internal heuristic for the correct location
UNSET ( ENV{INSTALL_ROOT} PARENT_SCOPE )

SET_DIRECTORY_PROPERTIES ( PROPERTIES
  EP_PREFIX ${CMAKE_INSTALL_PREFIX}
  )

INCLUDE ( ExternalProject )

IF ( VFXRP_EP_SOFTWARE_ARCHIVE_URI )
  # "file:///home/nicholas/Downloads/VFX-Reference-Platform" )
  IF ( NOT VFXRP_EP_PYTHON_UNICODE_BTYE_COUNT_STRING )
	SET ( VFXRP_EP_PYTHON_UNICODE_BTYE_COUNT_STRING "ucs4" )
  ENDIF ()
  # Load various utilities
  INCLUDE ( cmake/Utils.cmake )
  
  # ADD_SUBDIRECTORY ( CY2014 )
  ADD_SUBDIRECTORY ( CY2015 )
  # ADD_SUBDIRECTORY ( CY2016 )
  
ENDIF ()