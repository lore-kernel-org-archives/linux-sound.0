From: Pavel Roskin <proski@gnu.org>
Date: Tue, 25 Sep 2001 17:34:16 +0000
Subject: [PATCH] VIA sound driver now works on AOpen AK-33
Message-Id: <marc-linux-sound-100143922028062@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello!

The driver for VIA 82Cxxx sound from the AC kernels is almost useless on
AOpen AK-33 motherboard - it reports that the dsp rate is locked at 48k.
Most programs cannot deal with it.

The driver from CVS maintained by Jeff Garzik
(http://sourceforge.net/projects/gkernel/) works much better - it doesn't
report that the frequency is locked.  Most applications work, although
xanim and realplayer sometimes produce an unpleasant noise.

The problem with Jeff's driver is that it resets the dsp format (stereo,
16-bit) on SNDCTL_DSP_RESET, unlike other drivers.

Another problem is that the pci resources are freed twice, which causes
alarming, although harmless, warnings when the driver is unloaded.

After fixing those problems the driver works just fine.  No problems
whatsoever.

Patch from Jeff's version to my fixed version (small):
http://www.red-bean.com/~proski/viasound/jg-pr.diff

Patch from 2.4.9-ac15 to my fixed version:
http://www.red-bean.com/~proski/viasound/ac-pr.diff

Whole driver:
http://www.red-bean.com/~proski/viasound/via82cxxx_audio.c

I'm not ready to comment on the Jeff's part of the patch.  I think it will
be better if Jeff submits the new driver.  I'm posting my results for
those who just want a working driver now.

-- 
Regards,
Pavel Roskin

