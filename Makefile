# Prevent make from looking for a file called 'install'
.PHONY : install
# Prevent make from running multiple downloads.
.PHONY: download

install: download Makefile patch-xscreensaver-config.sh timetunnel-logos.patch
	./patch-xscreensaver-config.sh
download : Makefile download-logos.sh
	./download-logos.sh
