#! /usr/bin/env bash

INSTALL="$HOME/.local/share/icons/xscreensaver/timetunnel"
# Check if any of the images are missing.
if [[ -f "$INSTALL/tardis.xpm" && -f "$INSTALL/whohead1.xpm" && -f "$INSTALL/whologo.xpm" ]]; then
	echo "Already installed images in $INSTALL"
else
	wget --output-document="/tmp/timetunnel-4.22.tar.gz" "http://www.zettix.com/Graphics/timetunnel/timetunnel-4.22.tar.gz"
	tar --ungzip --extract --file "/tmp/timetunnel-4.22.tar.gz" --directory "/tmp/"
	mkdir --parents "$INSTALL"
	cp '/tmp/xscreensaver-4.22/hacks/images/'{tardis.xpm,whohead1.xpm,whologo.xpm} "$INSTALL"
	echo "Copied images to $INSTALL"
fi
