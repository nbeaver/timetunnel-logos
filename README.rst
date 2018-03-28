.. -*- coding: utf-8 -*-

============================
Installing timetunnel logos.
============================

:Author: Nathaniel Beaver
:Copyright: This document has been placed in the public domain.

--------------------------
Installation instructions.
--------------------------

#. Make sure ``timetunnel`` is installed. On Debian it is in the ``xscreensaver-gl-extra`` package.
#. Download the scripts and patchfile.
   
   ::

       $ git clone 'https://github.com/nbeaver/timetunnel-logos'
       $ cd timetunnel-logos/

#. Run ``make install`` to download and install the logos
   and patch ``~/.xscreensaver``.
#. Run ``make demo`` to make sure that it worked.

The `timetunnel`_ screensaver by Sean Brennan
is a delightful tribute to the famous BBC sci-fi series "`Doctor Who`_",
recreating the `title sequence`_ for the much-beloved `Fourth Doctor`_,
played by Tom Baker.

.. _timetunnel: http://www.zettix.com/Graphics/timetunnel/
.. _Doctor Who: http://www.doctorwho.tv/
.. _title sequence: https://www.youtube.com/watch?v=hvuvljREPlI
.. _Fourth Doctor: https://en.wikipedia.org/wiki/Fourth_Doctor

Unfortunately, the copyrighted images cannot be included in the official release,
despite a `longstanding request`_ for permission to do so.

.. _longstanding request: http://www.zettix.com/Graphics/timetunnel/permission/sean-1-14-2006.txt

Fortunately, the `images`_ are available from Sean Brennan's website,
and I've written some scripts and a Makefile to make downloading them
and configuring XScreenSaver to use them relatively painless.
Just run ``make``.

.. _images: http://www.zettix.com/Graphics/timetunnel/xscreensaver-4.22/hacks/images/

Enjoy!

------------------
Technical details.
------------------

The `download-logos.sh <./download-logos.sh>`_ script does this:

#. Check ``~/.local/share/icons/xscreensaver/timetunnel`` for images named ``tardis.xpm``, ``whohead1.xpm``, and ``whologo.xpm``.
#. Do nothing if they already exist, otherwise:
#. Use ``wget`` to download a tar file into ``/tmp/``.
#. Unzip the tar file into ``/tmp/``.
#. Copy some of the unzipped images to ``~/.local/share/icons/xscreensaver/timetunnel``.

The `patch-xscreensaver-config.sh <./patch-xscreensaver-config.sh>`_ script does this:

#. Try to find the ``timetunnel-logos.patch`` patchfile in the directory the script was called from.
#. Patch ``~/.xscreensaver`` so that XScreensaver can find the icons.

The makefile just runs both of the scripts.

----
TODO
----

This has only been tested with XScreenSaver 5.15 on Debian Wheezy.

It might be nice to be able to choose the installation directory by editing the Makefile,
but this would require some fiddling to generate the patchfile.

-------
License
-------

This project is licensed under the terms of the `MIT license`_.

.. _MIT license: LICENSE.txt
