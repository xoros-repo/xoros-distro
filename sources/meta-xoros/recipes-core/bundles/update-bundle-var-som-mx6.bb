DESCRIPTION = "RAUC bundle generator"

inherit bundle

RAUC_BUNDLE_COMPATIBLE = "var-som-mx6"
RAUC_BUNDLE_VERSION = "v20200703"
RAUC_BUNDLE_DESCRIPTION = "RAUC Demo Bundle"
RAUC_BUNDLE_SLOTS = "rootfs" 
RAUC_SLOT_rootfs = "xoros"
RAUC_SLOT_rootfs[fstype] = "ubifs"
RAUC_SLOT_rootfs[file] = "xoros-var-som-mx6_256kbpeb.ubifs"

RAUC_KEY_FILE = "${THISDIR}/files/development-1.key.pem"
RAUC_CERT_FILE = "${THISDIR}/files/development-1.cert.pem"
