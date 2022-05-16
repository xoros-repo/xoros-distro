#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Run script with target device from below options:"
	echo ""
	echo "sh build.sh var-som-mx6"
	echo "OR"
	echo "sh build.sh raspberrypi4"
	echo "OR"
	echo "sh build.sh qemux86-64"
	echo "OR"
	echo "sh build.sh genericx86-64"
	exit 1
fi

if [ "$1" = "var-som-mx6" ] || [ "$1" = "raspberrypi4" ] || [ "$1" = "qemux86-64" ] || [ "$1" = "genericx86-64" ]; then
	echo "Building XOROS for target:i $1"
else
	echo "Invalid target selected!"
	echo "Select target from below options:"
	echo "1. var-som-mx6"
	echo "2. raspberrypi4"
	echo "3. qemux86-64"
	echo "4. genericx86-64"
	exit 1
fi

echo "---- System information ----------------"
echo "--- Storage ----------------------------"
df -h

echo "--- Memory -----------------------------"
free

echo "--- Processor --------------------------"
lscpu

echo "----------------------------------------"

echo "Starting build"

XOROS_IMAGE=xoros
XOROS_BOARD=$1
#XOROS_BOARD=var-som-mx6
#XOROS_BOARD=raspberrypi4
#XOROS_BOARD_SET=qemux86-64 raspberrypi4

XOROS_YOCTO=dunfell

XOROS_PWD=$PWD
XOROS_IMAGETYPE=wic.gz

source ${XOROS_PWD}/sources/poky/oe-init-build-env build

cat ${XOROS_PWD}/sources/meta-xoros/conf/${XOROS_BOARD}/bblayers.conf > conf/bblayers.conf
cat ${XOROS_PWD}/sources/meta-xoros/conf/${XOROS_BOARD}/local.conf <(echo) ${XOROS_PWD}/sources/meta-xoros/conf/local.conf > conf/local.conf

bitbake-layers show-layers
#bitbake -c cleanall ${XOROS_IMAGE}
bitbake ${XOROS_IMAGE}

BB_EXIT_CODE=$?

if [ ${BB_EXIT_CODE} -eq 0 ]; then
	IMG_TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
	XOROS_IMGS_PATH=${XOROS_PWD}/build/tmp/deploy/images/${XOROS_BOARD}/
	mkdir -p /var/www/html/artifacts/${XOROS_BOARD}/
	if [ "${XOROS_BOARD}" == "raspberrypi4" ] || [ "${XOROS_BOARD}" = "qemux86-64" ] || [ "${XOROS_BOARD}" = "genericx86-64" ] ; then
		XOROS_DEPLOY=${XOROS_IMGS_PATH}/${XOROS_IMAGE}-${XOROS_BOARD}.ext4
		XOROS_UPDATE=${XOROS_IMGS_PATH}/update-bundle-${XOROS_BOARD}.raucb
		if [ -f ${XOROS_DEPLOY} ]; then
    			cp -p ${XOROS_DEPLOY} /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-${XOROS_IMAGE}-${XOROS_BOARD}.ext4
		else
			echo "Image file not found!"
		fi

		if [ -f ${XOROS_UPDATE} ]; then
    			cp -p ${XOROS_UPDATE} /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-${XOROS_IMAGE}-${XOROS_BOARD}.raucb
		else
			echo "Update file not found!"
		fi
	else
		for f in ${XOROS_IMGS_PATH}*.dtb; do
			if [[ -L $f ]] && [[ $f != *var-som-mx6.dtb ]]; then
				cp $f /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-${f##*/}
			else
				echo "Cannot copy dtb file ${f##*/}!"
			fi
		done

		if [ -f ${XOROS_IMGS_PATH}/SPL-nand ]; then
			cp ${XOROS_IMGS_PATH}/SPL-nand /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-SPL-nand
		fi

		if [ -f ${XOROS_IMGS_PATH}/u-boot.img-nand ]; then
			cp ${XOROS_IMGS_PATH}/u-boot.img-nand /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-u-boot.img-nand
		else
			echo "U-boot file not found!"
		fi

		if [ -f ${XOROS_IMGS_PATH}/${XOROS_IMAGE}-${XOROS_BOARD}_256kbpeb.ubifs ]; then
			cp ${XOROS_IMGS_PATH}/${XOROS_IMAGE}-${XOROS_BOARD}_256kbpeb.ubifs  /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-${XOROS_IMAGE}-${XOROS_BOARD}.ubifs
		else
			echo "Root File System file not found!"
		fi

		XOROS_UPDATE=${XOROS_IMGS_PATH}/update-bundle-${XOROS_BOARD}.raucb
		if [ -f ${XOROS_UPDATE} ]; then
    			cp ${XOROS_UPDATE} /var/www/html/artifacts/${XOROS_BOARD}/${IMG_TIMESTAMP}-${XOROS_IMAGE}-${XOROS_BOARD}.raucb
		else
			echo "Update file not found!"
		fi

	fi
else
	echo "Bitbake returned exit code ${BB_EXIT_CODE}. Aborting..."
	exit $BB_EXIT_CODE
fi

cd ${XOROS_PWD}
