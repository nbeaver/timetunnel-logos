#! /usr/bin/env bash

if test $# -ne 1
then
    printf "Usage: %s %s\n" "$0" "${HOME}/.xscreensaver" >&2
    exit 1
fi

CONFIG_FILE="$1"

patch "${CONFIG_FILE}" << EOF
227c227,232
< - GL: 				timetunnel -root			    \n\\
---
>   GL: 				timetunnel -root -tardis		      \\
> 				  \$HOME/.local/share/icons/xscreensaver/timetunnel/tardis.xpm   \\
> 				  -head					      \\
> 				  \$HOME/.local/share/icons/xscreensaver/timetunnel/whohead1.xpm   \\
> 				  -marquee				      \\
> 				  \$HOME/.local/share/icons/xscreensaver/timetunnel/whologo.xpm \n\\
EOF
