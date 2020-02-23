TERMUX_PKG_HOMEPAGE=http://dirb.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Web Directory Fuzzer."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Rabby Sheikh @xploitednoob"
TERMUX_PKG_VERSION=2.22
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/dirb/files/dirb/${TERMUX_PKG_VERSION}/dirb${TERMUX_PKG_VERSION/./}.tar.gz
TERMUX_PKG_SHA256=f3748ade231ca211a01acbec31cc6a3b576f6c56c906d73329d7dbb79f60fc2c
TERMUX_PKG_DEPENDS="libcurl"

termux_step_post_extract_package() {
	# dirb222.tar.gz has directory permission problem
	chmod +x "$TERMUX_PKG_SRCDIR"
	chmod +x "$TERMUX_PKG_SRCDIR"/*
	chmod +x "$TERMUX_PKG_SRCDIR"/*/*
	chmod +x "$TERMUX_PKG_SRCDIR"/*/*/*
}
termux_step_post_make_install() {
	mkdir -p "$TERMUX_PREFIX"/share/dirb
	cp -rf  "$TERMUX_PKG_SRCDIR"/wordlists "$TERMUX_PREFIX"/share/dirb/wordlists
}


