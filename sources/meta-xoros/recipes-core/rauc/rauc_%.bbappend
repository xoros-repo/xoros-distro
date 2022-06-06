FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "  \
	file://system.conf \
	file://ca.cert.pem \
	file://partition-grow.service \
"

inherit systemd

SYSTEMD_PACKAGES += "partition-grow-service"
SYSTEMD_SERVICE_partition-grow-service = "partition-grow.service"
FILES_${PN} += "${systemd_unitdir}/system/*"

PACKAGES += "partition-grow-service"

RDEPENDS_${PN}-grow-data-part += "parted"

#do_install:append() {
#	install -d ${D}${systemd_unitdir}/system/
#	install -m 0644 ${WORKDIR}/partition-grow.service ${D}${systemd_unitdir}/system/
#}
