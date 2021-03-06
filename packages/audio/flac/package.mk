################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="flac"
PKG_VERSION="1.2.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://flac.sourceforge.net/"
PKG_URL="http://downloads.xiph.org/releases/flac/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS="libogg"
PKG_BUILD_DEPENDS_TARGET="toolchain libogg"
PKG_PRIORITY="optional"
PKG_SECTION="audio"
PKG_SHORTDESC="flac: An Free Lossless Audio Codec"
PKG_LONGDESC="Grossly oversimplified, FLAC is similar to MP3, but lossless, meaning that audio is compressed in FLAC without throwing away any information. This is similar to how Zip works, except with FLAC you will get much better compression because it is designed specifically for audio."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--disable-rpath \
                           --disable-altivec \
                           --disable-doxygen-docs \
                           --disable-thorough-tests \
                           --disable-cpplibs \
                           --disable-xmms-plugin \
                           --disable-oggtest \
                           --with-ogg=$SYSROOT_PREFIX/usr \
                           --with-gnu-ld"

pre_make_target() {
  # hack
  cp -R ../doc/* ./doc
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
