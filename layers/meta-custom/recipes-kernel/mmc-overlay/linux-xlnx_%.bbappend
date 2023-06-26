FILESEXTRAPATHS_prepend := "${THISDIR}/files/k26-kv:"

SRCREV_FORMAT:kria = "device-tree"

SRC_URI += " file://k26-kv_disable_wp_overlay.dts"
