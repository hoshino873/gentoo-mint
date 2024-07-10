# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg

DESCRIPTION="Yaru theme from the Ubuntu Community"
HOMEPAGE="https://github.com/ubuntu/yaru"

SRC_URI="https://github.com/ubuntu/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="CC-BY-SA-4.0 GPL-3 LGPL-2.1 LGPL-3"
SLOT="0"
IUSE="cinnamon gnome-shell +sounds mate unity xfwm"
KEYWORDS="amd64 ~arm64 ~mips ~ppc ~ppc64 ~sparc x86"

RDEPEND="${DEPEND}
	gnome-base/librsvg:2
	x11-themes/gnome-themes-standard
"
BDEPEND="
	dev-lang/sassc
	dev-libs/libxml2:2
"
# This ebuild does not install any binaries
RESTRICT="binchecks strip test"

src_configure() {
	local emesonargs=(
		-Dgnome-shell-user-themes-support=$(usex gnome-shell enabled disabled)
		-Dgtk=true
		-Dgtksourceview=true
		-Dicons=true
		-Dmetacity=false
		-Dsessions=false
		$(meson_use sounds)
		$(meson_use cinnamon)
		$(meson_use cinnamon cinnamon-dark)
		$(meson_use cinnamon cinnamon-shell)
		$(meson_use gnome-shell)
		$(meson_use gnome-shell gnome-shell-gresource)
		$(meson_use mate)
		$(meson_use mate mate-dark)
		$(meson_use unity ubuntu-unity)
		$(meson_use xfwm xfwm4)
	)
	meson_src_configure
}
