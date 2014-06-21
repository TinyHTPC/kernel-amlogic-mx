#/bin/sh
#
### First add Toolchain to path ###
#PATH=$PATH:../toolchain/arm-2010q1/bin/
#

### Make output folder ###
mkdir -p output
### Build ###
make meson6_g18_jbmr1_linux_defconfig
make -j4 LOCALVERSION=-MX
### Make modules ###
make modules_install LOCALVERSION=-MX INSTALL_MOD_PATH=output
### Copy Modules to output folder ###
cp -rfv output/lib/modules/* output/
rm -rfv output/lib
### Build uImage ###
make uImage -j4 LOCALVERSION=-MX
### Copy uImage to output folder ###
cp -rfv arch/arm/boot/uImage output/
