################################################################################
#
# armadillo
#
################################################################################

ARMADILLO_VERSION = 9.850.1
ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
ARMADILLO_DEPENDENCIES = clapack
ARMADILLO_INSTALL_STAGING = YES
ARMADILLO_LICENSE = MPL-2.0
ARMADILLO_LICENSE_FILES = LICENSE.txt

$(eval $(cmake-package))
