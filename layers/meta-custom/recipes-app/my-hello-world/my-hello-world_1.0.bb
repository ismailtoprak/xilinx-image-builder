SUMMARY = "Hello World Example"

LICENSE = "CLOSED"

SRC_URI = "file://my-hello-world.c"

S = "${WORKDIR}"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} my-hello-world.c -o my-hello-world
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 my-hello-world ${D}${bindir}
}

