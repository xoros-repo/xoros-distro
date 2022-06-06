IMAGE_FEATURES += "overlayfs-etc"

OVERLAYFS_ETC_MOUNT_POINT = "/non-volatile"
OVERLAYFS_ETC_FSTYPE = "ext4"
OVERLAYFS_ETC_DEVICE = "-L non-volatile"
#OVERLAYFS_ETC_DEVICE = "/dev/sda5"
OVERLAYFS_ETC_INIT_TEMPLATE = "${THISDIR}/files/xoros-overlayfs-etc-preinit.sh.in"

# this is required if our rootfs is in squashfs
create_mount_point_dir() {
   mkdir -p ${IMAGE_ROOTFS}${OVERLAYFS_ETC_MOUNT_POINT}
}

IMAGE_PREPROCESS_COMMAND += "create_mount_point_dir;"
