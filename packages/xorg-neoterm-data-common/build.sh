TERMUX_PKG_HOMEPAGE=https://github.com/NeoTerm/XServer
TERMUX_PKG_DESCRIPTION="Xorg data files"
TERMUX_PKG_VERSION=1.6.2
TERMUX_PKG_MAINTAINER="Kiva @zt515"
TERMUX_PKG_PLATFORM_INDEPENDENT=yes

# Keep locales
TERMUX_PKG_KEEP_SHARE_DOC=true

termux_step_make_install() {
    local URL_ARCH
    
    case "$TERMUX_ARCH" in
		aarch64 ) URL_ARCH="arm64-v8a" ;;
		arm ) URL_ARCH="armeabi-v7a" ;;
		* ) echo "Unsupported arch: $TERMUX_ARCH"; exit 1 ;;
	esac
	
	local target_lib=$TERMUX_PREFIX/lib
	local target_share=$TERMUX_PREFIX/share
	
	cp -rp $TERMUX_PKG_BUILDER_DIR/lib/* $target_lib/
	cp -rp $TERMUX_PKG_BUILDER_DIR/share/* $target_share/
}

