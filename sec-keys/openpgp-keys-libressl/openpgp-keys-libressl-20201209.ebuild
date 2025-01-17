# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used by the libressl project"
HOMEPAGE="https://www.libressl.org/"
SRC_URI="
	https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/key.asc
		-> libressl-A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5.asc
"
S=${WORKDIR}

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

src_install() {
	local files=( ${A} )
	insinto /usr/share/openpgp-keys
	newins - libressl.asc < <(cat "${files[@]/#/${DISTDIR}/}" || die)
}
