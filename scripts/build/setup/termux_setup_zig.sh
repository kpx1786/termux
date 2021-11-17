termux_setup_zig() {
	local ZIG_VERSION=0.8.1
	local ZIG_FOLDER

	if [ "${TERMUX_PACKAGES_OFFLINE-false}" = "true" ]; then
		ZIG_FOLDER=${TERMUX_SCRIPTDIR}/build-tools/zig-${ZIG_VERSION}
	else
		ZIG_FOLDER=${TERMUX_COMMON_CACHEDIR}/zig-$ZIG_VERSION
	fi

	if [ "$TERMUX_ON_DEVICE_BUILD" = "false" ]; then
		if [ ! -x "$ZIG_FOLDER/zig" ]; then
			mkdir -p "$ZIG_FOLDER"
			local ZIG_TARBALL=$TERMUX_PKG_TMPDIR/zig-$ZIG_VERSION.zip
			termux_download https://ziglang.org/download/$ZIG_VERSION/zig-linux-x86_64-$ZIG_VERSION.tar.xz \
				"$ZIG_TARBALL" \
				6c032fc61b5d77a3f3cf781730fa549f8f059ffdb3b3f6ad1c2994d2b2d87983
			tar xf "$ZIG_TARBALL" -C "$ZIG_FOLDER"
		fi
		export PATH=$ZIG_FOLDER:$PATH
	else
		local ZIG_PKG_VERSION=$(bash -c ". $TERMUX_SCRIPTDIR/packages/zig/build.sh; echo \$TERMUX_PKG_VERSION")
		if ([ ! -e "$TERMUX_BUILT_PACKAGES_DIRECTORY/zig" ] ||
		    [ "$(cat "$TERMUX_BUILT_PACKAGES_DIRECTORY/zig")" != "$ZIG_PKG_VERSION" ]) &&
		   [ "$(dpkg-query -W -f '${db:Status-Status}\n' zig 2>/dev/null)" != "installed" ]; then
			echo "Package 'zig' is not installed."
			echo "You can install it with"
			echo
			echo "  pkg install zig"
			echo
			echo "or build it from source with"
			echo
			echo "  ./build-package.sh zig"
			echo
			exit 1
		fi
	fi
}
