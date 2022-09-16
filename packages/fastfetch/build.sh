TERMUX_PKG_HOMEPAGE=https://github.com/LinusDierheimer/fastfetch
TERMUX_PKG_DESCRIPTION="A neofetch-like tool for fetching system information and displaying them in a pretty way"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.7.2"
TERMUX_PKG_SRCURL=https://github.com/LinusDierheimer/fastfetch/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f0778cdc6d33f5399bb82a8689b816ec3ff1d6b3eb74488e88d7a92a0bd3f7b6
TERMUX_PKG_AUTO_UPDATE=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DTARGET_DIR_ROOT=${TERMUX_PREFIX}
-DTARGET_DIR_USR=${TERMUX_PREFIX}
-DTARGET_DIR_HOME=${TERMUX_ANDROID_HOME}
-DCMAKE_INSTALL_SYSCONFDIR=${TERMUX_PREFIX}/etc
-DENABLE_LIBPCI=OFF
-DENABLE_VULKAN=OFF
-DENABLE_WAYLAND=OFF
-DENABLE_XCB_RANDR=OFF
-DENABLE_XCB=OFF
-DENABLE_XRANDR=OFF
-DENABLE_X11=OFF
-DENABLE_GIO=OFF
-DENABLE_DCONF=OFF
-DENABLE_DBUS=OFF
-DENABLE_XFCONF=OFF
-DENABLE_RPM=OFF
"
