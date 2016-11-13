# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="Cypher Parser Library"
HOMEPAGE="https://git.io/libcypher-parser"
EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://github.com/cleishm/libcypher-parser.git
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="
	doc
	linter
	static
"
RDEPEND="
	dev-util/peg
"
DEPEND="
	${RDEPEND}
	doc? ( app-doc/doxygen )
"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		$(use_enable static) \
		$(use_enable linter tools)
}

src_compile() {
	use doc && emake doc
	default
}

src_install() {
	emake DESTDIR="${D}" install
	find "${D}" -name '*.la' -delete || die
}
