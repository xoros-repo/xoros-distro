#!/bin/bash

### Import env vars from .env file:
# shellcheck disable=SC2046
[ -f .env ] && export $(grep -v '#' .env | sed 's/\r$//' | xargs)

remote_root_dir=${REMOTE_DIR}
build_dir=${remote_root_dir}/build
cache_dir=${remote_root_dir}/cache

vm=xoros
build_command="\
  mkdir -p ${remote_root_dir}/xoros-distro \
  && cd ${remote_root_dir}/xoros-distro \
  && export BUILDER_BUILD_DIR=${build_dir} \
  && export BUILDER_CACHE_DIR=${cache_dir} \
  && ./build.sh \
"

ssh ${REMOTE_USER}@${REMOTE_HOST} "\
  export LIBVIRT_DEFAULT_URI='qemu:///system'; \
  virsh shutdown $vm; \
  virsh destroy $vm; \
  virsh undefine --nvram $vm; \
  virsh undefine $vm \
"

rsync -azh --stats --delete --exclude=".gitignore" --exclude-from=".gitignore" \
  . \
  ${REMOTE_USER}@${REMOTE_HOST}:"${remote_root_dir}/xoros-distro"

# for UEFI add:
#     --boot uefi,bootmenu.enable=yes,loader.secure=no,loader=\$UEFI_LOADER,nvram.template=\$NVRAM_TEMPLATE \
qemu_command="echo 'Starting QEMU with UEFI...' \
  && export LIBVIRT_DEFAULT_URI='qemu:///system' \
  && export UEFI_LOADER=/usr/share/OVMF/OVMF_CODE_4M.fd \
  && export NVRAM_TEMPLATE=/usr/share/OVMF/OVMF_VARS_4M.fd \
  && export DISK_FILE=\$(readlink -f ${build_dir}/tmp/deploy/images/qemux86-64/xoros-image-devel-qemux86-64.wic.vmdk) \
  && virt-install \
    --import \
    --name $vm \
    --graphics vnc,port=5900 \
    --vcpus 4 \
    --machine q35 \
    --boot uefi,bootmenu.enable=yes,loader.secure=no,loader=\$UEFI_LOADER,nvram.template=\$NVRAM_TEMPLATE \
    --memory 512 \
    --network default \
    --os-type=linux \
    --os-variant=generic \
    --force \
    --noautoconsole \
    --disk \$DISK_FILE \
"

ssh ${REMOTE_USER}@${REMOTE_HOST} "$build_command"

echo "$qemu_command"

ssh ${REMOTE_USER}@${REMOTE_HOST} "$qemu_command"

virt-manager -c qemu+ssh://${REMOTE_USER}@${REMOTE_HOST}/system --show-domain-console $vm
