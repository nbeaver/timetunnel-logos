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
    echo "Already installed images in ${INSTALL}"
else
    wget --output-document="/tmp/timetunnel-4.22.tar.gz" "${URL}"
    tar --ungzip --extract --file "/tmp/timetunnel-4.22.tar.gz" --directory "/tmp/"
    mkdir --parents "${INSTALL}"
    cp '/tmp/xscreensaver-4.22/hacks/images/'{tardis.xpm,whohead1.xpm,whologo.xpm} "${INSTALL}"
    echo "Copied images to ${INSTALL}"
fi
