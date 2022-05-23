inherit core-image

SUMMARY = "Xoros Image"
LICENSE = "CLOSED"

CORE_IMAGE_EXTRA_INSTALL += " openssh"

XOROS_FEATURES = " \
    bridge-utils \
    hostapd \
    wpa-supplicant \
    rauc \
    chromium-x11
"

DISTRO_FEATURES += "bluetooth wifi ffmpeg eglfs ipv6 directfb"
DISTRO_FEATURES:remove = "wayland vulkan"

IMAGE_INSTALL += " \
    ${XOROS_FEATURES} \
"
