![](docs/img/logo.png)

# Xoros Yocto Layer

## Build Setup

1. Create a new Project directory for the XOR OS build.
2. Create "sources" directory inside the pProject directory.
3. Inside the Project directory clone the meta-xoros layer.
4. Also the following other layers are to be added for complete build setup.

All the required layers to build XOROS image are:

[meta-xoros repo link](https://github.com/xoros-repo/meta-xoros.git)
[meta-openembedded repo link](https://github.com/openembedded/meta-openembedded.git)
[openembedded-core repo link](https://git.openembedded.org/openembedded-core)
[meta-python2 repo link](https://git.openembedded.org/meta-python2)	
[meta-clang repo link](https://github.com/kraj/meta-clang.git)
[meta-browser repo link](https://github.com/OSSystems/meta-browser.git)
[meta-rauc repo link](https://github.com/rauc/meta-rauc.git)
[meta-rauc-community repo link](https://github.com/rauc/meta-rauc-community.git)
[meta-raspberrypi repo link](https://git.yoctoproject.org/meta-raspberrypi)
[meta-freescale repo link](https://git.yoctoproject.org/git/meta-freescale)
[meta-freescale-3rdparty repo link](https://github.com/Freescale/meta-freescale-3rdparty.git)
[meta-freescale-distro repo link](https://github.com/Freescale/meta-freescale-distro.git)
[meta-variscite-fslc repo link](https://github.com/varigit/meta-variscite-fslc.git)

Checkout dunfell branch for following layers:
1. meta-openembedded
2. openembedded-core
3. meta-python2
4. meta-rauc
5. meta-rauc-community
6. meta-raspberrypi
7. meta-freescale
8. meta-freescale-3rdparty
9. meta-freescale-distro
10. meta-variscite-fslc

For meta-clang checkout branch dunfell-clang12.

## Build 

To start build for a particular target go to the Project directory and use command:
source sources/meta-xoros/build.sh <target_name>

Following targets are acceptable:
1. genericx86-64
2. qemux86-64
3. raspberrypi4
4. var-som-mx6

The build will start automatically.

### Caching

The builder script will use the value of BUILDER_CACHE_DIR environment variable to set SSTATE cache.
For more info see:
https://wiki.yoctoproject.org/wiki/Enable_sstate_cache

### GitHub actions (preferred)

Entire build process is done in docker image [xoros-builder](https://github.com/xoros-repo/xoros-builder) (https://github.com/xoros-repo/xoros-builder).

### Build using local docker

### Caching

## QEMU Host

OVMF is required for UEFI emulation

```shell
sudo apt-get install qemu-kvm ovmf
```

