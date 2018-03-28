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
#. Download the git repository.
   
   ::

       $ git clone 'https://github.com/nbeaver/timetunnel-logos'
       $ cd timetunnel-logos/

#. Run ``make install`` to download and install the logos
   and patch ``~/.xscreensaver``.
#. Run ``make demo`` to make sure that it worked.

----------
Background
----------

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

---------------
Troubleshooting
---------------

If you have changed the ``timetunnel`` line in ``~/.xscreensaver``,
the patch may fail. In that case, run

::

    $ xscreensaver-demo

and under "Display Modes" navigate to "TimeTunnel",
then press the "Settings..." button.
Click "Advanced >>" and enter this as the "Command Line:" entry::

    timetunnel -root -tardis $HOME/.local/share/icons/xscreensaver/timetunnel/tardis.xpm -head $HOME/.local/share/icons/xscreensaver/timetunnel/whohead1.xpm -marquee $HOME/.local/share/icons/xscreensaver/timetunnel/whologo.xpm

-------
License
-------

This project is licensed under the terms of the `MIT license`_.

.. _MIT license: LICENSE.txt
