ICONDIR :=$(HOME)/.local/share/icons/xscreensaver/timetunnel/
LOGOS :=$(ICONDIR)/tardis.xpm $(ICONDIR)/whohead1.xpm $(ICONDIR)/whologo.xpm
TESTDIR :=./test
TEST_LOGOS :=$(TESTDIR)/tardis.xpm $(TESTDIR)/whohead1.xpm $(TESTDIR)/whologo.xpm
.PHONY : install uninstall download-logos patch demo test clean

install:
	./install.sh

uninstall :
	rm -rf ~/.local/share/icons/xscreensaver/timetunnel
	patch --reverse ~/.xscreensaver timetunnel-logos.patch

download-logos : download-logos.sh
	./download-logos.sh $(ICONDIR)

patch : patch-xscreensaver-config.sh
	./patch-xscreensaver-config.sh ~/.xscreensaver

demo :
	./demo.sh

demo-no-install : $(TEST_LOGOS)
	/usr/lib/xscreensaver/timetunnel -tardis $(TESTDIR)/tardis.xpm -head $(TESTDIR)/whohead1.xpm -marquee $(TESTDIR)/whologo.xpm

test : $(TEST_LOGOS)
	./patch-xscreensaver-config.sh xscreensaver.txt

timetunnel-logos.patch : xscreensaver-unpatched.txt
	diff xscreensaver-unpatched.txt xscreensaver-patched.txt > $@ || if test $$? -eq 1; then exit 0; else exit 1; fi

$(TEST_LOGOS) : download-logos.sh
	./download-logos.sh $(TESTDIR)

clean :
	rm -f -- $(TEST_LOGOS)
	cp xscreensaver-unpatched.txt xscreensaver.txt
