# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Find and optionally remove unneeded includes in C or C++ sourcefiles."
HOMEPAGE="http://catb.org/~esr/deheader/"
EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://gitlab.com/esr/deheader.git
	https://github.com/yourabi/deheader.git
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	dobin "${PN}"

	dodoc README
	dodoc NEWS
	doman "${PN}.1"
}
