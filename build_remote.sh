#!/bin/bash

### Import env vars from .env file:
# shellcheck disable=SC2046
[ -f .env ] && export $(grep -v '#' .env | sed 's/\r$//' | xargs)

vm=xoros
command=${1:-"cd ${REMOTE_DIR} && ./build.sh"}

ssh ${REMOTE_USER}@${REMOTE_HOST} "\
  export LIBVIRT_DEFAULT_URI='qemu:///system'; \
  virsh shutdown $vm; \
  virsh destroy $vm; \
  virsh undefine --nvram $vm; \
  virsh undefine $vm"

rsync -azh --stats --delete --exclude=".gitignore" --exclude-from=".gitignore" \
  . \
  ${REMOTE_USER}@${REMOTE_HOST}:"${REMOTE_DIR}"

# for UEFI add:   --boot machine=q35,firmware=efi \
qemu_command="echo 'Starting QEMU...' \
  && export LIBVIRT_DEFAULT_URI='qemu:///system' \
  && export DISK_FILE='\$(readlink -f ${REMOTE_DIR}/build/tmp/deploy/images/qemux86-64/xoros-image-devel-qemux86-64.wic.vmdk)' \
  && virt-install \
    --import \
    --name $vm \
    --graphics vnc,port=5900 \
    --vcpus 4 \
    --memory 512 \
    --network default \
    --os-type=linux \
    --os-variant=generic \
    --force \
    --noautoconsole \
    --disk $DISK_FILE"

echo "$qemu_command"

ssh ${REMOTE_USER}@${REMOTE_HOST} "$command && $qemu_command"

virt-manager -c qemu+ssh://${REMOTE_USER}@${REMOTE_HOST}/system --show-domain-console $vm
