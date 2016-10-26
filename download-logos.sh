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
if ! wget --output-document="${TMPDIR}/timetunnel-4.22.tar.gz" "${URL}"
then
    printf "Error: could not download from URL: ${URL}\n" >&2
    exit 1
fi

tar --ungzip --extract --file "${TMPDIR}/timetunnel-4.22.tar.gz" --directory "${TMPDIR}"

if ! test -d "${INSTALL}"
then
    printf "Error: install directory does not exist: ${INSTALL}\n" >&2
    exit 1
fi

cp "${TMPDIR}/xscreensaver-4.22/hacks/images/"{tardis.xpm,whohead1.xpm,whologo.xpm} "${INSTALL}"
echo "Copied images to ${INSTALL}"
