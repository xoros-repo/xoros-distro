

do_configure:prepend() {
	cd ${S}
	${S}/bootstrap
	cd ${B}
}