From: "Nerijus" <nerijus@sat.lt>
Date: Sun, 30 Jan 2000 17:36:02 +0000
Subject: FW: power managing maestro.c 0.14 available.
Message-Id: <marc-linux-sound-94925434115611@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

-----Original Message-----
From: owner-linux-kernel@vger.rutgers.edu
[mailto:owner-linux-kernel@vger.rutgers.edu] On Behalf Of Zach Brown
Sent: Friday, January 28, 2000 8:16 PM
To: linux-kernel@vger.rutgers.edu
Subject: power managing maestro.c 0.14 available.


Hello all you sound freaks.

a new version of the maestro driver is on
	http://people.redhat.com/zab/maestro/maestro-20000128.tar.gz

It has some little things like larger pcm buffers, smarter
behaviour on encountering ESS 1921 AC-97s, and unswapped
left/right channels on stereo pcm playback.  ( insert
head A into paper bag B ).  

The big new exciting feature is the concept of power managment
in the driver.  The driver now keeps the chip in a lower
power state while idle.  (it just keeps enough going to 
keep the ac97 fed so things like the on board CD work.)
It turns things on and off as /dev/dsp is accessed.  It also
powers the chip down entirely when the module is removed.

This marks a pretty big jump in functionality so I'd appreciate
people beating on it pretty heavily before I push it into the
kernel.  I'm _especially_ interested in reports of suspend and
'shutdown -r' working after the driver has been inserted.

All this power management stuff was needed because certain BIOS
init code was hanging when it found an active maestro on bootup.
Rather than guess just how it was confusing things, we just
shut the chip down on reboot.  I want to make sure that I haven't
just traded one confused set of BIOSen for another.

-- 
Zach Brown <zab@redhat.com> -- Software Princess

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/
