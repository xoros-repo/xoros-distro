IMAGE_FEATURES += "overlayfs-etc"

OVERLAYFS_ETC_MOUNT_POINT = "/persistent"
OVERLAYFS_ETC_FSTYPE = "ext4"
OVERLAYFS_ETC_INIT_TEMPLATE = "${THISDIR}/files/xoros-overlayfs-etc-preinit.sh"

# ----------------- Note ------------------
# OVERLAYFS_ETC_DEVICE is used in mount command context, like this:
#   mount $OVERLAYFS_ETC_DEVICE $OVERLAYFS_ETC_MOUNT_POINT
# Since we don't know exact /dev path to our persistent partition, we use -L switch
# that allows to identify device by partition label.
# Partition label name should match part-name or label of partition specified in .wks
OVERLAYFS_ETC_DEVICE = "-L persistent"

# this is _required_ if our rootfs filesystem is squashfs
create_mount_point_dir() {
   mkdir -p ${IMAGE_ROOTFS}${OVERLAYFS_ETC_MOUNT_POINT}
}

IMAGE_PREPROCESS_COMMAND += "create_mount_point_dir;"
