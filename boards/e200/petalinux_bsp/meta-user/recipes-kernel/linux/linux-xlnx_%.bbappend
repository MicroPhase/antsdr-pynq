FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg \
                   file://0001-add-support-for-adi-linux-kernel.patch "
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2024-01-31-03-28-00.cfg \
            file://user_2024-01-31-04-52-00.cfg \
            "

