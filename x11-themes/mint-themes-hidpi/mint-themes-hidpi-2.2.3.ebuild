# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Mint themes for HiDPI displays"
HOMEPAGE="https://github.com/hoshino873/mint-themes-hidpi"
SRC_URI="https://github.com/hoshino873/${PN}/releases/download/hidpi/${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64 ~mips ~ppc ~ppc64 ~sparc x86"

# This ebuild does not install any binaries
RESTRICT="binchecks mirror strip"

src_install() {
	insinto /
	doins -r usr
}
