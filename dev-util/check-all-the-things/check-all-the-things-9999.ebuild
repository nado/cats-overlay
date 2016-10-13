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

IUSE_C_MODULES="
	clang
	complexity
	cppcheck
	deheader
	flawfinder
	iwyu
	kwstyle
	pmccabe
"
IUSE_COMPRESSION_MODULES="
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
IUSE_HASKELL_MODULES="
	cabal
	ghc-mod
	hlint
"
IUSE_PUPPET_MODULES="
	puppet
	puppet-lint
"
IUSE_PYTHON_MODULES="
	pep8
	pyflakes
	pylint
"
IUSE_SH_MODULES="
	bashate
	checkbashisms
	shellcheck
"
IUSE="
	${IUSE_C_MODULES}
	${IUSE_COMPRESSION_MODULES}
	csslint
	desktop
	encoding
	erlang
	fontlint
	gettext
	${IUSE_HASKELL_MODULES}
	jpeginfo
	empty
	mp3check
	opusinfo
	pngcheck
	${IUSE_PUPPET_MODULES}
	${IUSE_PYTHON_MODULES}
	${IUSE_SH_MODULES}
	xmllint
"

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
	zstd?  ( app-arch/zstd[abi_x86_64=] )
	csslint? ( dev-libs/libcroco )
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
	opusinfo? ( media-sound/opus-tools )
	pngcheck? ( media-gfx/pngcheck )
	puppet?      ( app-admin/puppet )
	puppet-lint? ( app-admin/puppet-lint[abi_x86_64=] )
	pep8?     ( dev-python/pep8 )
	pyflakes? ( dev-python/pyflakes )
	pylint?   ( dev-python/pylint )
	bashate?       ( dev-python/bashate )
	checkbashisms? ( dev-util/checkbashisms )
	shellcheck?    ( dev-util/shellcheck )
	xmllint? ( dev-libs/libxml2 )

"
DEPEND="${RDEPEND}
"

PATCHES=( "${FILESDIR}"/${PN}-python.patch )

src_install() {
	dobin check-all-the-things
	dobin check-font-embedding-restrictions

	dodir /usr/share/"${PN}"
	cp -r "${S}"/data "${D}"/usr/share/"${PN}"/
	dodoc doc/{README,TODO}
}
