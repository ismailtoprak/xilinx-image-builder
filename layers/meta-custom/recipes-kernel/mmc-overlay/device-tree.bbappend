FILESEXTRAPATHS:prepend := "${THISDIR}/files/k26-kv:"

# SYSTEM_USER_DTSI ?= "k26-kv_disable_wp_overlay.dts"
EXTRA_DT_FILES:append = "k26-kv_disable_wp_overlay.dts"

do_configure:append() {
        cp ${WORKDIR}/k26-kv_disable_wp_overlay.dts ${B}/device-tree
        echo "/include/ \"k26-kv_disable_wp_overlay.dts\"" >> ${B}/device-tree/system-top.dts
}
