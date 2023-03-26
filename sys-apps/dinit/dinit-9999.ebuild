# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

EGIT_REPO_URI="https://github.com/davmac314/$PN.git"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
BDEPEND="sys-devel/autoconf"
SLOT="0"
IUSE="+shutdown"
RDEPEND="
	shutdown? (
	 	!sys-apps/openrc
		!sys-apps/systemd
		!sys-apps/sysvinit
		!sys-apps/s6-linux-init
	)
"
DEPEND="$RDEPEND"

src_configure() {
	local myconf
	if ! use shutdown; then
		myconf+=" --disable-shutdown"
	fi

	econf $myconf
}
