#!/bin/sh

### Set default branch name if XOROS_YOCTO is undefined
DEFAULT_BRANCH=${XOROS_YOCTO:-dunfell}

git clone git://git.yoctoproject.org/poky --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/openembedded/meta-openembedded.git --branch="${DEFAULT_BRANCH}" --depth=1
git clone git://git.openembedded.org/openembedded-core --branch="${DEFAULT_BRANCH}" --depth=1
git clone git://git.openembedded.org/meta-python2 --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/kraj/meta-clang.git --branch="${DEFAULT_BRANCH}-clang12" --depth=1
git clone https://github.com/OSSystems/meta-browser.git --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/rauc/meta-rauc.git --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/rauc/meta-rauc-community.git --branch="${DEFAULT_BRANCH}" --depth=1
git clone git://git.yoctoproject.org/meta-raspberrypi --branch="${DEFAULT_BRANCH}" --depth=1
git clone git://git.yoctoproject.org/meta-freescale --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/Freescale/meta-freescale-3rdparty.git --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/Freescale/meta-freescale-distro.git --branch="${DEFAULT_BRANCH}" --depth=1
git clone https://github.com/varigit/meta-variscite-fslc.git --branch="${DEFAULT_BRANCH}" --depth=1
