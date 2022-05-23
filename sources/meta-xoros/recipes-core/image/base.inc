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

DISTRO_FEATURES_append = "bluetooth wifi ffmpeg eglfs ipv6 directfb"
DISTRO_FEATURES_remove = "wayland vulkan"

IMAGE_INSTALL_append = " \
    ${XOROS_FEATURES} \
"
