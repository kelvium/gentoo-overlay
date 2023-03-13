# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

SRC_URI="https://github.com/davmac314/dinit/archive/refs/heads/master.zip -> master.zip"
S="${WORKDIR}/dinit-master"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
BDEPEND="sys-devel/autoconf"
SLOT="0"

src_configure() {
	econf "--disable-shutdown"
}
