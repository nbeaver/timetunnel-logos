LOGOS = $(HOME)/.local/share/icons/xscreensaver/timetunnel/tardis.xpm $(HOME)/.local/share/icons/xscreensaver/timetunnel/whohead1.xpm $(HOME)/.local/share/icons/xscreensaver/timetunnel/whologo.xpm
# Prevent make from looking for a file called 'install'
.PHONY : install
# Prevent make from running multiple downloads.
.PHONY: download

$(LOGOS) : download-logos.sh
	./download-logos.sh
install: download Makefile patch-xscreensaver-config.sh timetunnel-logos.patch
	./patch-xscreensaver-config.sh
download : Makefile download-logos.sh
	./download-logos.sh
