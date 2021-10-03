TERMUX_PKG_HOMEPAGE=https://libgit2.github.com/
TERMUX_PKG_DESCRIPTION="C library implementing Git core methods"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.3.0
TERMUX_PKG_SRCURL=https://github.com/libgit2/libgit2/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256=192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e
TERMUX_PKG_DEPENDS="libcurl, openssl, libssh2, zlib, libiconv"
TERMUX_PKG_BREAKS="libgit2-dev"
TERMUX_PKG_REPLACES="libgit2-dev"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DBUILD_CLAR=OFF"
