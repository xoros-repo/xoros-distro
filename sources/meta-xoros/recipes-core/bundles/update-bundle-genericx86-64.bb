DESCRIPTION = "RAUC bundle generator"

inherit bundle

RAUC_BUNDLE_COMPATIBLE = "genericx86-64"
RAUC_BUNDLE_VERSION = "v20200703"
RAUC_BUNDLE_DESCRIPTION = "RAUC Demo Bundle"
RAUC_BUNDLE_SLOTS = "rootfs" 
RAUC_SLOT_rootfs = "xoros"
RAUC_SLOT_rootfs[fstype] = "ext4"

RAUC_KEY_FILE = "${THISDIR}/files/development-1.key.pem"
RAUC_CERT_FILE = "${THISDIR}/files/development-1.cert.pem"
