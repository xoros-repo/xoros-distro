FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:prepend := "file://add-root-flag-to-grub-bios-setup.patch "

#BRANCH = "grub-bios-setup-root_argument"
#SRC_URI:remove = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz"
#SRC_URI += "git://github.com/xoros-repo/grub.git;branch=${BRANCH};protocol=https"
