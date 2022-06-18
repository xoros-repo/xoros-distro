FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://kernel-hardening.cfg"

LINUX_VERSION_EXTENSION = "-xoros-hardened"
