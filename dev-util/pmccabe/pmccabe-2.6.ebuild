# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="McCabe-style function complexity and line counting for C and C++"
HOMEPAGE="https://people.debian.org/~bame/pmccabe/"
SRC_URI="http://http.debian.net/debian/pool/main/p/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}"
