# Description

## bootimg-efi-grubenv.py

This is a modified version of bootimg-efi.py

It adds automatic creation and deployment of `grubenv` used by GRUB to store env variables. 
Storing env variables is required by GRUB menu script within Rauc A/B booting feature.

# WKS Python Object Reference

## Partition Object Properties

### active

Boolean

```shell
part --active
```

### align

Integer

```shell
part --align 1024
```

### change_directory



### check_for_Y2038_problem

### device

### disk

String

Example: `sda`

```shell
part --ondisk sda
```

### disk_size

Integer

### exclude_path

### extra_space

Integer

### fixed_size

Integer

### fsopts

String?

### fstype

String

Example: `vfat`

### fsuuid

String

Example: `0xFD12F241`

### get_extra_block_count

Handler method?

### get_rootfs_size

### has_fstab

Boolean

### include_path

### label

String

Example: `msdos`

### lineno

Integer

Example: `1`

### mkfs_extraopts

String

### mountpoint

String

Example: `/boot`

### no_fstab_update

Boolean

### no_table

Boolean

### num

### offset

### overhead_factor

Float

Example: `1.3`

### part_name

### part_type

### realnum

Integer

Example: `1`

### rootfs_dir

### size

Integer

### source

String

Example: `bootimg-grub`

### source_file

String

### sourceparams

String?

### system_id

### type

String

Example: `primary`

### update_fstab_in_rootfs

Boolean

### updated_fstab_path

String

Example: `/xoros/build/tmp/work/qemux86_64-xoros-linux/xoros-image-devel/1.0-r0/tmp-wic/fstab`

### use_label

Boolean

### use_uuid

Boolean

### uuid

## Methods

### prepare

### prepare_empty_partition_btrfs

### prepare_empty_partition_ext

### prepare_empty_partition_msdos

### prepare_empty_partition_vfat

### prepare_rootfs

### prepare_rootfs_btrfs

### prepare_rootfs_erofs

### prepare_rootfs_ext

### prepare_rootfs_msdos

### prepare_rootfs_squashfs

### prepare_rootfs_vfat

### prepare_swap_partition
