TERMUX_PKG_HOMEPAGE=https://gitlab.com/AOMediaCodec/SVT-AV1
TERMUX_PKG_DESCRIPTION="Scalable Video Technology for AV1 (SVT-AV1 Encoder and Decoder)"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE.md, PATENTS.md"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.8.0"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${TERMUX_PKG_VERSION}/SVT-AV1-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=5be046efd5d5a5012e919249ee9e5791c9957f79f9d006d697882f02ad014f56
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_TESTING=OFF
-DCMAKE_OUTPUT_DIRECTORY=$TERMUX_PKG_BUILDDIR
"

termux_step_pre_configure() {
	LDFLAGS+=" -lm"
	case "${TERMUX_ARCH}" in
	x86_64) LDFLAGS+=" -llog" ;;
	esac
}
