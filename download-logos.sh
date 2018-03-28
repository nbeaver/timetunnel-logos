#! /usr/bin/env bash

URL='http://www.zettix.com/Graphics/timetunnel/xscreensaver-4.22/hacks/images/'
if test $# -ne 1
then
    printf "Usage: %s %s\n" "$0" "${HOME}/.local/share/icons/xscreensaver/timetunnel" >&2
    exit 1
fi
INSTALL="$1"

wget --no-verbose --no-clobber --recursive --level=1 --no-parent --no-directories \
  --accept xpm \
  --directory-prefix="${INSTALL}" \
  "$URL"
