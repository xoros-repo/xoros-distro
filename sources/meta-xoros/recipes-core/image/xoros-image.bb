inherit core-image

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SUMMARY = "Xoros Image"
LICENSE = "CLOSED"

IMAGE_VERSION_SUFFIX = "-release"

ROOT_HOME = "/root"

### Need this, or get "No such file or directory: 'cross-localedef'"
DEPENDS += "cross-localedef-native"

require overlay.inc

### https://docs.yoctoproject.org/ref-manual/features.html#ref-features-image
IMAGE_FEATURES += "hwcodecs"

### Install networking tools
IMAGE_INSTALL += "bridge-utils hostapd wpa-supplicant"

### Build wic.vmdk for QEMU
IMAGE_FSTYPES:qemuall += "wic.vmdk"

### https://docs.yoctoproject.org/ref-manual/variables.html?highlight=image_fstypes#term-IMAGE_TYPES
IMAGE_FSTYPES += "squashfs"

### Setup RAUC:
IMAGE_INSTALL += "rauc rauc-hawkbit-updater"

#do_image_wic[depends]_remove = "syslinux:do_populate_sysroot"

### Use custom WKS file:
WKS_FILE = "${MACHINE}.wks"
