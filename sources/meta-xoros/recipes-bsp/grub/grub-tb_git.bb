require recipes-bsp/grub/grub2.inc

BRANCH = "tpm_event_log_support"
SRC_URI:remove = " ${GNU_MIRROR}/grub/grub-${PV}.tar.gz"
SRC_URI:remove = " file://0001-RISC-V-Restore-the-typcast-to-long.patch"

SRC_URI = "\
            git://github.com/xoros-repo/grub.git;protocol=https \
            file://0001-add-root-flag-to-grub-bios-setup.patch \
"

S = "${WORKDIR}/git"

SRCREV = "ae94b97be2b81b625d6af6654d3ed79078b50ff6"

PV = "2.0.x-tpm+${SRCREV}"

RDEPENDS:${PN}-common += "${PN}-editenv"
RDEPENDS:${PN} += "diffutils freetype ${PN}-common"

RPROVIDES:${PN}-editenv += "${PN}-efi-editenv"

PACKAGES =+ "${PN}-editenv ${PN}-common"
FILES:${PN}-editenv = "${bindir}/grub-editenv"
FILES:${PN}-common = " \
    ${bindir} \
    ${sysconfdir} \
    ${sbindir} \
    ${datadir}/grub \
    ${libdir}/grub-tb \
    ${libdir}/grub/i386-pc \
"

FILES:${PN}-common:append:aarch64 = " \
    ${libdir}${BPN} \
"

# grub is blackisted in
# meta/conf/distro/include/security_flags.inc
# it won't compile with security flags enabled
SECURITY_CFLAGS = ""

do_configure:prepend() {
(   cd ${S}
    ${S}/bootstrap
    ${S}/autogen.sh )
}

do_install:append () {
    install -d ${D}${sysconfdir}/grub.d
    install -d ${D}${libdir}/grub-tb
    cp -r ${D}${libdir}/grub/i386-pc ${D}${libdir}/grub-tb

    # Remove build host references...
    find "${D}" -name modinfo.sh -type f -exec \
        sed -i \
        -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
        -e 's|${DEBUG_PREFIX_MAP}||g' \
        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
        {} +
}

INSANE_SKIP = "arch"
