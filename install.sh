#! /usr/bin/env bash

wget --no-verbose --no-clobber --recursive --level=1 --no-parent --no-directories \
  --accept xpm \
  --directory-prefix="${HOME}/.local/share/icons/xscreensaver/timetunnel" \
  'http://www.zettix.com/Graphics/timetunnel/xscreensaver-4.22/hacks/images/'

patch ~/.xscreensaver << EOF
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
