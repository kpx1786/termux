TERMUX_PKG_HOMEPAGE=https://clang.llvm.org/
TERMUX_PKG_DESCRIPTION="Modular compiler and toolchain technologies library"
_PKG_MAJOR_VERSION=6.0
TERMUX_PKG_VERSION=${_PKG_MAJOR_VERSION}.0
TERMUX_PKG_REVISION=3
TERMUX_PKG_SHA256=6b8c4a833cf30230c0213d78dbac01af21387b298225de90ab56032ca79c0e0b
TERMUX_PKG_SRCURL=https://releases.llvm.org/${TERMUX_PKG_VERSION}/lld-${TERMUX_PKG_VERSION}.src.tar.xz
TERMUX_PKG_DEPENDS="libllvm"
# Replace gcc since gcc is deprecated by google on android and is not maintained upstream.
# Conflict with clang versions earlier than 3.9.1-3 since they bundled llvm.
# See http://llvm.org/docs/CMake.html:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DPYTHON_EXECUTABLE=`which python`
-DLLVM_LINK_LLVM_DYLIB=ON
-DLLVM_ENABLE_PIC=ON
-DLLVM_ENABLE_LIBEDIT=ON
-DLLVM_BUILD_TESTS=OFF
-DLLVM_INCLUDE_TESTS=OFF
-DCLANG_DEFAULT_CXX_STDLIB=libc++
-DCLANG_INCLUDE_TESTS=OFF
-DCLANG_TOOL_C_INDEX_TEST_BUILD=OFF
-DC_INCLUDE_DIRS=$TERMUX_PREFIX/include
-DLLVM_LINK_LLVM_DYLIB=ON
-DLLVM_TABLEGEN=$TERMUX_PKG_HOSTBUILD_DIR/bin/llvm-tblgen
-DLIBOMP_ENABLE_SHARED=FALSE
-DOPENMP_ENABLE_LIBOMPTARGET=OFF
-DLLVM_BINUTILS_INCDIR=$TERMUX_PREFIX/include
-DLLVM_ENABLE_SPHINX=ON
-DSPHINX_OUTPUT_MAN=ON
-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly
-DPERL_EXECUTABLE=$(which perl)
-DLLVM_ENABLE_FFI=ON
-DLLVM_ENABLE_PEDANTIC=OFF
-DLLVM_CONFIG=$TERMUX_PREFIX/bin/llvm-config
-DLLVM_CMAKE_PATH=$TERMUX_PREFIX/lib/cmake/llvm
"
TERMUX_PKG_FORCE_CMAKE=yes
TERMUX_PKG_KEEP_STATIC_LIBRARIES=true

termux_step_pre_configure() {
	LDFLAGS+=" -lLLVM"
}
