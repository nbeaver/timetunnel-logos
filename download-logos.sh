#! /usr/bin/env bash

wget --output-document="/tmp/timetunnel-4.22.tar.gz" "http://www.zettix.com/Graphics/timetunnel/timetunnel-4.22.tar.gz"
tar --ungzip --extract --file "/tmp/timetunnel-4.22.tar.gz" --directory "/tmp/"
mkdir --parents "$HOME/icons/timetunnel/"
cp '/tmp/xscreensaver-4.22/hacks/images/'{tardis.xpm,whohead1.xpm,whologo.xpm} "$HOME/icons/timetunnel/"

script_dir="$(dirname "$0")"

patch --normal --forward "$HOME/.xscreensaver" "$script_dir/timetunnel-logos.patch"
