# Xoros Image Layout

1. Boot partition
2. Rootfs partition A
3. Rootfs partition B
4. Recovery partition (not used now, reserved for future uses)
5. Non-volatile partition (used by overlayfs)
6. Application partition

| Name        | Mount       | Size | Label       | Source                       | Filesystem |     |
|-------------|-------------|------|-------------|------------------------------|------------|-----|
| boot        | /boot       | 64M  | boot        | _**ref**: Bootloader Source_ | vfat       |     |
| rootfs_a    | /           | 1G   | rootfs_a    | rootfs                       | squashfs   |     |
| rootfs_b    |             | 1G   | rootfs_b    | rootfs                       | squashfs   |     |
| rescue      |             | 704M | rescue      |                              | ext4       |     |
| persistent  | /persistent | 256M | persistent  |                              | ext4       |     |
| application | /opt        | 5G   | application |                              | ext4       |     |

## Partition Table

### MBR

> **MBR support is experimental** We do not plan to support BIOS-based machines in the future

Used for BIOS-based machines

```shell
# .wks:
bootloader --ptable msdos
```

### GPT

Used for UEFI-based machines

```shell
bootloader --ptable gpt
```

## Boot Loader Source

### UEFI Based QEMU using Grub/Systemd

Source: `bootimg-efi`

This WIC plugin script is part of `poky-distro`

```shell
#.wks:
part --source bootimg-efi --sourceparams="loader=grub-efi"
```

### BIOS Based QEMU using Grub

Source: `bootimg-grub`

This WIC plugin script is part of `xoros-distro`

```shell
#.wks:
part --source bootimg-grub
```

## References

https://docs.yoctoproject.org/ref-manual/kickstart.html

Running UEFI-based image in QEMU requires obtaining UEFI firmware and NVRAM templates, please see main README how to do that.

### Rauc

https://github.com/rauc/rauc/blob/master/contrib/grub.conf
