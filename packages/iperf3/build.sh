TERMUX_PKG_HOMEPAGE=https://github.com/esnet/iperf
TERMUX_PKG_DESCRIPTION="TCP, UDP, and SCTP network bandwidth measurement tool"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=3.16
TERMUX_PKG_SRCURL=https://fossies.org/linux/privat/iperf-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=bdb77c11f72bce90214883159577fa24412013e62b2083cf5f54391d79b1d8ff
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_BREAKS="iperf3-dev"
TERMUX_PKG_REPLACES="iperf3-dev"
