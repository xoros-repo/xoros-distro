require xoros-image.bb

IMAGE_VERSION_SUFFIX = "-devel"

EXTRA_IMAGE_FEATURES += "debug-tweaks tools-sdk empty-root-password"

### install fs tools:
CORE_IMAGE_EXTRA_INSTALL += "e2fsprogs"

### this will also include lsusb and lspci
CORE_IMAGE_EXTRA_INSTALL += "lshw"

### specific debugging tools:
CORE_IMAGE_EXTRA_INSTALL += "strace procps"

CORE_IMAGE_EXTRA_INSTALL += "openssh-sftp-server rsync nano git python3"

### Install our favorite dev tools:
IMAGE_INSTALL += "curl git mc"

### Install U-Boot tools:
#IMAGE_INSTALL += "u-boot-tools"

###
require overlay-devel.inc
