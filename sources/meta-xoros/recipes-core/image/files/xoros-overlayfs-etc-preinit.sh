#!/bin/sh

echo "PREINIT: Start"

PATH=/sbin:/bin:/usr/sbin:/usr/bin
mount -o remount,rw /

mkdir -p /proc
mkdir -p /sys
mkdir -p /run
mkdir -p /var/run

mount -t proc proc /proc
mount -t sysfs sysfs /sys

[ -z "$CONSOLE" ] && CONSOLE="/dev/console"

overlay_path="overlays/etc"

mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
    -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
    {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
then
    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/$overlay_path/upper
    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/$overlay_path/work
    mount -n -t overlay \
        -o upperdir={OVERLAYFS_ETC_MOUNT_POINT}/$overlay_path/upper \
        -o lowerdir=/etc \
        -o workdir={OVERLAYFS_ETC_MOUNT_POINT}/$overlay_path/work \
        -o index=off,xino=off,redirect_dir=off,metacopy=off \
        {OVERLAYFS_ETC_MOUNT_POINT}/$overlay_path/upper /etc || \
            echo "PREINIT: Mounting $overlay_path failed!" \
            && sleep 5
else
    echo "PREINIT: Mounting {OVERLAYFS_ETC_MOUNT_POINT} failed!"
    find /dev/disk
    sleep 5
fi

echo "PREINIT: done; starting {SBIN_INIT_NAME}"
exec {SBIN_INIT_NAME}
