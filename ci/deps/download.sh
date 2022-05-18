#!/bin/bash

git clone https://github.com/openembedded/meta-openembedded.git --branch="dunfell" --depth=1
git clone git://git.openembedded.org/openembedded-core --branch="dunfell" --depth=1
git clone git://git.openembedded.org/meta-python2 --branch="dunfell" --depth=1
git clone https://github.com/kraj/meta-clang.git --branch="dunfell-clang12" --depth=1
git clone https://github.com/OSSystems/meta-browser.git --branch="dunfell" --depth=1
git clone https://github.com/rauc/meta-rauc.git --branch="dunfell" --depth=1
git clone https://github.com/rauc/meta-rauc-community.git --branch="dunfell" --depth=1
git clone git://git.yoctoproject.org/meta-raspberrypi --branch="dunfell" --depth=1
git clone git://git.yoctoproject.org/meta-freescale --branch="dunfell" --depth=1
git clone https://github.com/Freescale/meta-freescale-3rdparty.git --branch="dunfell" --depth=1
git clone https://github.com/Freescale/meta-freescale-distro.git --branch="dunfell" --depth=1
git clone https://github.com/varigit/meta-variscite-fslc.git --branch="dunfell" --depth=1
