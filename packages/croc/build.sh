TERMUX_PKG_HOMEPAGE=https://github.com/schollz/croc
TERMUX_PKG_DESCRIPTION="Easily and securely send things from one computer to another."
TERMUX_PKG_LICENSE=MIT
TERMUX_PKG_VERSION=8.5.0
TERMUX_PKG_SRCURL=https://github.com/schollz/croc/releases/download/v${TERMUX_PKG_VERSION}/croc_${TERMUX_PKG_VERSION}_src.tar.gz
TERMUX_PKG_SHA256=54cad5b72a8099d879c69d9d4bb5e190bd4f861b4ccab509afdae5ffbd23d141
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	cd $TERMUX_PKG_SRCDIR

	termux_setup_golang

	go build -o croc -trimpath
}

termux_step_make_install() {
	install -m755 croc $TERMUX_PREFIX/bin/croc
}
