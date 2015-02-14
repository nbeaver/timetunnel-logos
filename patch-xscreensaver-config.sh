#! /usr/bin/env bash

script_dir="$(dirname "$0")"

patch_file="$script_dir/timetunnel-logos.patch"

if [ -e "$patch_file" ]; then
	if patch --unified --forward --fuzz "$HOME/.xscreensaver" "$script_dir/timetunnel-logos.patch";
	then
		exit 0
	else
		echo "Maybe patch ~/.xscreensaver manually?"
		exit 1
	fi
else
	echo "Error: cannot find patch file at: $patch_file"
	echo "Maybe patch ~/.xscreensaver manually?"
	exit 1
fi
