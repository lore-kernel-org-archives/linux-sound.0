From: Santos Halpar <sjhalpar@yahoo.com>
Date: Wed, 23 Jun 1999 20:17:52 +0000
Subject: ES1371 problems
Message-Id: <marc-linux-sound-93017242300244@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Sadly, /usr/src/linux/Documentation/sound/es1371 and the other
files I've read in that directory don't appear to answer this, nor
does reading the es1371 driver source's comments.

Platform: Red Hat 6.0, ESS 1371

Problem: Sound doesn't work.  When I load the es1371 (and soundcore)
modules, I can hear the speakers pop.  I can play CDs and control
the mixer with no problems, but any attempt to play sound files
with e.g. "play file.wav" fails.  Quake2 and various Gnome apps
similarly fail to play anything.  cat'ing /dev/sndstat gives
"cat: /dev/sndstat: No such device", which would indicate that I
need to load the appropriate module -- but es1371 isn't one of the
OSS modules, so I'm not too sure about that.  Insmoding sound and
soundlow lets /dev/sndstat work, but the Installed drivers section
is empty (as are all the fields save the system clock in timers).
That makes sense, since es1371 is a soundcore client, right?

If I run "play file.wav", it hangs until I kill the
spawned sox process -- sndconfig hangs similarly when it tries
to play a sample file.  It's not a volume issue and sound works
fine in NT.

I've never used an es1371 under Linux before, so it hasn't been
working in the past with 2.0 kernels or anything like that.  Fails
with 2.2.5/Red Hat and with vanilla 2.2.10, modular and built-in.

While es1371.o and soundcore.o are loaded:

cat /dev/sndstat says "No such device".

There is no /proc/sound.

Controlling the mixer with gmix or other apps works, as does playing
CDs.

lspci -v reveals (among others):

00:0f.0 Multimedia audio controller: Ensoniq ES1371 (rev 02)
        Subsystem: Unknown device 1274:1371
        Flags: slow devsel, IRQ 11
        I/O ports at 1080
        Capabilities: [dc] Power Management version 1


Any ideas?  I'm sure I'm doing something stupid, but can't for the
life of me find it.

ALSA appears to support the 1371 -- should I be trying that?

--Sumner


_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
