#! /usr/bin/env bash

URL="http://www.zettix.com/Graphics/timetunnel/timetunnel-4.22.tar.gz"
INSTALL="$HOME/.local/share/icons/xscreensaver/timetunnel"
if ! test -d "${INSTALL}"
then
    mkdir -p "${INSTALL}"
fi
# Check if any of the images are missing.
if test -f "${INSTALL}/tardis.xpm" && test -f "${INSTALL}/whohead1.xpm" && test -f "${INSTALL}/whologo.xpm"
then
    printf "Error: already installed images in ${INSTALL}\n" >&2
    exit 1
fi

TMPDIR=$(mktemp -d)
TARFILE="${TMPDIR}/timetunnel.tar.gz"
if ! wget --output-document="${TARFILE}" "${URL}"
then
    printf "Error: could not download from URL: ${URL}\n" >&2
    exit 1
fi

if ! tar -z -x -f "${TARFILE}" -C "${TMPDIR}"
then
    printf "Error: could not untar: ${TARFILE}\n" >&2
    exit 1
fi

if ! test -d "${INSTALL}"
then
    printf "Error: install directory does not exist: ${INSTALL}\n" >&2
    exit 1
fi

ICON1="${TMPDIR}/xscreensaver-4.22/hacks/images/tardis.xpm"
if ! test -f "${ICON1}"
then
    printf "Error: missing icon should be at: ${ICON1}\n" >&2
    exit 1
fi
ICON2="${TMPDIR}/xscreensaver-4.22/hacks/images/whohead1.xpm"
if ! test -f "${ICON2}"
then
    printf "Error: missing icon should be at: ${ICON2}\n" >&2
    exit 1
fi
ICON3="${TMPDIR}/xscreensaver-4.22/hacks/images/whologo.xpm"
if ! test -f "${ICON3}"
then
    printf "Error: missing icon should be at: ${ICON3}\n" >&2
    exit 1
fi
if ! cp "${ICON1}" "${ICON2}" "${ICON3}" "${INSTALL}"
    printf "Error: cannot copy to: ${INSTALL}\n" >&2
    exit 1
fi
