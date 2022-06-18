PREFERRED_PROVIDER_virtual/bootloader = "grub"

DEPENDS += "grub-native grub"

IMAGE_FSTYPES += "wic wic.gz wic.bmap wic.vmdk"

IMAGE_INSTALL += " \
  grub \ 
  grub-efi \
"
