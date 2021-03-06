# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils versionator

MY_P=${PN/-ppds}-$(replace_version_separator 2 '-')

DESCRIPTION="linuxprinting.org PPD files for postscript printers"
HOMEPAGE="http://www.linuxprinting.org/foomatic.html"
SRC_URI="http://linuxprinting.org/download/foomatic/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm hppa ia64 ~m68k ~mips ppc ppc64 ~s390 sparc x86"
IUSE=""

S="${WORKDIR}/${PN/-ppds}-$(get_version_component_range 3 ${PV})"

src_prepare() {
	epatch "${FILESDIR}/Makefile.in-4.0.20120117.patch"
	rm db/source/PPD/Kyocera/ReadMe.htm || die # bug #559008
}

src_install() {
	default
	rm -v "${ED}"/usr/share/foomatic/xmlschema/{driver,option,printer,types}.xsd || die "Cannot remove duplicates"
}
