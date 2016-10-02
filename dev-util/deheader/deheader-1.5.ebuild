# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Find and optionally remove unneeded includes in C or C++ sourcefiles."
HOMEPAGE="http://catb.org/~esr/deheader/"
SRC_URI="http://www.catb.org/~esr/deheader/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	dobin "${PN}"

	dodoc README
	dodoc NEWS
	doman "${PN}.1"
}
