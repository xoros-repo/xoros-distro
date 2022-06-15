# PREFERRED_PROVIDER_virtual/bootloader = "grub"
# EXTRA_IMAGEDEPENDS += "grub"
# IMAGE_INSTALL += "grub"

DEPENDS += "grub-native grub-tb"

IMAGE_FSTYPES += "wic wic.gz wic.bmap wic.vmdk"

WKS_FILE_DEPENDS:remove = "grub-efi"

IMAGE_INSTALL:append = " \
  grub-tb-common \
"
