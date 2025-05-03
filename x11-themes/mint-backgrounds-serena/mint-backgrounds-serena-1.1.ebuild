# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="The desktop backgrounds for Linux Mint 18.1 Serena"
HOMEPAGE="https://linuxmint.com"
SRC_URI="http://packages.linuxmint.com/pool/main/m/${PN}/${PN}_${PV}_all.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 ~mips ~ppc ~ppc64 ~sparc x86"

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/wallpapers
	doins -r usr/share/wallpapers/*

	insinto /usr/share/backgrounds
	doins -r usr/share/backgrounds/*

	insinto /usr/share
	doins -r usr/share/cinnamon-background-properties

	insinto /usr/share
	doins -r usr/share/mate-background-properties

	insinto /usr/share
	doins -r usr/share/gnome-background-properties

	insinto /usr/share/xfce4/backdrops
	doins -r usr/share/xfce4/backdrops/*

	dodoc usr/share/doc/${PN}/*
}
