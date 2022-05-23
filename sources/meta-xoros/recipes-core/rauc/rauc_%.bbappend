FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "  \
	file://system.conf \
	file://ca.cert.pem \
	file://rauc-grow-data-partition.service \
"

inherit systemd

SYSTEMD_PACKAGES += "${PN}-grow-data-part"
SYSTEMD_SERVICE_${PN}-grow-data-part = "rauc-grow-data-partition.service"

PACKAGES += "rauc-grow-data-part"

RDEPENDS_${PN}-grow-data-part += "parted"

do_install:append() {
	install -d ${D}${systemd_unitdir}/system/
	install -m 0644 ${WORKDIR}/rauc-grow-data-partition.service ${D}${systemd_unitdir}/system/
}
