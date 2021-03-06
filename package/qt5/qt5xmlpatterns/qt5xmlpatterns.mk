################################################################################
#
# qt5xmlpatterns
#
################################################################################

QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
QT5XMLPATTERNS_SITE = $(QT5_SITE)
QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5XMLPATTERNS_VERSION).tar.xz
QT5XMLPATTERNS_DEPENDENCIES = qt5base
QT5XMLPATTERNS_INSTALL_STAGING = YES
QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
endif

define QT5XMLPATTERNS_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
endef

define QT5XMLPATTERNS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

ifeq ($(BR2_STATIC_LIBS),)
define QT5XMLPATTERNS_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5XmlPatterns*.so.* $(TARGET_DIR)/usr/lib
endef
endif

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
define QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/xmlpatterns $(TARGET_DIR)/usr/lib/qt/examples/
endef
endif

define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
	$(QT5XMLPATTERNS_INSTALL_TARGET_LIBS)
	$(QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES)
endef

$(eval $(generic-package))
