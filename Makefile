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

test : $(TEST_LOGOS)

$(TEST_LOGOS) : download-logos.sh
	./download-logos.sh $(TESTDIR)

clean :
	rm -f test/*
