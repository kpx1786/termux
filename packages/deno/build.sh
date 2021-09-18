TERMUX_PKG_HOMEPAGE=https://github.com/denoland/deno
TERMUX_PKG_DESCRIPTION="A secure JavaScript and TypeScript runtime"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@leapofazzam123"
TERMUX_PKG_VERSION=1.14.0
TERMUX_PKG_SRCURL=https://github.com/denoland/deno/releases/download/v${TERMUX_PKG_VERSION}/deno_src.tar.gz
TERMUX_PKG_SHA256=56f370825f019e4bdb95f354a49576c057f90ef1cc07b7491566763b2147edc6
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BUILD_DEPENDS="glib"

termux_step_make() {
	termux_setup_rust
	termux_setup_gn
	export GN_ARGS='target_os="android"'
	if [[ $TERMUX_ARCH == "arm" ]]; then
		GN_ARGS+=' target_cpu="arm"'
	elif [[ $TERMUX_ARCH == "aarch64" ]]; then
		GN_ARGS+=' target_cpu="arm64"'
	elif [[ $TERMUX_ARCH == "i686" ]]; then
		GN_ARGS+=' target_cpu="x86"'
	elif [[ $TERMUX_ARCH == "x86_64" ]]; then
		GN_ARGS+=' target_cpu="x64"'
	fi
	V8_FROM_SOURCE=1 cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/deno
}
