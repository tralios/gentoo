# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="WebSockets state-machine based protocol implementation"
HOMEPAGE="https://github.com/python-hyper/wsproto https://pypi.python.org/pypi/wsproto"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	=dev-python/h11-0.8*[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v || die "Testing failed"
}
