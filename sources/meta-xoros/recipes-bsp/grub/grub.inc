BRANCH = "grub-bios-setup-root_argument"

SRC_URI = "\
            git://github.com/xoros-repo/grub.git;branch=${BRANCH};protocol=https \
"

SRCREV = "${AUTOREV}"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

S = "${WORKDIR}/git"

do_configure:prepend() {
	cd ${S}
	${S}/bootstrap
	cd ${B}
}