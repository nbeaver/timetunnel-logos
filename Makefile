ICONDIR = $(HOME)/.local/share/icons/xscreensaver/timetunnel/
LOGOS = $(ICONDIR)/tardis.xpm $(ICONDIR)/whohead1.xpm $(ICONDIR)/whologo.xpm
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
