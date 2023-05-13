# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{9..11})
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="A Python Matrix client library, designed according to sans I/O"H
HOMEPAGE="https://github.com/poljar/matrix-nio"
SLOT="0"
LICENSE="ISC"
KEYWORDS="~amd64"

IUSE="e2e"

SRC_URI="https://github.com/poljar/matrix-nio/archive/${PV}.tar.gz -> ${P}.tar.gz"

CDEPEND="
	dev-python/Faker[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aioresponses[${PYTHON_USEDEP}]
	dev-python/atomicwrites[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]
	dev-python/h2[${PYTHON_USEDEP}]
	dev-python/hpack[${PYTHON_USEDEP}]
	dev-python/hyperframe[${PYTHON_USEDEP}]
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/logbook[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/mypy_extensions[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/unpaddedbase64[${PYTHON_USEDEP}]
	media-gfx/cairosvg

	e2e? (
		>=dev-python/peewee-3.9.5[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/atomicwrites[${PYTHON_USEDEP}]
		>=dev-python/olm-3.1.0[${PYTHON_USEDEP}]
	)
"

DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_configure() {
	default # TODO: add extra features to setup.py
}
