TERMUX_PKG_HOMEPAGE=http://www.ivarch.com/programs/pv.shtml
TERMUX_PKG_DESCRIPTION="Terminal-based tool for monitoring the progress of data through a pipeline"
TERMUX_PKG_LICENSE="Artistic-License-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.8.12"
TERMUX_PKG_SRCURL=http://www.ivarch.com/programs/sources/pv-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9687f9deedb09d0dc00d80c30691f0c91282c0d5d8fa7d6a2a085c8742c2cd7c
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-ipc"
