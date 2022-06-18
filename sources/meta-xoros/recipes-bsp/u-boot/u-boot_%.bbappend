FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://xoros.bmp"

#do_unpack:append() {
#    os.system("cp ${PWD}/xoros.bmp ${PWD}/git/tools/logos/")
#}

#do_configure:prepend() {
#        sed -i -e 's,CONFIG_DEFAULT_DEVICE_TREE=,CONFIG_DEFAULT_DEVICE_TREE= ${BOARD_DEVICE_TREE},g'  ${S}configs/mx7ulp_evk_defconfig
#}
