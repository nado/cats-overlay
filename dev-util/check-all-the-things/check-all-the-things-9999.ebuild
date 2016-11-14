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

# TODO: add apstream in the tree first for appstreamcli-validate
IUSE_APPSTREAM="appstream-util-validate"
#TODO: blhc, bls-standalone
IUSE_BUILD_LOGS=""
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
#TODO: foodcritic (https://github.com/acrmp/foodcritic)
IUSE_CHEF=""
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
# Do we need those ?
IUSE_DEBIAN=""
IUSE_DESKTOP="desktop-file-validate"
# Same as IUSE_DEBIAN, mainly debian specific stuff there
IUSE_ELF=""
IUSE_ENCODING="uu-test"
#TODO: codespell
IUSE_ENGLISH=""
#TODO: epubcheck, flightcrew
IUSE_EPUB=""
IUSE_ERLANG="erl-tidy"
IUSE_FONTS="
	fontlint
	ftutils
	t1lint
"
#TODO: gettext-lint, i18nspector
IUSE_GETTEXT="
	msgfmt-check
"
#TODO: dev-lang/go for gofmt
IUSE_GO=""
#TODO: stylish-haskell (https://github.com/jaspervdj/stylish-haskell)
IUSE_HASKELL="
	cabal
	ghc-mod-lint
	hlint
"
#TODO: httpolice (https://github.com/vfaronov/httpolice)
IUSE_HTTP=""
IUSE_JPEG="jpeginfo"
#TODO: jpylyzer (python)
IUSE_JPEG2000=""
IUSE_JSON=""
IUSE_MISC="
	fdupes
	isutf8
"
#TODO: mp3val
IUSE_MP3="mp3check"
IUSE_OGG="
	ogginfo
	oggz-validate
"
#TODO: hokey-lint (hopenpgp-tools)
IUSE_OPENPGP=""
IUSE_OPUS="opusinfo"
IUSE_PCAP="dsniff"
IUSE_PERL="
	perlcritic
	podlint
"
IUSE_PHP="php-syntax-check"
IUSE_PNG="pngcheck"
IUSE_PUPPET="
	puppet
	puppet-lint
"
IUSE_PYTHON="
	pep8
	pyflakes
	pylint
"
#TODO: rpmlint
IUSE_RPM=""
IUSE_SH="
	bashate
	checkbashisms
	shellcheck
"
#TODO: lintex
IUSE_TEX="lacheck"
IUSE_TEXT="rst-lint"
IUSE_XML="xmllint"
#TODO: yamllint
IUSE_YAML=""
IUSE="
	${IUSE_APPSTREAM}
	${IUSE_BUILD_LOGS}
	${IUSE_C}
	${IUSE_CHEF}
	${IUSE_COLLADA}
	${IUSE_COMPRESSION}
	${IUSE_CSS}
	${IUSE_CYPHER}
	${IUSE_DEBIAN}
	${IUSE_DESKTOP}
	${IUSE_ELF}
	${IUSE_ENCODING}
	${IUSE_ENGLISH}
	${IUSE_EPUB}
	${IUSE_ERLANG}
	${IUSE_FONTS}
	${IUSE_GETTEXT}
	${IUSE_GO}
	${IUSE_HASKELL}
	${IUSE_HTTP}
	${IUSE_JPEG}
	${IUSE_JPEG2000}
	${IUSE_JSON}
	${IUSE_MISC}
	${IUSE_MP3}
	${IUSE_OGG}
	${IUSE_OPENPGP}
	${IUSE_OPUS}
	${IUSE_PCAP}
	${IUSE_PERL}
	${IUSE_PHP}
	${IUSE_PNG}
	${IUSE_PUPPET}
	${IUSE_PYTHON}
	${IUSE_SH}
	${IUSE_TEX}
	${IUSE_TEXT}
	${IUSE_XML}
	${IUSE_YAML}
"
#jsonlint-py3 ( dev-python/demjson )
RDEPEND="
	appstream-util-validate? ( dev-libs/appstream-glib )
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
	desktop-file-validate? ( dev-util/desktop-file-utils )
	uu-test? ( app-arch/sharutils )
	erl-tidy? ( dev-lang/erlang )
	fontlint? ( media-gfx/fontforge )
	ftutils?  ( media-libs/freetype[utils] )
	t1lint?   ( app-text/lcdf-typetools )
	msgfmt-check? ( sys-devel/gettext )
	cabal?        ( dev-haskell/cabal )
	ghc-mod-lint? ( app-emacs/ghc-mod )
	hlint?        ( dev-haskell/hlint )
	jpeginfo? ( media-gfx/jpeginfo )
	fdupes? ( app-misc/fdupes )
	isutf8? ( sys-apps/moreutils )
	mp3check? ( media-sound/mp3check )
	ogginfo?       ( media-sound/vorbis-tools )
	oggz-validate? ( media-libs/liboggz )
	opencolladavalidator? ( media-libs/opencollada )
	opusinfo? ( media-sound/opus-tools )
	dsniff? ( net-analyzer/dsniff )
	perlcritic? ( dev-perl/Perl-Critic )
	podlint?    ( dev-perl/Pod-POM )
	php-syntax-check? ( dev-lang/php:*[cli] )
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
	lacheck? ( app-text/texlive-core )
	rst-lint? ( dev-python/restructuredtext-lint )
	xmllint? ( dev-libs/libxml2 )
"
DEPEND="${RDEPEND}"

DOCS=( doc/{README,TODO} )

src_install() {
	dobin check-all-the-things
	dobin check-font-embedding-restrictions

	dodir /usr/share/"${PN}"
	cp -r "${S}"/data "${D}"/usr/share/"${PN}"/

	einstalldocs
}
