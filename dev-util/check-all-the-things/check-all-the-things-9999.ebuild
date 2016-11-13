# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit git-r3

DESCRIPTION="Collection of static analysis tools"
HOMEPAGE="https://anonscm.debian.org/cgit/collab-maint/check-all-the-things.git/"
EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://anonscm.debian.org/git/collab-maint/check-all-the-things.git
	https://github.com/jwilk/check-all-the-things.git
"
LICENSE="Expat"
SLOT="0"
KEYWORDS="~x86 ~amd64"

# TODO: add apstream in the tree first for appstreamcli
#IUSE_APPSTREAM="appstream-utils"

IUSE_C="
	clang
	complexity
	cppcheck
	deheader
	flawfinder
	iwyu
	kwstyle
	pmccabe
"
IUSE_COLLADA="opencolladavalidator"
IUSE_COMPRESSION="
	7z
	bzip2
	gzip
	lrzip
	lzip
	lzma
	lzop
	rzip
	unzip
	zstd
"
IUSE_CSS="csslint"
IUSE_CYPHER="cypher-lint"
IUSE_HASKELL="
	cabal
	ghc-mod
	hlint
"
IUSE_PUPPET="
	puppet
	puppet-lint
"
IUSE_PYTHON="
	pep8
	pyflakes
	pylint
"
IUSE_SH="
	bashate
	checkbashisms
	shellcheck
"
IUSE="
	${IUSE_C}
	${IUSE_COLLADA}
	${IUSE_COMPRESSION}
	${IUSE_CSS}
	${IUSE_CYPHER}
	desktop
	encoding
	erlang
	fontlint
	gettext
	${IUSE_HASKELL}
	jpeginfo
	empty
	mp3check
	opusinfo
	pngcheck
	${IUSE_PUPPET}
	${IUSE_PYTHON}
	${IUSE_SH}
	xmllint
"
#for RDEPEND : appstream-utils? ( dev-libs/appstream-glib )
RDEPEND="
	clang?      ( sys-devel/clang )
	complexity? ( dev-util/complexity )
	cppcheck?   ( dev-util/cppcheck )
	deheader?   ( dev-util/deheader )
	flawfinder? ( dev-util/flawfinder )
	iwyu?       ( dev-util/include-what-you-use )
	kwstyle?    ( dev-util/KWStyle )
	pmccabe?    ( dev-util/pmccabe )
	7z?    ( app-arch/p7zip )
	bzip2? ( app-arch/bzip2 )
	gzip?  ( app-arch/gzip )
	lrzip? ( app-arch/lrzip )
	lzip?  ( app-arch/lzip )
	lzma?  ( app-arch/xz-utils )
	lzop?  ( app-arch/lzop )
	rzip?  ( app-arch/rzip )
	unzip? ( app-arch/unzip )
	zstd?  ( app-arch/zstd )
	csslint? ( dev-libs/libcroco )
	cypher-lint? ( dev-libs/libcypher-parser[linter] )
	desktop? ( dev-util/desktop-file-utils )
	encoding? ( app-arch/sharutils )
	erlang? ( dev-lang/erlang )
	fontlint? ( media-gfx/fontforge )
	gettext? ( sys-devel/gettext )
	cabal?   ( dev-haskell/cabal )
	ghc-mod? ( app-emacs/ghc-mod )
	hlint?   ( dev-haskell/hlint )
	jpeginfo? ( media-gfx/jpeginfo )
	empty? ( app-misc/empty )
	mp3check? ( media-sound/mp3check )
	opencolladavalidator? ( media-libs/opencollada )
	opusinfo? ( media-sound/opus-tools )
	pngcheck? ( media-gfx/pngcheck )
	puppet?      ( app-admin/puppet )
	puppet-lint? ( app-admin/puppet-lint )
	pep8?     ( dev-python/pep8 )
	pyflakes? (
		>=dev-python/pyflakes-0.7.3
		<dev-python/pyflakes-1.1.0
		)
	pylint?   ( >=dev-python/pylint-1.1.0 )
	bashate?       ( dev-python/bashate )
	checkbashisms? ( dev-util/checkbashisms )
	shellcheck?    ( dev-util/shellcheck )
	xmllint? ( dev-libs/libxml2 )
"
DEPEND="${RDEPEND}
"

src_install() {
	dobin check-all-the-things
	dobin check-font-embedding-restrictions

	dodir /usr/share/"${PN}"
	cp -r "${S}"/data "${D}"/usr/share/"${PN}"/
	dodoc doc/{README,TODO}
}
