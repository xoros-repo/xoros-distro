FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "  \
	file://system.conf \
	file://ca.cert.pem \
"

inherit systemd

# RDEPENDS_${PN}-grow-data-part += "parted"

#do_install:append() {
#	install -d ${D}${systemd_unitdir}/system/
#	install -m 0644 ${WORKDIR}/partition-grow.service ${D}${systemd_unitdir}/system/
#}

# do_install:append() {
# 	INST_LOC=${IMAGE_ROOTFS}/boot
# 	install -d ${INST_LOC}/grub
# 	install -m 0644 ${WORKDIR}/grub_rauc.cfg ${INST_LOC}/grub/grub.cfg
# }
