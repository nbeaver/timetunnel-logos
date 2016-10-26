ICONDIR = $(HOME)/.local/share/icons/xscreensaver/timetunnel/
LOGOS = $(ICONDIR)/tardis.xpm $(ICONDIR)/whohead1.xpm $(ICONDIR)/whologo.xpm
.PHONY : install download

$(LOGOS) : download-logos.sh
	./download-logos.sh
install: download patch-xscreensaver-config.sh timetunnel-logos.patch
	./patch-xscreensaver-config.sh
download : download-logos.sh
	./download-logos.sh
