require base.inc

DISTRO_VERSION .= "-debug"

CORE_IMAGE_EXTRA_INSTALL += "openssh-sftp-server rsync"

# adds -dbg packages for all installed packages and symbol information for debugging and profiling:
EXTRA_IMAGE_FEATURES += "dbg-pkgs"

# adds debugging tools like gdb and strace:
EXTRA_IMAGE_FEATURES += "tools-debug"

# add profiling tools (oprofile, exmap, lttng valgrind (x86 only)):
EXTRA_IMAGE_FEATURES += "tools-profile"

# add useful testing tools (ts_print, aplay, arecord etc.):
EXTRA_IMAGE_FEATURES += "tools-testapps"

# make image for suitable of development, like setting an empty root password:
EXTRA_IMAGE_FEATURES += "debug-tweaks"

# OPTIONAL: adds development tools (gcc, make, pkgconfig, etc):
EXTRA_IMAGE_FEATURES += "tools-sdk"

# OPTIONAL: adds -dev packages for all installed packages:
EXTRA_IMAGE_FEATURES += "dev-pkgs"

# This ruins startup init process:
#IMAGE_INSTALL += "strace procps"

