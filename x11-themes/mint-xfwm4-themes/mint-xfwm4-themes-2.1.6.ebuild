# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Mint xfwm4 themes for HiDPI displays"
HOMEPAGE="https://github.com/hoshino873/mint-xfwm4-themes"
SRC_URI="https://github.com/hoshino873/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~mips ~ppc ~ppc64 ~sparc x86"

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

src_install() {
	insinto /
	doins -r usr
}
