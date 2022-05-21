FILESEXTRAPATHS_prepend_rpi := "${THISDIR}/files:"
SRC_URI_append_rpi = " file://var-som-mx6-rauc.rules"

do_install_append_rpi() {
    install -m 0644 ${WORKDIR}/var-som-mx6-rauc.rules ${D}${sysconfdir}/udev/mount.blacklist.d/
}
