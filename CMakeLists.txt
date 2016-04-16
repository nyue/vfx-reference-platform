CMAKE_MINIMUM_REQUIRED ( VERSION 2.8 )

PROJECT ( VFXReferencePlatform )

SET ( VFXRP_EP_SOFTWARE_ARCHIVE_URI "file:///home/nicholas/Downloads/VFX-Reference-Platform" )

# Load various utilities
INCLUDE ( cmake/Utils.cmake )

# ADD_SUBDIRECTORY ( CY2014 )
# ADD_SUBDIRECTORY ( CY2015 )
ADD_SUBDIRECTORY ( CY2016 )
