PREFERRED_PROVIDER_virtual/bootloader = "grub"
# EXTRA_IMAGEDEPENDS += "grub"

DEPENDS += "grub-native grub"

IMAGE_FSTYPES += "wic wic.gz wic.bmap wic.vmdk"

#WKS_FILE_DEPENDS:remove = "grub-efi"

IMAGE_INSTALL += " \
  grub \ 
  grub-efi \
"
