#! /usr/bin/env bash

script_dir="$(dirname "$0")"

patch_file="$script_dir/timetunnel-logos.patch"

if [ -e "$patch_file" ]; then
	patch --unified --forward "$HOME/.xscreensaver" "$script_dir/timetunnel-logos.patch"
	exit 0
else
	echo "Error: cannot find patch file at: $patch_file"
	echo "Maybe patch ~/.xscreensaver manually?"
	exit 1
fi
