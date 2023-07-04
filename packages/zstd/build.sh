TERMUX_PKG_HOMEPAGE=https://github.com/facebook/zstd
TERMUX_PKG_DESCRIPTION="Zstandard compression"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.5.5"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/facebook/zstd/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=98e9c3d949d1b924e28e01eccb7deed865eefebf25c2f21c702e5cd5b63b85e1
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="liblzma, zlib"
TERMUX_PKG_BREAKS="zstd-dev"
TERMUX_PKG_REPLACES="zstd-dev"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DZSTD_MULTITHREAD_SUPPORT=ON
-DZSTD_BUILD_PROGRAMS=ON
-DZSTD_BUILD_CONTRIB=ON
-DZSTD_PROGRAMS_LINK_SHARED=ON
-DZSTD_ZLIB_SUPPORT=ON
-DZSTD_LZMA_SUPPORT=ON
"

termux_step_pre_configure() {
	TERMUX_PKG_SRCDIR+="/build/cmake"

	# SOVERSION suffix is needed for backward compatibility. Do not remove
	# this (and the guards in the post-massage step) unless you know what
	# you are doing. `zstd` is a dependency of `apt` to which something
	# catastrophic could happen if you are careless.
	TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" -DCMAKE_SYSTEM_NAME=Linux"
}

termux_step_post_massage() {
	# Do not forget to bump revision of reverse dependencies and rebuild them
	# after SOVERSION is changed.
	local _SOVERSION_GUARD_FILES="lib/libzstd.so.1"
	local f
	for f in ${_SOVERSION_GUARD_FILES}; do
		if [ ! -e "${f}" ]; then
			termux_error_exit "SOVERSION guard check failed."
		fi
	done

	# Check if SONAME is properly set:
	if ! readelf -d lib/libzstd.so | grep -q '(SONAME).*\[libzstd\.so\.'; then
		termux_error_exit "SONAME for libzstd.so is not properly set."
	fi
}
