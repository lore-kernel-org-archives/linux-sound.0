From: "Georg C. F. Greve" <greve@fsfeurope.org>
Date: Mon, 27 Dec 2004 12:05:46 +0000
Subject: USB Headset: no sound / keyboard freeze, occasional kbd freeze or crash when unplugging
Message-Id: <m3652olzdx.fsf@reason.gnu-hamburg>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="20041227130547+0100-79623338-72224397-25818085"
List-Id: <linux-sound.vger.kernel.org>
To: linux-usb-devel@lists.sourceforge.net, alsa-devel@lists.sourceforge.net

--20041227130547+0100-79623338-72224397-25818085

Hi all,

sorry for the crossposting, but I am not sure whether this problem is
USB or ALSA related, since the ALSA code *seems* to work just
perfectly fine, but no sound ever comes out of the Headset, so it
*may* be a transport layer problem.

Got myself a Logitech USB Headset recently and tried to get it to work
on my workplace machine & laptop. Both machines showed the same
effects (running Kernel 2.6.9 initially and 2.6.10 now): Sound seems
to work, ALSA claims everything is fine but no sound is ever audible. [*]

Strangely, when first plugging it into the workplace machine, I could
get it to work: the snd-usb-audio module of ALSA was missing, so I
recompiled the kernel with that module and -- being too lazy -- did
not reboot, but simply installed the new kernel on disk in place of
the old one (which was still running) and loaded the module. Things
worked perfectly then, as far as I could tell -- crystal clear sound,
good recording.

Only after rebooting into the kernel that had been recompiled along
with the module did things stop working.

When unplugging/replugging the headset trying to get it to work, I
experienced strange phenomena: the keyboard would stop working, and
once it didn't work when I booted the machine with the headset plugged
in. In one case, I got a kernel crash reported to syslog.

Unfortunately, I could not reproduce this with a debugging enabled
kernel, so there is not much information, but what I had was filed as

 https://bugtrack.alsa-project.org/alsa-bug/view.php?id=745

and

 http://bugzilla.kernel.org/show_bug.cgi?id=3954

since I am not sure where the problem actually lies.

If you need more info, please let me know.

Regards,
Georg


[*] Yes, the mixer does work and are not muted/set to zero.

-- 
Georg C. F. Greve                                 <greve@fsfeurope.org>
Free Software Foundation Europe	                 (http://fsfeurope.org)
GNU Business Network                        (http://mailman.gnubiz.org)
Brave GNU World	                           (http://brave-gnu-world.org)

--20041227130547+0100-79623338-72224397-25818085
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.3.92 (GNU/Linux)

iD8DBQBBz/qbbvivwoZXSsoRAm0aAJ4us1C/x2Q59LEkMAXEnJ9G7BKiyACgs8xz
UYsegtxfHlp8czQekhZL/Hw=
=gVD0
-----END PGP SIGNATURE-----
--20041227130547+0100-79623338-72224397-25818085--
