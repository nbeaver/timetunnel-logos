#! /usr/bin/env bash

script_dir="$(dirname "$0")"

patch_file="$script_dir/timetunnel-logos.patch"

if ! test -f "$patch_file"
then
    echo "Error: cannot find patch file at: $patch_file"
    echo "Maybe patch ~/.xscreensaver manually?"
    exit 1
fi

patch --unified --forward --fuzz "$HOME/.xscreensaver" "$script_dir/timetunnel-logos.patch"
