################################################################################
#
# qt5serialport
#
################################################################################

QT5SERIALPORT_VERSION = $(QT5_VERSION)
QT5SERIALPORT_SITE = $(QT5_SITE)
QT5SERIALPORT_SOURCE = qtserialport-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALPORT_VERSION).tar.xz
QT5SERIALPORT_DEPENDENCIES = qt5base
QT5SERIALPORT_INSTALL_STAGING = YES
QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL

define QT5SERIALPORT_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
endef

define QT5SERIALPORT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5SERIALPORT_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

ifeq ($(BR2_STATIC_LIBS),)
define QT5SERIALPORT_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialPort.so.* $(TARGET_DIR)/usr/lib
endef
endif

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
define QT5SERIALPORT_INSTALL_TARGET_EXAMPLES
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/serialport $(TARGET_DIR)/usr/lib/qt/examples/
endef
endif

define QT5SERIALPORT_INSTALL_TARGET_CMDS
	$(QT5SERIALPORT_INSTALL_TARGET_LIBS)
	$(QT5SERIALPORT_INSTALL_TARGET_EXAMPLES)
endef

$(eval $(generic-package))
