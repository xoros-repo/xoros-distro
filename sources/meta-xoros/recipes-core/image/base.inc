inherit core-image

SUMMARY = "Xoros Image"
LICENSE = "CLOSED"

CORE_IMAGE_EXTRA_INSTALL += " openssh"

XOROS_FEATURES = "\
    bridge-utils \
    hostapd \
    wpa-supplicant \
    rauc \
    chromium-x11 \
"

IMAGE_INSTALL += " \
    ${XOROS_FEATURES} \
"
