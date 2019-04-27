TERMUX_PKG_HOMEPAGE=https://www.duktape.org/
TERMUX_PKG_DESCRIPTION="Shared library for the Duktape interpreter"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=2.3.0
TERMUX_PKG_BUILD_DEPENDS="python, python2"
TERMUX_PKG_SKIP_SRC_EXTRACT=1
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_extract_package() {
	git clone --depth=1 https://github.com/svaarala/duktape.git -b ${TERMUX_PKG_VERSION} ${TERMUX_PKG_SRCDIR}
}

termux_step_pre_configure() {
	CFLAGS+=" -fPIC"
}

termux_step_make() {
	make libduktape.so.1.0.0
}

termux_step_make_install() {
	cp libduktape.so ${TERMUX_PREFIX}/lib
}

termux_step_post_make_install() {
	# Add a pkg-config file for the system zlib
	cat > "$PKG_CONFIG_LIBDIR/lua.pc" <<-HERE
		Name: Duktape
		Description: Shared library for the Duktape interpreter
		Version: $TERMUX_PKG_VERSION
		Requires:
		Libs: -lduktape -lm
	HERE
}
