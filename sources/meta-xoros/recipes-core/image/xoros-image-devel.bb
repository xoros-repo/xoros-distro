require base.inc

DISTRO_VERSION_append = "-devel"

EXTRA_IMAGE_FEATURES += "debug-tweaks tools-sdk"

## this will also include lsusb and lspci
CORE_IMAGE_EXTRA_INSTALL += "lshw"

### specific debugging tools:
CORE_IMAGE_EXTRA_INSTALL += "strace procps"

CORE_IMAGE_EXTRA_INSTALL += "openssh-sftp-server rsync nano git python3"

