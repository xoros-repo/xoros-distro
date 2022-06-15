#!/bin/bash

### Default board is qemux86-64
XOROS_BOARD=${1:-qemux86-64}

__usage="
Usage: $(basename $0) [OPTIONS]

Options:
  var-som-mx6
  raspberrypi4
  qemux86-64
  genericx86-64
"

if  [ "${XOROS_BOARD}" = "var-som-mx6" ] || \
    [ "${XOROS_BOARD}" = "raspberrypi4" ] || \
    [ "${XOROS_BOARD}" = "qemux86-64" ] || \
    [ "${XOROS_BOARD}" = "genericx86-64" ]
then
	echo "Building XOROS for target: ${XOROS_BOARD}"
else
	echo "Invalid target selected!"
  echo "$__usage"
  exit 1
fi

echo "Starting build"

export DISTRO=xoros
XOROS_IMAGE=${DISTRO}-image-devel

XOROS_YOCTO=kirkstone
export XOROS_YOCTO

XOROS_PWD=$(pwd)
XOROS_META_DIR=${XOROS_PWD}/sources/meta-xoros
XOROS_IMAGETYPE=wic.gz

export TEMPLATECONF=${XOROS_META_DIR}/conf/samples

source "${XOROS_PWD}"/sources/poky/oe-init-build-env

echo "BBPATH=${BBPATH}"

### Caching. See README.md#caching
if [ -z ${BUILDER_CACHE_DIR+x} ]; then
  echo "BUILDER_CACHE_DIR is not set"
else
  BB_SSTATE_DIR=${BUILDER_CACHE_DIR}/sstate
  echo "Using SSTATE cache directory ${BB_SSTATE_DIR}..."
  mkdir -p "${BB_SSTATE_DIR}"
  echo "SSTATE_DIR ?= \"${BB_SSTATE_DIR}\"" >> "${BBPATH}"/conf/local.conf
  BB_DL_DIR=${BUILDER_CACHE_DIR}/download
  mkdir -p "${BB_DL_DIR}"
  echo "DL_DIR ?= \"${BB_DL_DIR}\"" >> "${BBPATH}"/conf/local.conf
fi

cd "${BBPATH}" || exit 1

export MACHINE=${XOROS_BOARD}

set -e
bitbake-layers show-layers

bitbake ${XOROS_IMAGE} ${BITBAKE_OPTS}

BB_EXIT_CODE=$?

cd "${XOROS_PWD}"; exit $BB_EXIT_CODE
