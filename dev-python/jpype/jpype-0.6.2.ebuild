# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_6 )

inherit java-pkg-2 distutils-r1

DESCRIPTION="JPype is an effort to allow Python programs full access to Java class librairies"
HOMEPAGE="https://github.com/originell/jpype"
SRC_URI="https://github.com/originell/${PN}/archive/v${PV}.zip -> ${P}.zip"

LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples"

S="${WORKDIR}/${P}"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=virtual/jdk-1.6"

PATCHES=( "${FILESDIR}"/${PN}-gcc6-noexcept.patch )

python_install() {
	use doc && local DOCS=( doc/* )
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi

	distutils-r1_python_install
}
