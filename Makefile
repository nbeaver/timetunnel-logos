ICONDIR = $(HOME)/.local/share/icons/xscreensaver/timetunnel/
LOGOS = $(ICONDIR)/tardis.xpm $(ICONDIR)/whohead1.xpm $(ICONDIR)/whologo.xpm
TESTDIR = ./test
TEST_LOGOS = $(TESTDIR)/tardis.xpm $(TESTDIR)/whohead1.xpm $(TESTDIR)/whologo.xpm
.PHONY : install download test clean

$(LOGOS) : download-logos.sh
	./download-logos.sh $(ICONDIR)

install: download patch-xscreensaver-config.sh timetunnel-logos.patch
	./patch-xscreensaver-config.sh ~/.xscreensaver

download : download-logos.sh
	./download-logos.sh $(ICONDIR)

demo :
	./demo.sh

demo-no-install : $(TEST_LOGOS)
	/usr/lib/xscreensaver/timetunnel -tardis $(TESTDIR)/tardis.xpm -head $(TESTDIR)/whohead1.xpm -marquee $(TESTDIR)/whologo.xpm

test : $(TEST_LOGOS)

timetunnel-logos.patch : xscreensaver-unpatched.txt
	diff xscreensaver-unpatched.txt xscreensaver-patched.txt > $@ || if test $$? -eq 1; then exit 0; else exit 1; fi

$(TEST_LOGOS) : download-logos.sh
	./download-logos.sh $(TESTDIR)

clean :
	rm -f -- $(TEST_LOGOS)
