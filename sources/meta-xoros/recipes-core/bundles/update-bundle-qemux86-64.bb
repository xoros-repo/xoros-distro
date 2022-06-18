DESCRIPTION = "RAUC bundle generator"

inherit bundle

RAUC_BUNDLE_COMPATIBLE = "xoros-bundle"
RAUC_BUNDLE_VERSION = "v20220531"
RAUC_BUNDLE_DESCRIPTION = "RAUC Demo Bundle"
RAUC_BUNDLE_SLOTS = "rootfs"
RAUC_SLOT_rootfs = "xoros"
RAUC_SLOT_rootfs[fstype] = "squashfs"

RAUC_KEY_FILE = "${THISDIR}/files/development-1.key.pem"
RAUC_CERT_FILE = "${THISDIR}/files/development-1.cert.pem"
