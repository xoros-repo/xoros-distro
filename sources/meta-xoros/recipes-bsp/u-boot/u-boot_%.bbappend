FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://xoros.bmp"

do_unpack:append() {
    os.system("cp ${PWD}/xoros.bmp ${PWD}/git/tools/logos/")
}
