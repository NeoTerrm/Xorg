TERMUX_PKG_HOMEPAGE=https://github.com/NeoTerm/XServer
TERMUX_PKG_DESCRIPTION="Xorg XServer JNI libraries for NeoTerm"
TERMUX_PKG_VERSION=1.6.2
TERMUX_PKG_MAINTAINER="Kiva @zt515"
TERMUX_PKG_DEPENDS="xorg-neoterm-data-common"

termux_step_make_install() {
    local URL_ARCH
    
    case "$TERMUX_ARCH" in
		aarch64 ) URL_ARCH="arm64-v8a" ;;
		arm ) URL_ARCH="armeabi-v7a" ;;
		* ) echo "Unsupported arch: $TERMUX_ARCH"; exit 1 ;;
	esac
	
	local target_lib=$TERMUX_PREFIX/lib
	
	cp -rp $TERMUX_PKG_BUILDER_DIR/$URL_ARCH $target_lib/
}


