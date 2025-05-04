# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg

DESCRIPTION="Mint themes"
HOMEPAGE="https://github.com/linuxmint/mint-themes"
SRC_URI="http://packages.linuxmint.com/pool/main/m/${PN}/${PN}_${PV}_all.deb"

LICENSE="GPL-3+"
SLOT="0"
IUSE="cinnamon xfwm"
KEYWORDS="amd64 arm64 ~mips ~ppc ~ppc64 ~sparc x86"

RDEPEND="${DEPEND}
	gnome-base/librsvg:2
	x11-themes/gnome-themes-standard
"
# This ebuild does not install any binaries
RESTRICT="binchecks mirror strip"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/themes
	doins -r usr/share/themes/*

	rm -r "${ED}"/usr/share/themes/Linux\ Mint
	rm -r "${ED}"/usr/share/themes/*/metacity-1

	if ! use cinnamon; then
		rm -r "${ED}"/usr/share/themes/*/cinnamon
	fi

	if ! use xfwm; then
		rm -r "${ED}"/usr/share/themes/*/xfwm4
		rm -r "${ED}"/usr/share/themes/*/xfce-notify-*
	fi
}
