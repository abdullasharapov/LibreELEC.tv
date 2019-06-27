# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8821CU"
PKG_VERSION="26ac45b9fd7e8f952b0abe7cdca4244ee8e585d6"
PKG_SHA256="1d12d4ed205b2b7bcb7226333f7e403629926e53f714410747c836efb203ad26"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/brektrou/rtl8821CU/"
PKG_URL="https://github.com/brektrou/rtl8821CU/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL8821CU driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}

