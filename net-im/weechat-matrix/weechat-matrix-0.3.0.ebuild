# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit python-single-r1

DESCRIPTION="Weechat Matrix protocol script written in python"
HOMEPAGE="https://github.com/poljar/weechat-matrix"
SRC_URI="https://github.com/poljar/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE=${PYTHON_REQUIRED_USE}

DEPEND="
	net-irc/weechat[python]
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/aiohttp-socks[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/atomicwrites[${PYTHON_USEDEP}]
		dev-python/attrs[${PYTHON_USEDEP}]
		dev-python/future[${PYTHON_USEDEP}]
		dev-python/logbook[${PYTHON_USEDEP}]
		dev-python/matrix-nio[${PYTHON_USEDEP},e2e]
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/webcolors[${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${P}-ssl_set_npn_protocols.patch" )

src_install() {
	python_domodule matrix
	exeinto /usr/lib/weechat
	newexe main.py ${PN}.py
}
